package com.sys.service;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;

import com.sys.dao.BillDetailDao;
import com.sys.entity.BillDetail;
import com.sys.entity.Bookform;

@Service
@Transactional(readOnly = true)
public class BillDetailService extends BaseService<BillDetail> {

	@SuppressWarnings("static-access")
	public QueryResult query(String condition, QuerySettings settings){

		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		
		Query query = new PagedQuery(settings);
		StringBuilder select = new StringBuilder(" t.*, f.name as FACTORY_NAME ");
		
		StringBuilder where = new StringBuilder();
		where.append( "1 = 1");
		
		this.addQueryEqualFilter(queryJson, where, query, "factoryId", 
				" and t.factory_id = :factoryId");
		
		this.addQueryDateFilter(queryJson, where, query, "startTime", 
				" and t.create_time >= :startTime");
		this.addQueryDateFilter(queryJson, where, query, "endTime", 
				" and t.create_time <= :endTime");
		
		
		this.addQueryEqualFilter(queryJson, where, query, "status", 
				" and t.status = :status");	
		this.addQueryLikeFilter(queryJson, where, query, "productName", 
				" and t.product_name like :productName ");
		this.addQueryLikeFilter(queryJson, where, query, "factoryName", 
				" and f.name like :factoryName ");
		
		query.select(select.toString()).from(" t_bill_detail t left join t_factory f on t.factory_id=f.id ").where(
				where.toString()).orderBy(" t.update_time desc ");
		generalDao.execute(query);
		return query.getResult();
	}
	
	public List<BillDetail> getAllByBillId(String billId){
		return billDetailDao.getAllByBillId(billId);
	}
	
	public void deleteByBillId(String billId){
		billDetailDao.deleteByBillId(billId);
	}
	
	public List<BillDetail> getAllByFactoryId(String factoryId, int status) {
		return billDetailDao.getAllByFactoryId(factoryId, status);
	}
	
