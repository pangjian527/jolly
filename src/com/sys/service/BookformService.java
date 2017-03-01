package com.sys.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.PageSettings;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.JsonFuncs;
import pub.functions.StrFuncs;
import pub.types.Pair;

import com.sys.dao.BookformDao;
import com.sys.dao.BookformDetailDao;
import com.sys.data.book.BookformData;
import com.sys.data.book.BookformProductData;
import com.sys.data.book.OrderData;
import com.sys.data.book.OrderDetailData;
import com.sys.data.cart.CartData;
import com.sys.data.cart.CartItem;
import com.sys.data.pay.PayInfo;
import com.sys.entity.Area;
import com.sys.entity.Bookform;
import com.sys.entity.BookformDetail;
import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.entity.LogPayment;
import com.sys.entity.Product;
import com.sys.entity.ProductItem;
import com.sys.entity.StockRecord;
import com.sys.entity.SysUser;
import com.web.mmall.entity.OrderEntity;
import com.web.utils.BookformPaymentCallbackUtils;

@Service
@Transactional(readOnly = true)
public class BookformService extends BaseService<Bookform>{
	
	private Logger logger = Logger.getLogger(BookformService.class);
	
	//用于商城、商家的后台订单管理Action调用
	public QueryResult query(String condition, QuerySettings settings){
		
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		
		Query query = new PagedQuery(settings);
		StringBuilder select = new StringBuilder();
		select.append( " t.*," +
				" (select count(1) from log_payment l where l.id = t.payment_Id and l.status = 1) " +
				"as online_payment, f.name as factoryname,a.full_name as areaname");
		
		StringBuilder where = new StringBuilder();
		
		if(queryJson.containsKey("FROM_FACTORY_USER")){
			this.addQueryEqualFilter(queryJson, where, query, "factoryId", 
				" and t.factory_id = :factoryId and t.status in (1, 2)");	
		}
		this.addQueryEqualFilter(queryJson, where, query, "status", 
				" and t.status = :status");	
		this.addQueryEqualFilter(queryJson, where, query, "provinceId", 
			" and t.contact_province_id = :provinceId");	
		this.addQueryEqualFilter(queryJson, where, query, "cityId", 
			" and t.contact_city_id = :cityId");	
		this.addQueryEqualFilter(queryJson, where, query, "countyId", 
			" and t.contact_county_id = :countyId");	
		
		this.addQueryLikeFilter(queryJson, where, query, "code", 
				" and t.code like :code");
		if(queryJson.containsKey("payType") && queryJson.getString("payType").equals("0")
				&& queryJson.containsKey("finishOnlinePay")){
			String value = queryJson.getString("finishOnlinePay");
			if("1".equals(value)){
				where.append(" and t.payment_id is not null");
			}
			else if("0".equals(value)){
				where.append(" and t.payment_id is null");
			}
		}
		
		this.addQueryDateFilter(queryJson, where, query, "startTime", 
			" and t.create_time >= :startTime");
		this.addQueryDateFilter(queryJson, where, query, "endTime", 
			" and t.create_time <= :endTime");
		
		query.select( select.toString())
			.from(" t_bookform t " 
				+ "left join t_factory f on t.factory_id = f.id left join t_area a on a.id = f.county_id ")
			.where( where.toString())
			.orderBy(" t.update_time desc ");	
		generalDao.execute(query);
		return query.getResult();
	}
	
