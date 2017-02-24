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
import pub.dao.query.PagedQueryResult;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;
import pub.types.Pair;

import com.sys.dao.BookformDao;
import com.sys.dao.BookformDetailDao;
import com.sys.data.book.BookformData;
import com.sys.data.book.BookformProductData;
import com.sys.data.book.OrderData;
import com.sys.data.cart.CartData;
import com.sys.data.cart.CartItem;
import com.sys.entity.Area;
import com.sys.entity.Bookform;
import com.sys.entity.BookformDetail;
import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.entity.LogPayment;
import com.sys.entity.Product;
import com.sys.entity.SysUser;
import com.web.mmall.entity.OrderEntity;

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
				datas.add(targetData);
			}
			
		}
		return datas;
	}
	
	@Transactional
	public boolean disable(String id, SysUser user, String reason) throws Exception{
		//0.验证数据操作的合法性
		Bookform bookform = get(id);
		if(bookform == null || user == null 
				|| bookform.getStatus().equals(Bookform.STATUS_CANCEL)
				|| bookform.getStatus().equals(Bookform.STATUS_FINISH)){
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
	
	@Transactional
	public boolean confirm(String id, SysUser user) throws Exception{
		//0.验证数据操作的合法性
		Bookform bookform = get(id);
		if(bookform == null || user == null 
				|| !bookform.getStatus().equals(Bookform.STATUS_CONFIRM_WAIT)){
			return false;
		}
		
		//1.变更数据状态
		bookform.setStatus(Bookform.STATUS_CONFIRMED);
		bookform.setConfirmTime(new Date());
		bookform.setTrackingStatus(0);
		save(bookform);
		
		/*//2.记录日志
		draftService.saveLog(Bookform.TABLE_NAME, id, user, "确认有效", 
			"status", String.valueOf(Bookform.STATUS_CONFIRM_WAIT), String.valueOf(Bookform.STATUS_CONFIRMED));*/
		
		//TODO	减库存
//		List<BookformDetail> details = bookformDetailDao.getAllByBookId(id);
//		for(BookformDetail detail : details){
//		}
		
		//TODO.给商家发短信(服务订单发验证码，轮胎订单发欢迎短信)
		//this.sendWelcomeToCustomer(id);
		
		return true;
	}
	
	/**
	 *  @2015-2-1，商城轮胎发货，记录物流状态、物流公司、运单号
	 * 如果不是需要商城发货的轮胎订单，或者已经发过了，则返回false
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
		bookform.setDeliveryTime(new Date());
		
		//发货生成账单
		billDetailService.deliverBillDetail(bookform);
		
		int score = (int)Math.floor(bookform.getSales());
		Factory factory = factoryService.get(bookform.getFactoryId());
		//门店积分
		scoreService.deliverFactoryScore(score, "下单积分", bookform.getFactoryId(), bookform.getId());
		//地推积分，门店不递归
		scoreService.sysUserScore(score, bookform.getFactoryId(), 
				factory.getName()+"下单", factory.getSysUserId());
		
		return true;
	}
	
	/*public QueryResult queryPage(String condtion, QuerySettings settings) throws Exception {
		//1.查询订单表数据
		Query query = new PagedQuery(settings);
		JSONObject queryJson = StrFuncs.isEmpty(condtion) ? new JSONObject() : JSONObject.fromObject(condtion);
		String select = "t.id,t.code,t.contact_man,t.contact_tel,t.status,t.tracking_type,t.sales,t.pay_type," +
				"t.tracking_status,t.customer_service,t.priority,t.is_self, t.return_visit, f.name factoryName, nvl2(t2.id,'true','false') as is_use_coupon";
		String from = " t_bookform t "
				+ " left join t_factory f on t.service_factory_id = f.id"
				+ " left join t_coupon t2 on t.id = t2.book_id";
		StringBuilder where = new StringBuilder("1=1");
		
		this.addQueryEqualFilter(queryJson, where, query, "customerId", 
			" and t.customer_id = :customerId");		
		this.addQueryEqualFilter(queryJson, where, query, "serviceFactoryId", 
			" and t.service_factory_id = :serviceFactoryId ");	
		this.addQueryEqualFilter(queryJson, where, query, "isSelf", 
		" and t.is_self = :isSelf");
		this.addQueryEqualFilter(queryJson, where, query, "orderSource", 
		" and t.order_source = :orderSource");
		
		
		if(queryJson.containsKey("unpaid")){
			where.append(" and t.payment_id is null and t.status = 0 and t.pay_type = 0");
		}
		this.addQueryEqualFilter(queryJson, where, query, "status", 
			" and t.status = :status");
		this.addQueryEqualFilter(queryJson, where, query, "priority", 
				" and t.priority = :priority");
		if(queryJson.containsKey("allowReview")){
			where.append(" and t.status = 2 and not exists(select 1 from t_review r where r.book_id = t.id)");
		}
		
		
		if(StrFuncs.isEmpty(JsonFuncs.getStringValue(queryJson, "status"))){
			if(queryJson.containsKey("moreStatus")){
				where.append(" and t.status in (:moreStatus)");
				query.put("moreStatus", queryJson.getString("moreStatus").split(","));
			}else{
				where.append(" and t.status in (0,1,2) ");
			}
		}
		

		query.select(select).from(from).where(where).orderBy(" t.create_time desc ");	
		generalDao.execute(query);
		
		QueryResult queryResult = query.getResult();
		for(Object o : queryResult.getRows()){
			Map omap = (Map)o;
			String bookformId = omap.get("ID").toString();
			List<BookformProductData> detailItems = getProductDatas(bookformId);
			omap.put("items", detailItems);
			omap.put("REVIEW_COUNT", reviewService.totalReviewByBookId(bookformId));
		}
		return queryResult;
	}
	
	
	public int getDiscountCount(String customerId, String discountGroupId){
		Query query = new ListQuery();
		query.select("count(1) count")
			.from(" t_bookform t ")
			.where(" customer_id = :customerId and t.status in (0, 1, 2) and exists(select 1 from t_bookform_detail d where d.book_id = t.id and d.discount_group_id = :discountGroupId)")
			.put("discountGroupId", discountGroupId)
			.put("customerId", customerId);	
		
		generalDao.execute(query);
		Map row = (Map)query.getResult().getRows().get(0);
		return Integer.valueOf(row.get("COUNT").toString());
	}
	
	public QueryResult queryUrgentInstallConsult(String condition, QuerySettings settings){
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		Query query =  (settings != null) ? new PagedQuery(settings) : new ListQuery();
		StringBuilder select = new StringBuilder();
		select.append( " t.*, f.name as factory_name, f.addr, a.full_name, f.tel, f.mobile, f.grade");
		
		StringBuilder where = new StringBuilder();
		where.append( "t.factory_id = f.id and f.county_id = a.id");
		this.addQueryEqualFilter(queryJson, where, query, "status", 
			" and t.status = :status");	
		this.addQueryEqualFilter(queryJson, where, query, "stockStatus", 
		" and t.stock_status = :stockStatus");	
		this.addQueryEqualFilter(queryJson, where, query, "factoryId", 
			" and t.factory_id = :factoryId");
		this.addQueryEqualFilter(queryJson, where, query, "bookId", 
			" and t.book_id = :bookId");  
		query.select( select.toString())
			.from(" t_bookform_stock_consult t, t_factory f, t_area a")
			.where( where.toString())
			.orderBy(" t.create_time desc ");	
		generalDao.execute(query);
		return query.getResult();
	}
	

	public QueryResult queryCandidateFactorys(String id, String cityId, String countyId, MapPoint point, String orderBy) throws Exception{
		BookformData data = getData(id);
		if(data == null){
			return null;
		}
		Bookform bookform = data.getBookform();
		if(StrFuncs.notEmpty(bookform.getServiceFactoryId()) 
				|| bookform.getPriority() != 1
				|| bookform.getIsSelf() != 1 
				|| bookform.getStatus() != 1){
			return null;
		}
		
		boolean isSpecialTyre = false;
		for(BookformProductData productData : data.getBookformProductDatas()){
			String productId = productData.getProductId();
			ProductTyre productTyre = productTyreService.getByPruductId(productId);
			if(productTyre.getIsSpecial() == 1){
				isSpecialTyre = true;
				break;
			}
		}
		
		QueryResult queryResult = factoryService.queryCandidateFactorys(isSpecialTyre, 
				cityId, countyId, point, orderBy);
		
		return queryResult;
	}
	
	public QueryResult queryCandidateFactorys(String id, String cityId, String countyId,  String address, String orderBy) throws Exception{
		//Bookform bookform = this.get(id);
		Area city = areaService.get(cityId);
		MapPoint point = null;
		
		if(StrFuncs.notEmpty(address)){
			point = MapUtils.getCoordinate(address, city.getName());
		}
		
		if(point == null && orderBy.equals("distance")){
			orderBy = "grade desc";
		}
		
		return queryCandidateFactorys(id, cityId, countyId, point, orderBy);
	}
	public QueryResult queryUrgentInstallConsult(String condition){
		return queryUrgentInstallConsult(condition, null);
	}
	
	@Transactional
	public boolean enableUrgentInstallConsult(String consultId, SysUser user) throws Exception{
		BookformStockConsult consult = bookformStockConsultDao.get(consultId);
		if(consult == null || user == null || consult.getStockStatus() != 1){
			return false;
		}
		String bookId = consult.getBookId();
		Bookform bookform = get(bookId);
		String factoryId = consult.getFactoryId();
		Factory factory = factoryService.get(factoryId);
		if(bookform == null || factory == null || StrFuncs.notEmpty(bookform.getServiceFactoryId())){
			return false;
		}
		
		enableUrgentInstallConsult(bookform, factoryId, user);
		return true;
	}
	
	@Transactional
	public boolean enableUrgentInstallConsult(String consultId, Customer user) throws Exception{
		BookformStockConsult consult = bookformStockConsultDao.get(consultId);
		if(consult == null || user == null || consult.getStockStatus() != 1){
			return false;
		}
		String bookId = consult.getBookId();
		Bookform bookform = get(bookId);
		String factoryId = consult.getFactoryId();
		Factory factory = factoryService.get(factoryId);
		if(bookform == null || factory == null 
				|| !bookform.getCustomerId().equals(user.getId())
				|| StrFuncs.notEmpty(bookform.getServiceFactoryId())){
			return false;
		}
		
		enableUrgentInstallConsult(bookform, factoryId, user);
		return true;
	}
	
	private void enableUrgentInstallConsult(Bookform bookform, String factoryId, Object user) throws Exception{	
		Factory factory = factoryService.get(factoryId);
		bookform.setServiceFactoryId(factoryId);
		bookform.setContactProvinceId(factory.getProvinceId());
		bookform.setContactCityId(factory.getCityId());
		bookform.setContactCountyId(factory.getCountyId());
		
		save(bookform);
		
		bookformStockConsultDao.finishAllByBookId(bookform.getId());
		
		draftService.saveLog(Bookform.TABLE_NAME, bookform.getId(), user, "确定轮胎加急安装商家",
				"serviceFactoryId", factoryId, "");
	}
	
	@Transactional
	public boolean createUrgentInstallConsults(String id, String[] factoryIds, String describe, SysUser user) throws Exception{	
		Bookform bookform = get(id);
		if(bookform == null || bookform.getStatus() != 1 || ColFuncs.isEmpty(factoryIds)
				|| StrFuncs.notEmpty(bookform.getServiceFactoryId())){
			return false;
		}
		
		for (String factoryId : factoryIds) {
			BookformStockConsult bookformStockConsult = new BookformStockConsult();
			bookformStockConsult.setBookId(id);
			bookformStockConsult.setFactoryId(factoryId);
			bookformStockConsult.setContent(describe);
			bookformStockConsult.setStatus(0);
			bookformStockConsultDao.save(bookformStockConsult);
		}
		draftService.saveLog(Bookform.TABLE_NAME, bookform.getId(), user, "发起加急安装咨询，共" + factoryIds.length + "家商家");
		return true;
	}
	
	public int getActiveUrgentInstallConsultByFactoryId(String factoryId){
		return bookformStockConsultDao.getActiveCountByFactoryId(factoryId);
	}
	
	public List<BookformStockConsult> getUrgentStockConsultByFactoryId(String factoryId){
		return bookformStockConsultDao.getAllByFactoryId(factoryId);
	}
	
	public List<BookformStockConsult> getUrgentStockConsultsByBookformId(String bookformId){
		return bookformStockConsultDao.getAllByBookformId(bookformId);
	}
	
	@Transactional
	public boolean acceptUrgentInstallConsult(String id, String reply, FactoryUser user) throws Exception{
		BookformStockConsult consult = bookformStockConsultDao.get(id);
		if(consult == null || user == null || consult.getStatus() != 0
				||!consult.getFactoryId().equals(user.getFactoryId())){
			return false;
		}
		consult.setStockStatus(1);
		consult.setReplyTime(new Date());
		consult.setReply(reply);
		
		bookformStockConsultDao.save(consult);
		return true;
	}
	
	@Transactional
	public boolean rejectUrgentInstallConsult(String id, String reply, FactoryUser user) throws Exception{
		BookformStockConsult consult = bookformStockConsultDao.get(id);
		if(consult == null || user == null || consult.getStatus() != 0
				||!consult.getFactoryId().equals(user.getFactoryId())){
			return false;
		}
		consult.setStockStatus(0);
		consult.setReplyTime(new Date());
		consult.setReply(reply);
		
		bookformStockConsultDao.save(consult);
		return true;
	}
	
	 管理台直接拒绝该商家
	@Transactional
	public boolean rejectUrgentInstallConsult(String bookId,String factoryId,SysUser sysUser) throws Exception{
		BookformStockConsult consult = bookformStockConsultDao.get(bookId, factoryId);
		
		if(consult == null){
			consult = new BookformStockConsult();
			consult.setContent("发起加急咨询");
			consult.setStockStatus(3);//客服直接移除
			consult.setBookId(bookId);
			consult.setFactoryId(factoryId);
		}
		
		consult.setStockStatus(0);
		consult.setReplyTime(new Date());
		consult.setReply("经过客服电话沟通，确认该商家无法安装！");
		consult.setSysUserId(sysUser.getId());
		
		bookformStockConsultDao.save(consult);
		return true;
	}
	
	public BookformDetail getDetail(String detailId)throws Exception{
		return bookformDetailDao.get(detailId);
	}
	
	public List<Bookform> getAll(){
		return bookformDao.getAll();
	}
	

	
	

	public int calculateInquirystock(String serviceFactoryId) {
		return bookformDao.calculateInquirystock(serviceFactoryId);
	}
	

	@Transactional
	public boolean receiveTyre(String id, FactoryUser user) throws Exception{
		Bookform bookform = bookformDao.get(id);
		if(bookform == null || user == null 
			|| !user.getFactoryId().equals(bookform.getServiceFactoryId())){
			return false;
		}
		
		if(bookform.getIsSelf() ==0){
			throw new Exception("非轮胎订单！");
		}
		
		Integer oldTrackingStatus = bookform.getTrackingStatus();
		bookform.setTrackingStatus(2);
		save(bookform);
		
		draftService.saveLog(Bookform.TABLE_NAME, id, user, "轮胎收货", 
				"trackingStatus", String.valueOf(oldTrackingStatus), "2");
		
		this.sendVerifyCodeToCustomer(id, user);
		return true;
	}
	
	@Transactional
	public boolean receiveTyre(String id, SysUser user) throws Exception{
		Bookform bookform = bookformDao.get(id);
		if(bookform == null || user == null){
			return false;
		}
		
		Integer oldTrackingStatus = bookform.getTrackingStatus();
		bookform.setTrackingStatus(2);
		save(bookform);
		
		draftService.saveLog(Bookform.TABLE_NAME, id, user, "轮胎收货", 
				"trackingStatus", String.valueOf(oldTrackingStatus.toString()), "2");
		
		this.sendVerifyCodeToCustomer(id, user);
		
		return true;
	}
	
	public List<Bookform> getAllConsultBookform(String serviceFactoryId){
		
		return bookformDao.getAllInventoryConsult(serviceFactoryId);
	}
	
	
	 * @版本说明：2014-11-21 pj add
	 * 
	 * @功能说明：统计库存询问
	 
	public List<JSONObject> getAllInventoryConsult(String serviceFactoryId) throws Exception{
		List<Bookform> bookformList = bookformDao.getAllInventoryConsult(serviceFactoryId);
		
		List<JSONObject> list=new ArrayList<JSONObject>();
		for (Bookform bookform : bookformList) {
			
			JSONObject object=new JSONObject();
			object.element("bookform", JsonFuncs.toJson((bookform)));
			
			//获取到所有的订单详情
			List<BookformDetail> bookDetails = bookformDetailDao.getAllByBookId(bookform.getId());
			
			Map<String, Integer> map=new HashMap<String, Integer>();
			for (int i=0;i<bookDetails.size();i++) {
				BookformDetail bookformDetail = bookDetails.get(i);
				
				if(map.containsKey(bookformDetail.getProductId())){
					JSONObject jsonObject = object.getJSONArray("items").getJSONObject(map.get(bookformDetail.getProductId()));
					jsonObject.element("count", jsonObject.getInt("count")+1);
					continue;
				}
				JSONObject detailObject=new JSONObject();
				Product product = productService.get(bookformDetail.getProductId());
				//获取商品的品牌
				ProductBrand productBrand = productBrandService.get(product.getProductBrandId());
				//获取商品的规格型号
				TyreSize productTyreize = tyreSizeDao.getProductTyreize(product.getId());
				
				detailObject.element("productName", product.getName());
				detailObject.element("productId", product.getId());
				detailObject.element("brandName", productBrand!=null?productBrand.getName():"");
				detailObject.element("flatRate", productTyreize.getFlatRate());
				detailObject.element("diameter", productTyreize.getDiameter());
				detailObject.element("tread", productTyreize.getTread());
				detailObject.element("count", 1);
				
				if(!object.containsKey("items")){
					object.element("items", new JSONArray());
				}
				object.getJSONArray("items").add(detailObject);
				map.put(bookformDetail.getProductId(), object.getJSONArray("items").size()-1);
			}
			list.add(object);
		}
		return list;
	}
	
	@Transactional
	public List<Bookform> createBookforms(Map<String, String> postData, CartData cartData, 
			Customer customer, String ipAddr) throws Exception{
		//0.初始化
		List<Bookform> result = new ArrayList<Bookform>();
		String uId = generateIdDao.generateUserBookId();
		
		Coupon coupon=null;
		Map<String, Object> canUseCouponMap =null;
		if("couponEntry".equals(postData.get("entry"))){
			//红包活动入口
			coupon=couponService.get(postData.get("couponId"));
			String[] productIds=cartData.getAllProductIds();
			if(coupon!=null&&couponService.canUse(coupon, productIds,customer.getId())){
				canUseCouponMap =couponService.getCanUseCouponAmount(coupon, productIds);
				//使用了红包，只能使用在线支付
				postData.put("payType", "0");
			}
		}else{
			
			matchDiscount(postData, cartData, customer);
			
		}
		
		Map<String, List<CartItem>> groupItems = cartData.groupByFactory();
		for(String factoryId : groupItems.keySet()){
			List<CartItem> groupItem = groupItems.get(factoryId);
			//this.createBookform(factoryId, uId, customer, items, postData)
			
			Bookform bookform = createBookform(uId, factoryId, customer, postData, groupItem,canUseCouponMap);
			result.add(bookform);
		}

		//下单时更时用户选择预约时间的状态
		//if(StrFuncs.notEmpty(postData.get("appointmentId"))){
			//appointmentService.updateAppointmentById(postData.get("appointmentId"), customer.getId());
		//}
		
		for(Bookform subBookform : result){
			//4.1记日志，关键是IP信息，以便事后追查同IP下多个马甲下单的行为
			draftService.saveLog2(Bookform.TABLE_NAME, subBookform.getId(), customer, "下单", ipAddr);	
		}
		
//				Map<String,String> discountIdMap=new HashMap<String, String>();
//				//1. 记录优惠情况
//				for(Bookform subBookform : result){
//					if(subBookform.getDiscountAmount()>0){
//						String discountId=null;
//						List<BookformDetail> details=bookformDetailDao.getAllByBookId(subBookform.getId());
//						for(BookformDetail detail:details){
//							if(StrFuncs.notEmpty(detail.getDiscountRuleId())){
//								discountId=detail.getDiscountRuleId();
//								break;
//							}
//						}
//						//保存单子的对应折扣Id
//						discountIdMap.put(subBookform.getId(), discountId);
//						// 采集有折扣数据
//						ClickFarming clickFarming = new ClickFarming(
//								customer.getId(), postData.get("hardKey"), postData
//								.get("softKey"), null, null,
//								subBookform.getId(), discountId,ipAddr);
//						clickFarmingService.save(clickFarming);
//					}
//				}
		
		//5.返回 
		return result;
	}
	
	*//**
	 * 记录优惠单信息
	 * @param bookForms
	 * @param jsonData
	 * @param customerId
	 * @param ipAddr
	 *//*
	public void writeClickFarming(final List<Bookform> bookForms,
			final Map<String, String> jsonData,final Customer customer, final String ipAddr ) {
		final Map<String,String> discountIdMap=new HashMap<String, String>();
		
		//在线程外查询折扣ID，在线程里查询会不断创建链接
		for(Bookform subBookform : bookForms){
			try {
				//保存主单与子单的关系
				String discountId=null;
				List<BookformDetail> details = bookformDetailDao.getAllByBookId(subBookform.getId());
				for(BookformDetail detail:details){
					if(StrFuncs.notEmpty(detail.getDiscountRuleId())){
						discountId=detail.getDiscountRuleId();
						break;
					}
				}
				//保存单子的对应折扣Id
				discountIdMap.put(subBookform.getId(), discountId);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		

	private Bookform create(String uId, String customerId, String factoryId, Map<String, String> postData){
		Bookform bookform = new Bookform();
		bookform.setUserBookid(uId);
		bookform.setCode(generateIdDao.generateUserBookId());
		bookform.setCustomerId(customerId);
		bookform.setContactMan(postData.get("contactMan"));
		bookform.setContactTel(postData.get("contactTel"));
		
		bookform.setStatus(0);
		String text = postData.get("priority");
		bookform.setPriority(StrFuncs.notEmpty(text) ? Integer.valueOf(text) : -1);
		bookform.setServiceFactoryId(postData.get("serviceFactoryId"));
		
		text = postData.get("payType");
		bookform.setPayType(StrFuncs.notEmpty(text) ? Integer.valueOf(text) : 0);
		bookform.setInvoiceTitle(postData.get("invoiceTitle"));
		bookform.setRemark(postData.get("remark"));
		
		String giveInvoice = postData.get("giveInvoice");
		bookform.setGiveInvoice(StrFuncs.notEmpty(giveInvoice)? Integer.valueOf(giveInvoice) : 0 );
		
		if(StrFuncs.isEmpty(factoryId)){
			bookform.setIsSelf(1);
			if(bookform.getPriority() == 1){
				bookform.setTrackingType("w");
				bookform.setContactProvinceId(postData.get("contactProvinceId"));
				bookform.setContactCityId(postData.get("contactCityId"));
				bookform.setContactCountyId(postData.get("contactCountyId"));
				bookform.setContactAddr(postData.get("contactAddr"));
			}
			else if(bookform.getPriority() == 0){
				bookform.setTrackingType("w");
				text = postData.get("serviceTime");
				bookform.setServiceTime(DateFuncs.valueOf(text));
				String serviceFactoryId = postData.get("serviceFactoryId");
				Factory factory = factoryService.get(serviceFactoryId);
				bookform.setServiceFactoryId(factory.getId());
				bookform.setContactProvinceId(factory.getProvinceId());
				bookform.setContactCityId(factory.getCityId());
				bookform.setContactCountyId(factory.getCountyId());
			}
			else if(bookform.getPriority() == -1){
				bookform.setTrackingType("c");
				bookform.setContactProvinceId(postData.get("contactProvinceId"));
				bookform.setContactCityId(postData.get("contactCityId"));
				bookform.setContactCountyId(postData.get("contactCountyId"));
				bookform.setContactAddr(postData.get("contactAddr"));
			}
		}  
		else{
			bookform.setIsSelf(0);
			bookform.setPriority(-1);//
			bookform.setTrackingType("n");//
			if(bookform.getPayType() == 1){
				bookform.setStatus(1);
			}
			Factory factory = factoryService.get(factoryId);
			bookform.setServiceFactoryId(factory.getId());
			bookform.setContactProvinceId(factory.getProvinceId());
			bookform.setContactCityId(factory.getCityId());
			bookform.setContactCountyId(factory.getCountyId());
		}
		
		//
		return bookform;
	}
	
	private Bookform createBookform( String uId, String factoryId,Customer customer, Map<String, String> postData, List<CartItem> items,Map<String, Object> canUseCouponMap) throws Exception{
		//1.创建bookform对象 
		Bookform bookform = this.create(uId, customer.getId(), factoryId, postData);
		
		List<BookformDetail> details = this.createDetails(items);
		
		double price = 0;//原价 
		double discountAmount = 0;//折扣金额
		//double couponAmount = 0;//红包抵扣金额，预留
		double deliveryCost = 0;//运费，预留
		double priorityInstallAmount =0 ;//加急安装
		double voucherAmount=0 ;//代金券
		double deduct = 0;//直接扣减
				
		double couponAmount=canUseCouponMap==null||canUseCouponMap.get("couponAmount")==null?0d:(Double)canUseCouponMap.get("couponAmount");
		String useProductId=canUseCouponMap==null||canUseCouponMap.get("useProductId")==null?null:canUseCouponMap.get("useProductId").toString();
		
		
		for(BookformDetail detail : details){
			price += StrFuncs.isEmpty(detail.getPriceType())
					|| BookformDetail.HTW_PRICE.equals(detail.getPriceType()) ? detail
					.getPrice()
					: detail.getPriceMart();
			discountAmount += detail.getDiscount();
			priorityInstallAmount += detail.getPriorityAmount();
			voucherAmount=NumberUtil.add(voucherAmount, detail.getVoucherAmount());
			deduct +=detail.getDeduct();
		}
		
		
		double sales = price - discountAmount - couponAmount - deliveryCost - voucherAmount + priorityInstallAmount-deduct;//实际应收款项
		bookform.setSales(sales);
		bookform.setDiscountAmount(discountAmount);
		bookform.setPrice(price);
		bookform.setDeliveryCost(deliveryCost);
		bookform.setCouponAmount(couponAmount);
		bookform.setVoucherAmount(voucherAmount);
		bookform.setPriorityAmount(priorityInstallAmount);
		
		//配合做数据停触发器
		bookform.setCreateTime(new Date());
		bookform.setUpdateTime(new Date());
		
		bookformDao.save(bookform);
		String bookId = bookform.getId();
		
		voucherService.useVoucher(postData.get("voucherId"), bookId);//设置代金券的订单号
		
		for(BookformDetail detail : details){
			detail.setBookId(bookId);
			bookformDetailDao.save(detail);
			
			//红包绑定到使用的子单
			if(detail.getProductId().equals(useProductId)){
				couponService.useCoupon(postData.get("couponId"),bookId,detail.getId(),customer.getId());
			}
			
			appointmentService.setAppointmentId(customer, postData.get("appointmentId"), bookId, detail);//设置预约工位
			
		}
		
		if(bookform.getStatus() == 1){
			for(BookformDetail detail : details){
				productService.reduceStock(detail.getProductId(), detail.getCount(),
						"订单号：" + bookform.getCode());
			}
		}
		//final.返回
		return bookform;
	}


	private List<BookformDetail> createDetails(List<CartItem> items){
		//double subAmount = 0.0;
		List<BookformDetail> details = new ArrayList<BookformDetail>();
		for(CartItem item : items){
			int i = 0;
			for(i = 0; i < item.getCount(); i++){
				//System.out.println("\n---------------------------- " + i + "<" + item.getCount());
				BookformDetail detail = new BookformDetail();
				detail.setProductId(item.getProductId());
				//detail.setBookId(bookform.getId());
				detail.setProductName(item.getProductName());
				detail.setPrice(item.getPrice());
				detail.setPriceMart(item.getPriceMart());
				detail.setDiscount(item.discountAmount(i));
				detail.setDiscountGroupId(item.getDiscountGroupId());
				detail.setDiscountRuleId(item.getDiscountRuleId());
				detail.setVerificationDeadline(DateFuncs.addDay(new Date(), item.getAvailableDay() == null ? 30 : item.getAvailableDay()));
				detail.setVerificationCode(MathFuncs.createVerificationCode());
				detail.setPriorityAmount(item.getPriorityInstallAmount());
				detail.setTyreUrgentId(item.getTyreUrgentId());
				detail.setVoucherAmount(voucherService.devideAmountToDetail(item,i));
				detail.setVoucherId(item.getVoucherId());
				detail.setDeduct(item.getDeduct());
				detail.setPriceType(item.getPriceType());
				
				//配合做数据停触发器
				detail.setCreateTime(new Date());
				detail.setUpdateTime(new Date());
				
				details.add(detail);
			}
		}
		
		return details;
	}
	
	public List<BookformProductData> getProductDatas(String bookformId) throws Exception {
		List<BookformDetail> bookDetails = bookformDetailDao.getAllByBookId(bookformId);
		List<BookformProductData> datas = new ArrayList<BookformProductData>();
		Bookform bookform = bookformDao.get(bookformId);
		
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
				targetData.setCategory(product.getCategory());
				//是否自营
				if(bookform.getIsSelf()==Bookform.IS_SELF_TRUE){
					//查询轮胎子表
					ProductTyre productTyre = productTyreService.getByPruductId(product.getId());
					targetData.setSpeedSymbol(productTyre.getSpeedSymbol());
					targetData.setLoadIndex(productTyre.getLoadIndex());
					targetData.setPattern(productTyre.getPattern());
					//查询轮胎规格
					TyreSize tyreSize = tyreSizeDao.getProductTyreize(product.getId());
					targetData.setTread(tyreSize.getTread());
					targetData.setFlatRate(tyreSize.getFlatRate());
					targetData.setDiameter(tyreSize.getDiameter());
				}
				datas.add(targetData);
			}
			
			//3.写入验证码信息
			targetData.addVerifyCode(detail.getVerificationCode(), detail.getVerificationStatus(),
				detail.getVerificationTime(), detail.getVerificationDeadline());
		}
		return datas;
	}
	

	@Transactional
	public boolean confirm(String id, SysUser user) throws Exception{
		//0.验证数据操作的合法性
		Bookform bookform = get(id);
		if(bookform == null || user == null 
				|| !bookform.getStatus().equals(Bookform.STATUS_CONFIRM_WAIT)){
			return false;
		}
		
		//1.变更数据状态
		bookform.setStatus(Bookform.STATUS_CONFIRMED);
		bookform.setConfirmTime(new Date());
		if(bookform.getIsSelf() == 1){
			bookform.setTrackingStatus(0);
		}
		save(bookform);
		
		//2.记录日志
		draftService.saveLog(Bookform.TABLE_NAME, id, user, "确认有效", 
			"status", String.valueOf(Bookform.STATUS_CONFIRM_WAIT), String.valueOf(Bookform.STATUS_CONFIRMED));
		
		//3.减库存
		List<BookformDetail> details = bookformDetailDao.getAllByBookId(id);
		for(BookformDetail detail : details){
			productService.reduceStock(detail.getProductId(), detail.getCount(),
					"订单号：" + bookform.getCode());
		}
		
		if(bookform.getOrderSource() != 0 )
			return true;
		
		//3.给车主发短信(服务订单发验证码，轮胎订单发欢迎短信)
		if(bookform.getIsSelf() == 0){
			this.sendVerifyCodeToCustomer(id, user);
		}
		else{
			this.sendWelcomeToCustomer(id);
		}
		
		return true;
	}
	
	public void sendVerifyCodeToCustomer(String id, SysUser user) throws Exception{
		BookformData data = getData(id);
		if(data == null || user == null || data.getBookform().getStatus() != 1
			|| (data.getBookform().getIsSelf() == 1 && data.getBookform().getTrackingStatus() != 2)
			|| (data.getBookform().getIsSelf() == 0 && data.isRequireFinishPayment())){
			return;
		}
		sendVerifyCodeToCustomer(data);
	}
	
	private void sendVerifyCodeToCustomer(BookformData data) throws Exception{
		//0.对加急安装订单或者免安装订单来讲，审核通过时是没有factory的，暂时不用发短信
		if(data.getFactory() == null){
			return;
		}
		
		List<String> smsTexts = data.createVerifyCodeSms();
		//2015-07-16 csx 验证码修改发送到注册手机号
		Customer customer=customerService.get(data.getBookform().getCustomerId());
		String telephone;
		if(customer!=null&&StrFuncs.notEmpty(customer.getMobile())){
			telephone=customer.getMobile();
		}else{
			telephone = data.getBookform().getContactTel();
		}
		for(String smsText : smsTexts){
			smsService.sendSmsIgnoreError(telephone, smsText, null, "Send Book Verifycode");
		}
	}
	
	private void sendWelcomeToCustomer(String id) throws Exception{
		BookformData data = this.getData(id);
		if(data.getFactory() == null){
			return;
		}
		//String telephone = data.getBookform().getContactTel();
		
		Customer customer=customerService.get(data.getBookform().getCustomerId());
		String telephone;
		if(customer!=null&&StrFuncs.notEmpty(customer.getMobile())){
			telephone=customer.getMobile();
		}else{
			telephone = data.getBookform().getContactTel();
		}
		
		String smsText = data.createWelcomeSms();
		smsService.sendSmsIgnoreError(telephone, smsText, null, "Send Book Welcome");
	}
	
	public void sendVerifyCodeToCustomer(String id, FactoryUser user) throws Exception{
		BookformData data = getData(id);
		if(data == null || data.getBookform().getStatus() != 1
				|| !data.getFactory().getId().equals(user.getFactoryId())){
			return;
		}
		sendVerifyCodeToCustomer(data);
	}

	

	@Transactional
	public String disable(String id, Customer customer, String reason,String text) throws Exception{
		Bookform bookform = get(id);
		if(bookform == null || customer == null 
				|| bookform.getStatus().equals(Bookform.STATUS_CANCEL)
				|| bookform.getStatus().equals(Bookform.STATUS_FINISH)
				//|| bookform.getStatus().equals(Bookform.STATUS_CONFIRMED)
				|| !bookform.getCustomerId().equals(customer.getId())){
			//已完成或已取消
			return "1";
		}
		
		if(bookform.getStatus()==1&&bookform.getIsSelf()==1){
			return "5";//轮胎定单需联系客服取消
		}
		
		 List list=workflowDao.queryByReferenceId(bookform.getCode());
		 if(list.size()!=0){
		 //已申请过取消	 
		 return "2";
		 }
		String[] t = DateFuncs.toString(new Date()).split("-");
		if(bookform.getStatus().equals(Bookform.STATUS_CONFIRMED)
			&& Integer.parseInt(t[0]) + Integer.parseInt(t[1]) < 2014 + 9){
			workflowService.cancelBookform(customer, reason, text,bookform);
			//取消订单成功
			return "3";
		}
		
		
		
		Integer oldStatus = bookform.getStatus();
		bookform.setStatus(Bookform.STATUS_CANCEL);
		bookform.setCancelTime(new Date());
		bookform.setCancelReason(reason);
		save(bookform);
		
		String action = "取消订单：" + reason;
		draftService.saveLog(Bookform.TABLE_NAME, id, customer, action, 
				"status", bookform.getStatus().toString(), oldStatus.toString());
		
		return "4";
	}
	

	@Transactional
	public boolean confirmTyreSupply(String id, FactoryUser user, boolean useFactoryTyre) throws Exception{
		Bookform bookform = bookformDao.get(id);
		if(bookform == null || user == null 
			|| !user.getFactoryId().equals(bookform.getServiceFactoryId())
			|| !bookform.getTrackingType().equals("w")){
			return false;
		}
		
		bookform.setTrackingType(useFactoryTyre ? "n" : "s");
		bookform.setTrackingStatus(useFactoryTyre? 1 : 0 );
		save(bookform);
		
		String action = "商家确认" + (useFactoryTyre ? "使用自有轮胎" : "使用好胎屋货源");
		draftService.saveLog(Bookform.TABLE_NAME, id, user, action, 
				"trackingType", "w", bookform.getTrackingType());
		
		//3.
		return true;
	}
	
	@Transactional
	public boolean confirmTyreSupply(String id, SysUser user, boolean useFactoryTyre) throws Exception{
		Bookform bookform = bookformDao.get(id);
		if(bookform == null || user == null 
			|| !bookform.getTrackingType().equals("w")){
			return false;
		}
		
		bookform.setTrackingType(useFactoryTyre ? "n" : "s");
		bookform.setTrackingStatus(useFactoryTyre? 1 : 0 );
		save(bookform);
		
		String action = "商城管理员强制指定货源：" + (useFactoryTyre ? "使用商家自有轮胎" : "使用好胎屋货源");
		draftService.saveLog(Bookform.TABLE_NAME, id, user, action, 
				"trackingType", "w", bookform.getTrackingType());
		
		//3.
		return true;
	}
	
	 * @功能说明：统计客户待付款订单数
	 * 
	 * @版本信息：2014-12-9 pj add
	 
	public int waitPayBookCount(String customerId) {
		return bookformDao.waitPayBookCount(customerId);
	}
	
	@Transactional
	public void finishPayment(String[] ids, String logId) throws Exception{
		//List<String> serviceBookIds = new ArrayList<String>();
		for(String id : ids){
			Bookform bookform = get(id);
			if(bookform == null || bookform.getStatus() != 0 || bookform.getPayType() != 0){
				continue;
			}
			
			if(bookform.getIsSelf() == 1){

				bookform.setPaymentId(logId);
				//bookform.setRemark("fuck you!");
				bookformDao.save(bookform);
			}
			else{

				bookform.setPaymentId(logId);
				bookformDao.save(bookform);
				bookform.setStatus(1);
				bookformDao.save(bookform);
				
				String action = "服务订单在线支付成功，自动转为已确认状态";
				draftService.saveLog(Bookform.TABLE_NAME, id, SysUser.SYSTEM, action,
						"status", "0", "1");

				sendVerifyCodeToCustomer(id, SysUser.SYSTEM);	
			}
			System.out.println("bookform is:\n" + JsonFuncs.toJson(get(id)));		
		}
		System.out.println("end finishPayment");
	}
	

	public JSONArray identifyVerifyCode(String[] codes, FactoryUser user) throws Exception{	
		JSONArray result = new JSONArray();
		for(String code : codes){
			//BookformDetail detail = bookformDetailDao.getByVerifyCode(code);
			JSONObject test = testVerifyCode(code, user);
			result.add(test);
		}
		return result;
	}

	//2015-7-16 update 所有的验证码不显示明文
	private void encryptVerificationCode(List<Map<String, Object>> list) {
		for (Map<String, Object> map : list) {

			String verificationCode = map.get("VERIFICATION_CODE").toString();
			String code = verificationCode.toString().substring(0, 3) + "*****"
					+ verificationCode.substring(8);

			map.put("VERIFICATION_CODE", code);
		}
	}
	
	public PayInfo getPayInfo(String[] codes) throws Exception{

		List<Bookform> bookforms = new ArrayList<Bookform>();
		String bookIdStr = null;
		Double amount = 0.0d;
		String firstId = null;
		for(String code : codes){
			Bookform bookform = get(code);
			if(bookform == null){
				bookform = bookformDao.getByProperty("code", code);
			}
			if(bookform == null || bookform.getPayType() != 0){
				throw new Exception("订单:" + code + " 不支持在线付款!");
			}
			if(bookform.getPaymentId() != null){
				throw new Exception("订单:" + bookform.getCode() + " 已完成付款!");
			}
			if(firstId == null){
				firstId = bookform.getId();
			}
			bookforms.add(bookform);
			
			amount += bookform.getSales();
			if(bookIdStr == null)
				bookIdStr = bookform.getId();
			else
				bookIdStr += "," + bookform.getId();
		}

		
		List<BookformDetail> details = bookformDetailDao.getAllByProperty("bookId", firstId);	
		String title = details.get(0).getProductName();
		if(title.length() >= 20){
			title = title.substring(0, 20);
		}
		if(details.size() > 1 || codes.length > 1){
			title += "...等多项商品";
		}
		

		return new PayInfo(title, amount, BookformPaymentCallbackUtils.class.getName(),bookIdStr);
	}
	

	public int getValidDetailCount(String customerId){
		return bookformDetailDao.calculateConsumption(customerId);
	}
	
	//2015-7-16 update 再次获取验证码
	public String againSendVerifycode(Customer customer, String detailId) throws Exception {
		
		BookformDetail detail = this.getDetail(detailId);
		
		String smsText = "您购买的" + detail.getProductName()+" 验证码为"+detail.getVerificationCode();
		smsText+="。如有疑问请致电4000-666-899";
		
		smsService.sendSmsIgnoreError(customer.getMobile(), smsText, null, "againSend Book Verifycode");
		
		return null;
	}
	
	//根据用户获取订单列表
	public List<Bookform> getBookform(CustomerInfo customerInfo) {
		// TODO Auto-generated method stub
		//customerInfo.getc
		return null;
	}
	
	public int getOrderCount(String customerId, String status){
		Query query = new ListQuery();
		query.select("count(1) count")
			.from(" t_bookform t ")
			.where(" customer_id = :customerId and t.status=:status")
			.put("status", status)
			.put("customerId", customerId);	
		
		generalDao.execute(query);
		Map row = (Map)query.getResult().getRows().get(0);
		return Integer.valueOf(row.get("COUNT").toString());
	}
	
	 统计商家已经确认的订单数量 
	public int getFactoryBookformCount(String factoryId){
		return bookformDao.getFactoryBookformCount(factoryId);
	}
	
	 统计商家当天确认的订单数量 
	public int getCurrentDayBookformCount(String factoryId){
		
		Date startDate = DateFuncs.trunc(new Date());
		Date endDate = DateFuncs.addDay(startDate, 1);
		
		return bookformDao.getCurrentDayBookformCount(factoryId , startDate ,endDate);
	}
	*/
	@Transactional
	public void submitBookform(CartData cartData,FactoryUser factoryUser,OrderEntity data) throws Exception{
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
	public Pair<List<OrderData>, Integer> getBookformByFactory(String factoryId,int status,int pageNo) throws Exception{
		
		PagedQuery query  = new PagedQuery( PageSettings.of(pageNo));
		
		StringBuilder where = new StringBuilder(" 1=1 ");
		
		JSONObject queryJson = new JSONObject();
		queryJson.element("factoryId", factoryId).element("status", status);
		
		this.addQueryEqualFilter(queryJson, where, query, "factoryId",
				" and b.factory_id = :factoryId");
		
		this.addQueryEqualFilter(queryJson, where, query, "status",
				" and b.status = :status");
		
		//1. 只返回ID
		query.select(" b..id ").from(
				" t_bookform b ").where(where.toString()).orderBy(" f.update_time desc ");
		generalDao.execute(query);
		
		//2. 加载订单数据
		List<OrderData> listOrderData = this.getOrderData(query.getRows());
		
		return new Pair<List<OrderData>, Integer>(listOrderData, query.getResult().getPageCount());
	}
	
	private List<OrderData> getOrderData(List<Map<String, String>> rows)  throws Exception{
	
		List<OrderData> listResult= new LinkedList<OrderData>();
		
		for (Map<String, String> map : rows) {
			
			Bookform bookform = this.get(map.get("ID"));
			List<BookformDetail> listDetails = bookformDetailDao.getAllByBookId(bookform.getId());
			
			OrderData data = new OrderData(bookform);
			listResult.add(data);
		}
		
		return null;
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
}