	public List<BillDetail> getAllByFactoryId(String factoryId) {
		return billDetailDao.getAllByProperty("serviceFactoryId", factoryId, "createTime desc");
	}
	
	
	/*@Transactional
	public void create(Bookform bookform, BookformDetail detail) throws Exception {
		
		if(bookform.getIsSelf() == 1){
			createTyre(bookform, detail);
		}
		else{
			createService(bookform, detail);
		}
		

		BillDetail billDetail=new BillDetail();
		
		billDetail.setBookId(bookform.getId());
		billDetail.setBookformDetailId(.getId());
		billDetail.setPricePay(calculatePricePay(product,bookform,bookformDetail));
		billDetail.setProductId(product.getId());
		billDetail.setServiceFactoryId(bookform.getServiceFactoryId());
		//billDetail.setRemark(billDetailRemark(product, bookform, bookformDetail));
		
		billDetailDao.save(billDetail);
	}
	
	private static final double PAYMENT_PERCENTAGE = 0;
	private static final double COMISSION_PERCENTAGE = 0;
	
	private void createTyre(Bookform bookform, BookformDetail bookformDetail) throws Exception {
		double pricePay = 0;
		String type = null;
		String describe = null;
		JSONObject detail = new JSONObject();
		if(bookform.getPayType() == 0){
			if(bookform.getTrackingType().equals("s")){
				
				type = "轮胎安装费";
				describe = "商城在线收款并提供轮胎，门店仅负责安装";
				int installCharge = getInstallCharge(bookformDetail.getProductId());
				pricePay = installCharge;
				detail.element("公式", "轮胎安装费(" + pricePay + ")");
			}
			else{
				type = "商城代收轮胎款(扣除佣金)";
				describe = "商城在线收款，门店提供轮胎+安装";
				double charge1 = bookformDetail.getPrice() * COMISSION_PERCENTAGE;
				double charge2 = bookformDetail.getPrice() * PAYMENT_PERCENTAGE;
				double priorityAmount = StrFuncs.notEmpty(bookformDetail
						.getTyreUrgentId()) ? bookformDetail
						.getPriorityAmount() : 0.0;
				
				
				pricePay = bookformDetail.getPrice() - charge1 - charge2 +priorityAmount;
				detail.element("公式", "轮胎货款(" + bookformDetail.getPrice() 
						+ ") - 在线支付手续费(" + charge1  + ") - 交易佣金 (" + charge2 + ") + 加急费用("+priorityAmount+ ")");
			}
		}
		else{
			if(bookform.getTrackingType().equals("s")){
				//3.车主到店支付，且使用商城轮胎，此时门店欠商城费用，金额=轮胎费-80元轮胎安装费
				type = "门店代收轮胎款(扣除轮胎安装费)";
				describe = "商城提供轮胎，门店负责安装并代收货款";
				int installCharge = getInstallCharge(bookformDetail.getProductId());
				pricePay = installCharge - bookformDetail.getPrice();
				detail.element("公式", "轮胎安装费(" + installCharge + ") - 轮胎货款(" + bookformDetail.getPrice() + ")");
			}
			else{
				type = "交易佣金";
				describe = "门店提供轮胎并收款";
				pricePay = - bookformDetail.getPrice() * PAYMENT_PERCENTAGE;
				detail.element("公式", "轮胎货款(" + bookformDetail.getPrice() + ") × " + PAYMENT_PERCENTAGE);
			}
		}
		detail.element("订单编号", bookform.getCode());
		detail.element("验证码", bookformDetail.getVerificationCode());
		detail.element("结算内容", bookformDetail.getProductName());
		
		BillDetail billDetail = new BillDetail();
		billDetail.setBookId(bookform.getId());
		billDetail.setBookformDetailId(bookformDetail.getId());
		billDetail.setProductId(bookformDetail.getProductId());
		billDetail.setServiceFactoryId(bookform.getServiceFactoryId());
		billDetail.setStatus(0);
		billDetail.setType(type);
		billDetail.setDescribe(describe);
		billDetail.setPricePay(pricePay);
		billDetail.setDetail(detail.toString());
		
		save(billDetail);
	}
	
	private int getInstallCharge(String productId){
		ProductTyre productTyre = productTyreService.getByPruductId(productId);
		TyreSize tyreSize = tyreSizeService.get(productTyre.getTyreSizeId());
		String text = tyreSize.getDiameter();
		try{
			if(productTyre.getIsSpecial() == 1){
				return 50;
			}
			int diameter = Integer.valueOf(text);
			if(diameter <= 15){
				return 20;
			}
			else if(diameter == 16){
				return 25;
			}
			else if(diameter == 17){
				return 30;
			}
			else if(diameter == 18){
				return 40;
			}
			else{
				return 50;
			}
		}
		catch(Exception e){
			return 50;
		}
	}
	private void createService(Bookform bookform, BookformDetail bookformDetail) throws Exception {
		double pricePay = 0;
		String type = null;
		String describe = null;
		String subsidy = "+好胎屋补贴(0.0)";
		double couponAmount =0;// 红包商家优惠金额
		double htwCouponAmout=0;//好胎屋优惠金额
		double subsidyMoney = 0;
		String couponDescribe = "";
		String htwCouponDescribe = "";
		JSONObject detail = new JSONObject();
		
		double voucherSubsidyMoney=0;// 代金券商家补贴
		String voucherSubsidy = "+代金券补贴(0.0)";
		double factoryVoucherAmount =0;// 代金券扣减金额
		String factoryVoucherDescribe = "";
		double htwVoucherAmount =0;// 代金券扣减金额
		String htwVoucherDescribe = "";
		double deduct = 0.0 ;// 优惠直减暂时都认为是门店补贴，暂时没有好胎屋补贴 
		String deductDescribe = "";
		
		//2015-07-17 add 
		if (StrFuncs.notEmpty(bookformDetail.getDiscountRuleId())) {
			DiscountRule discountRule = discountRuleService.get(bookformDetail
					.getDiscountRuleId());
			subsidyMoney = discountRule.getFactoryDiscount() != null ? discountRule
					.getFactoryDiscount()
					: 0.00;
			subsidy = " +好胎屋补贴(" + subsidyMoney + ")";
		}
		
		//2016-1-6 add 
		Voucher voucher=voucherService.get(bookformDetail.getVoucherId());
		if (voucher!=null) {
			VoucherConfig voucherConfig = voucherConfigService.get(voucher.getVoucherConfigId());
			double factoryBalance = voucherConfig.getFactoryBalance() != null ? voucherConfig.getFactoryBalance(): 0.00;
			voucherSubsidyMoney=NumberUtil.div(factoryBalance*bookformDetail.getVoucherAmount(), voucher.getAmount());//按比例分配补贴
			voucherSubsidy = " +好胎屋代金券补贴(" +bookformDetail.getVoucherAmount()+"/"+voucher.getAmount()+"*"+ factoryBalance + ")";
		
			double factoryPercent=voucherConfig.getFactoryPercent()==null?0d:voucherConfig.getFactoryPercent();
			factoryVoucherAmount =NumberUtil.div(factoryPercent*bookformDetail.getVoucherAmount(), 100);//
			factoryVoucherDescribe = " -代金券抵扣(" + factoryVoucherAmount + ")";
			
			htwVoucherAmount =NumberUtil.sub(bookformDetail.getVoucherAmount(), factoryVoucherAmount);
			htwVoucherDescribe = " +好胎屋代金券抵扣(" + htwVoucherAmount + ")";
		}
		
		Coupon coupon = couponService.getCouponByBookDetail(bookformDetail.getId());
		//2015-09-11 add
		if(coupon != null){
			CouponConfig couponConfig = couponConfigService.get(coupon.getCouponConfigId());
			couponAmount = couponConfig.getFactoryAmount();
			couponDescribe = " -红包抵扣(" +couponAmount + ")";
			
			htwCouponAmout = couponConfig.getHtwAmount();
			htwCouponDescribe = " +好胎屋红包抵扣(" +htwCouponAmout + ")";
		}

		// 优惠直减,暂时只支持在线支付
		if (bookformDetail.getDeduct() !=null ) {
			deduct = bookformDetail.getDeduct();
		}
		deductDescribe = "  -门店补贴优惠直减(" + deduct + ")";
		
		if(bookform.getPayType() == 0){
			type = "服务费用";
			describe = "商城在线代收费用，门店提供服务";
			
			double sales = StrFuncs.isEmpty(bookformDetail.getPriceType())
			|| BookformDetail.HTW_PRICE.equals(bookformDetail.getPriceType()) ? bookformDetail.getPrice(): bookformDetail.getPriceMart();
			
			double charge1 = sales * COMISSION_PERCENTAGE;
			double charge2 = sales * PAYMENT_PERCENTAGE;
			pricePay = sales - charge1 - charge2 + subsidyMoney+voucherSubsidyMoney -couponAmount-factoryVoucherAmount-deduct;
			detail.element("公式", "服务费(" + bookformDetail.getPrice() 
				+ ") - 在线支付手续费(" + charge1 + ") - 佣金(" + charge2 + ")"+ subsidy+voucherSubsidy 
				+ couponDescribe+factoryVoucherDescribe + deductDescribe);
		}
		else{
			type = "交易佣金";
			describe = "门店提供服务并收款";
			pricePay = - bookformDetail.getPrice() * PAYMENT_PERCENTAGE + subsidyMoney+voucherSubsidyMoney +htwCouponAmout+htwVoucherAmount;
			detail.element("公式", "服务费(" + bookformDetail.getPrice() + ") × " + PAYMENT_PERCENTAGE +subsidy+voucherSubsidy +htwCouponDescribe+htwVoucherDescribe);
		}
		detail.element("订单编号", bookform.getCode());
		detail.element("验证码", bookformDetail.getVerificationCode());
		detail.element("服务名称", bookformDetail.getProductName());
		
		BillDetail billDetail = new BillDetail();
		billDetail.setBookId(bookform.getId());
		billDetail.setBookformDetailId(bookformDetail.getId());
		billDetail.setProductId(bookformDetail.getProductId());
		billDetail.setServiceFactoryId(bookform.getServiceFactoryId());
		billDetail.setStatus(0);
		billDetail.setType(type);
		billDetail.setDescribe(describe);
		billDetail.setPricePay(pricePay);
		billDetail.setDetail(detail.toString());
		save(billDetail);
	}
	
	 * @功能说明  生成结算条目说明
	 * 
	 * @版本信息：2014-12-9 pj add
	 
	private String billDetailRemark(Product product, Bookform bookform,
			BookformDetail bookformDetail) {
		StringBuffer remark = new StringBuffer("【" + product.getName() + "】在"
				+ bookformDetail.getCreateTime() + "消费");
		// 轮胎
		if (bookform.getPayType() == 0) {
			// 在线付款
			remark.append(",该消费卷属于在线付款");
		} else {
			// 到店付款
			remark.append(",该消费卷属于到店付款");
		}

		if (bookform.getTrackingType().equals("s")) {
			// 商城发货
			remark.append(",该商品属于商城发货");
		} else if (bookform.getTrackingType().equals("n")) {
			// 门店货源
			remark.append(",该商品使用的是门店货源");
		}
		return remark.toString();
	}
	
	
	 * @功能说明  计算结算价格
	 * 
	 * @版本信息：2014-12-9 pj add
	 
	private double calculatePricePay(Product product, Bookform bookform,
			BookformDetail bookformDetail) {
		if (product.getCategory() == 0) {
			// 轮胎
			if (bookform.getPayType() == 0) {
				// 在线付款
				if (bookform.getTrackingType().equals("s")) {
					// 商城发货
					return -JsonConfigUtils.installationPrice;
				} else if (bookform.getTrackingType().equals("n")) {
					// 门店货源
					return -bookformDetail.getPrice();
				}
			} else {
				// 到店付款
				if (bookform.getTrackingType().equals("s")) {
					// 商城发货
					return bookformDetail.getPrice()
							- JsonConfigUtils.installationPrice;
				} else if (bookform.getTrackingType().equals("n")) {
					// 门店货源
					return 0.0;
				}
			}
		} else {
			// 服务
			if (bookform.getPayType() == 0) {
				// 在线付款
				return -bookformDetail.getPrice();
			} else {
				// 到店付款
				return 0.0;
			}
		}
		return 0.0;
	}
	

	public double getFactoryAmount(String factoryId) {
		List<BillDetail> details = billDetailDao.getAllByFactoryId(factoryId, 0);
		Double result = 0.0;
		for(BillDetail detail : details){
			//result += detail.getPricePay();
			result=NumberUtil.add(result, detail.getPricePay());
		}
		return result;
	}
	
	
	public int countNotSettlement(String factoryId){
		
		return billDetailDao.countNotSettlement(factoryId);
	}
	
	
	 统计商家一周的营业额 
	public double calculateFactoryWeekBusiness(String factoryId){
		
		Date weekFirstDay = DateFuncs.getWeekFirstDay(new Date());
		
		Date weekEndDay = DateFuncs.getWeekEndDay(new Date());
		return billDetailDao.calculateFactoryWeekBusiness(factoryId ,weekFirstDay ,weekEndDay);
	}*/
	
	@Transactional
	public void deliverBillDetail(Bookform bookform){
		
		BillDetail billDetail = new BillDetail();
		billDetail.setBookId(bookform.getId());
		billDetail.setFactoryId(bookform.getFactoryId());
		billDetail.setStatus(BillDetail.BILL_DETAIL_NOT_SETTLE);
		
		StringBuffer description = new StringBuffer("订单："+bookform.getCode());
		description.append("交易金额：￥"+bookform.getSales());
		
		double amount = 0.0;
		if(bookform.getPayType() == 0){
			description.append("付款类型：在线付款");
		}else if (bookform.getPayType() == 1){
			description.append("付款类型：快递货到付款");
		}
		if(bookform.getPayType() == 2){
			//预发货，后付款
			amount = bookform.getSales();
			description.append("付款类型：预发货后付款");
		}
		
		billDetail.setDescription(description.toString());
		billDetail.setPricePay(amount);
		billDetailDao.save(billDetail);
	}
	

	@Autowired
	private BillDetailDao billDetailDao;
	@Autowired
	private GeneralDao generalDao;
}