	public BookformData getData(String id) throws Exception{
		if(StrFuncs.isEmpty(id)){
			throw new Exception("订单号不能为空");
		}
		Bookform bookform = bookformDao.get(id);
		if(bookform==null){
			bookform = bookformDao.getByCode(id);
			if(bookform==null){
				throw new Exception("此订单号:" + id + "找不到相应的订单");
			}
		}
		BookformData data = new BookformData(bookform);
		
		String factoryId = bookform.getFactoryId();
		if(StrFuncs.notEmpty(factoryId) && !factoryId.equals("-1")){
			Factory factory = factoryService.get(bookform.getFactoryId());
			data.setFactory(factory);
			Area area = areaService.get(factory.getCountyId());
			data.setFactoryAddr(area.getFullName() + " " + factory.getAddr());
		}
		
		
		Area deliveryAddressArea = areaService.get(bookform.getContactProvinceId(), 
				bookform.getContactCityId(), bookform.getContactCountyId());
		String deliveryAddress=deliveryAddressArea==null?"":deliveryAddressArea.getFullName();
		bookform.setContactAddr(deliveryAddress + " " + bookform.getContactAddr());

		if(bookform.getPayType() == 0 && StrFuncs.notEmpty(bookform.getPaymentId())){
			LogPayment logPayment = logPaymentService.get(bookform.getPaymentId());
			if(logPayment!=null && logPayment.getStatus().intValue()==1){//只有是已经支付的才赋值
				data.setLogPayment(logPayment);
			}
		}
		
		List<BookformProductData> productDatas = getProductDatas(bookform.getId());
		data.setBookformProductDatas(productDatas);
		
		 
		//final.返回
		return data;
	}
	
	public List<BookformProductData> getProductDatas(String bookformId) throws Exception {
		List<BookformDetail> bookDetails = bookformDetailDao.getAllByBookId(bookformId);
		List<BookformProductData> datas = new ArrayList<BookformProductData>();
		Bookform bookform = bookformDao.get(bookformId);
		
		List<StockRecord> stockRecordList = stockRecordService.getStockRecordByBookIdAndType(bookformId,StockRecord.TYPE_OUT_STOCK);
		
		for(BookformDetail detail : bookDetails){
			//1.找到已有的数据
			BookformProductData targetData = null;
			String productId = detail.getProductId();
			for(BookformProductData data : datas){
				if(data.getProductId().equals(productId)){
					targetData = data;
					break;
				}
			}
			
			//2.如果没有则创建并插入
			if(targetData == null){
				targetData = new BookformProductData(detail);
				//String photoId = productService.getPhotoId(productId);
				Product product = productService.get(productId);
				String photoId = StrFuncs.isEmpty(product.getPhotoIds()) ? null : product.getPhotoIds().split(",")[0];
				targetData.setImageId(photoId);
				targetData.setProductName(product.getName());
				
				List<ProductItem> itemList = this.calculateOutStockItemList(productId,stockRecordList);
				targetData.setOutStockItemList(itemList);
				
				datas.add(targetData);
			}
			
		}
		return datas;
	}
	
	/**
	 * 获取已出库商品列表
	 * @param stockRecordList
	 * @return
	 */
	private List<ProductItem> calculateOutStockItemList(String productId,List<StockRecord> stockRecordList) {
		List<ProductItem> itemList = new ArrayList<ProductItem>();
		for (StockRecord stockRecord : stockRecordList) {
			ProductItem item = productItemService.getBySecurityCode(stockRecord.getSecurityCode());
			if(item.getProductId().equals(productId)){
				itemList.add(item);
			}
		}
		return itemList;
	}

	@Transactional
	public boolean disable(String id, SysUser user, String reason) throws Exception{
		//0.验证数据操作的合法性
		Bookform bookform = get(id);
		if(bookform == null || user == null 
				|| (bookform.getStatus()!=Bookform.STATUS_WAIT_PAY
				&& bookform.getStatus()!=Bookform.STATUS_WAIT_SEND_DELIVERY)){
			return false;
		}
		
		//1.变更数据状态
		Integer oldStatus = bookform.getStatus();
		bookform.setStatus(Bookform.STATUS_CANCEL);
		bookform.setCancelTime(new Date());
		bookform.setCancelReason(reason);
		save(bookform);
		
//		//2.记录日志
//		String action = "取消订单：" + reason;
//		draftService.saveLog(Bookform.TABLE_NAME, id, user, action, 
//				"status", bookform.getStatus().toString(), oldStatus.toString());
		
		//3.返回
		return true;
	}
	
	
	/**
	 * @param id
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public boolean deliver(String id, String deliveryFactory, String trackingNumber, SysUser user) throws Exception{
		Bookform bookform = get(id);
		if(bookform == null || user == null || bookform.getStatus() != Bookform.STATUS_CONFIRMED 
				|| bookform.getTrackingStatus() != 0){
			return false;
		}
		
		//1.更新t_bookform主表
		bookform.setTrackingStatus(Bookform.TRACKING_SEND);
		bookform.setDeliveryFactory(deliveryFactory);
		bookform.setTrackingNumber(trackingNumber);
		bookform.setStatus(Bookform.STATUS_WAIT_TAKE_DELIVERY);
		bookform.setDeliveryTime(new Date());
		
		//发货生成账单
		billDetailService.deliverBillDetail(bookform);
		
		int score = (int)Math.floor(bookform.getSales());
		Factory factory = factoryService.get(bookform.getFactoryId());
		//门店积分
		scoreService.deliverFactoryScore(score, factory.getMobile()+"门店下单积分", bookform.getFactoryId(), bookform.getId());
		//地推积分，门店不递归
		scoreService.sysUserScore(score, bookform.getFactoryId(), 
				factory.getName()+"下单", factory.getSysUserId());
		
		return true;
	}
	
	
	@Transactional
	public String submitBookform(CartData cartData,FactoryUser factoryUser,OrderEntity data) throws Exception{
		//1. 数据验证
		validBookform(cartData,data);
		
		//2. 创建订单
		Bookform bookform = new Bookform();
		bookform.setFactoryId(factoryUser.getFactoryId());;
		bookform.setContactProvinceId(data.getProvinceId());
		bookform.setContactCityId(data.getCityId());
		bookform.setContactCountyId(data.getCountyId());
		bookform.setSales(cartData.getAllTotal());
		bookform.setCode(StrFuncs.createTimeUID());
		bookform.setContactTel(data.getMobile());
		bookform.setContactMan(data.getMan());
		bookform.setContactAddr(data.getAddr());
		bookform.setTrackingStatus(0);
		if(data.getPayType() == 0){
			//在线支付状态是待支付
			bookform.setStatus(Bookform.STATUS_WAIT_PAY);
		}else{
			//否则就是代发货
			bookform.setStatus(Bookform.STATUS_WAIT_SEND_DELIVERY);
		}
		
		bookform.setPayType(data.getPayType());
		
		bookformDao.save(bookform);

		//3. 创建订单明细
		createBookformDetail(cartData,bookform);
		
		return bookform.getId();
	}
	
	private void validBookform(CartData cartData,OrderEntity data) throws Exception{
		for(CartItem item :cartData.getItems()){
			Product product = productService.get(item.getProductId());
			
			if(product ==null){
				throw new Exception("商品不存在！");
			}else if(product.getStatus() != Product.STATUS_VALID){
				throw new Exception("商品未上架！");
			}
		}
		
		if(StrFuncs.isEmpty(data.getMobile())){
			throw new Exception("请填写联系方式！");
		}else if(StrFuncs.isEmpty(data.getMan())){
			throw new Exception("请填写联系人！");
		}else if (StrFuncs.isEmpty(data.getAddr())){
			throw new Exception("请填写联系地址！");
		}
	}
	
	private void createBookformDetail(CartData cartData,Bookform bookform){
		for (CartItem cartItem : cartData.getItems()) {
			BookformDetail  detail  = new BookformDetail();
			detail.setBookId(bookform.getId());
			detail.setCount(cartItem.getCount());
			detail.setProductId(cartItem.getProductId());;
			detail.setPrice(cartItem.getPrice());
			detail.setPriceMart(cartItem.getPriceMart());
			
			bookformDetailDao.save(detail);
		}
	}
	
	/*统计商家所有的订单数量*/
	public int countBookformByFactory(String factoryId){
		return bookformDao.countBookformByFactory(factoryId);
	}
	
	
	/* 分页获取商家的订单，方法不和后台的公用 */
	public Pair<List<OrderData>, Integer> getBookformByFactory(String factoryId,String[] status,int pageNo) throws Exception{
		
		PagedQuery query  = new PagedQuery( PageSettings.of(pageNo));
		
		StringBuilder where = new StringBuilder(" 1=1 ");
		
		JSONObject queryJson = new JSONObject();
		queryJson.element("factoryId", factoryId).element("status", status);
		
		this.addQueryEqualFilter(queryJson, where, query, "factoryId",
				" and b.factory_id = :factoryId");
		
		if(status !=null &&status.length > 0){
			where.append(" and status in (:status)");
			query.put("status", status);
		}
		//1. 只返回ID
		query.select(" b.id ").from(
				" t_bookform b ").where(where.toString()).orderBy(" b.update_time desc ");
		generalDao.execute(query);
		
		//2. 加载订单数据
		List<OrderData> listOrderData = this.getOrderData(query.getRows());
		
		return new Pair<List<OrderData>, Integer>(listOrderData, query.getResult().getPageCount());
	}
	
	private List<OrderData> getOrderData(List<Map<String, String>> rows)  throws Exception{
		List<OrderData> listResult= new LinkedList<OrderData>();
		for (Map<String, String> map : rows) {
			String bookId = map.get("id");
			
			OrderData orderData = getOrderDataByBookId(bookId);
			listResult.add(orderData);
		}
		return listResult;
	}
	
	/*根据订单获取到订单详细数据*/
	public OrderData getOrderDataByBookId(String bookId) throws Exception{
		Bookform bookform = this.get(bookId);
		List<BookformDetail> listDetails = bookformDetailDao.getAllByBookId(bookform.getId());
		
		OrderData data = new OrderData(bookform);
		for (BookformDetail bookformDetail : listDetails) {
			OrderDetailData detailData = new OrderDetailData(bookformDetail);
			
			Product product = productService.get(bookformDetail.getProductId());
			detailData.setProductName(product.getName());
			detailData.setPhotoIds(product.getPhotoIds());
			
			data.addDetail(detailData);
		}
		
		return data;
	}
	
	public PayInfo getPayInfo(String orderId) throws Exception{

		Bookform bookform = get(orderId);
		if(bookform == null || bookform.getPayType() != 0){
			throw new Exception("订单:" + bookform.getCode() + " 不支持在线付款!");
		}
		if(bookform.getPaymentId() != null){
			throw new Exception("订单:" + bookform.getCode() + " 已完成付款!");
		}
		Double amount = bookform.getSales();
		
		List<BookformDetail> details = bookformDetailDao.getAllByProperty("bookId", bookform.getId());
		Product product = productService.get(details.get(0).getProductId());
		String title = product.getName();
		if(title.length() >= 20){
			title = title.substring(0, 20);
		}
		if(details.size() > 1 ){
			title += "...等多项商品";
		}

		return new PayInfo(title, amount, BookformPaymentCallbackUtils.class.getName(),orderId);
	}
	
	@Transactional
	public void finishPayment(String orderId, String logId) throws Exception{
		Bookform bookform = get(orderId);
		if(bookform == null || bookform.getStatus() != 0 || bookform.getPayType() != 0){
			return;
		}
			
		bookform.setPaymentId(logId);
		bookform.setStatus(Bookform.STATUS_WAIT_SEND_DELIVERY);
		bookformDao.save(bookform);
		
		System.out.println("end finishPayment");
	}
	
	@Transactional
	public void autoFinishOrder() {
		bookformDao.autoFinishOrder();
	}
	

	@Autowired
	private BookformDao bookformDao;
	@Autowired
	private BookformDetailDao bookformDetailDao;
	@Autowired
	private GeneralDao generalDao;
	@Autowired
	private AreaService areaService;
	@Autowired
	private ProductService productService;
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private LogPaymentService logPaymentService;
	@Autowired
	private BillDetailService billDetailService;
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private StockRecordService stockRecordService;
	@Autowired
	private ProductItemService productItemService;

}