package com.sys.dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.BillDetail;

@Repository
public class BillDetailDao extends HibernateDao<BillDetail> {
	
	public BillDetailDao() {
		super(BillDetail.class);
	}
	
	
	public List<BillDetail> getAllByBillId(String billId){
		try {
			String sql = "select * from T_BILL_DETAIL where BILL_ID =:billId order by create_time desc";
			return this.getSession().createSQLQuery(sql).addEntity(BillDetail.class).setString("billId", billId).list();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void deleteByBillId(String billId){
		String sql = "delete from T_BILL_DETAIL where BILL_ID =:billId";
		this.getSession().createSQLQuery(sql).setString("billId", billId).executeUpdate();
	}

/*	
	 * @功能说明：统计商家余额
	 * 
	 * @版本说明：2014-11-17 pj
	 
	public double countFactoryBalance(String factoryId) {
		
		String sql = "select COALESCE(sum(b.price_pay),0.0) from t_bill_detail b " +
				"where b.service_factory_id=:factoryId and b.status in(0,2) ";

		return Double.valueOf(this.getSession().createSQLQuery(sql).setParameter(
						"factoryId", factoryId).uniqueResult().toString());
	}*/
	/*
	 * @功能说明：根据商家获取所有未结算的账单
	 * 
	 * @版本说明：2014-11-17 pj
	 */
	public List<BillDetail> getAllByFactoryId(String factoryId, int status) {
		
		String sql = " from BillDetail b where b.factoryId = :factoryId and b.status = :status order by createTime desc";
		return this.getSession()
				.createQuery(sql)
				.setParameter("factoryId", factoryId)
				.setParameter("status", status)
				.list();
	}

	/*
	 * @功能说明：统计商家未计算记录数
	 * 
	 * @版本说明：2014-11-5 pj
	 */
	public int countNotSettlement(String factoryId) {
		
		String sql = "select count(1) from t_bill_detail b " +
		"where b.service_factory_id=:factoryId and b.status=0 ";
		return Integer.valueOf(this.getSession().createSQLQuery(sql).setParameter(
				"factoryId", factoryId).uniqueResult().toString());
	}

	/*
	 * @功能说明：绑定申请结算
	 * 
	 * @版本说明：2014-11-5 pj
	 */
/*	public void bindBill(String billId,String factoryId) {
		
		List<BillDetail> billDetails = this.getAllByFactory(factoryId);
		for (int i = 0; i < billDetails.size(); i++) {
			BillDetail billDetail = billDetails.get(i);
			billDetail.setBillId(billId);
			//结算中
			billDetail.setStatus(2);
			
			this.save(billDetail);
		}
	}*/
	/*
	 * @功能说明：解除绑定
	 * 
	 * @版本说明：2014-11-5 pj
	 */
	public void revocation(String billId) {
		String sql="update t_bill_detail b set b.status=0 ,b.bill_id=null where b.bill_id=:billId";
		this.getSession().createSQLQuery(sql).setParameter("billId", billId).executeUpdate();
	}


	/* 统计商家一周的营业额 */
	public double calculateFactoryWeekBusiness(String factoryId,
			Date weekFirstDay, Date weekEndDay) {
		
		String sql = "select sum(b.price_pay)  from t_Bill_Detail b where" +
				" b.service_Factory_Id = :factoryId " +
				"and b.create_Time >=:weekFirstDay " +
				"and b.create_time <:weekEndDay";
		
		Object firstResult = this.getSession().createSQLQuery(sql + " and b.price_pay >=0").setParameter(
				"factoryId", factoryId).setParameter("weekFirstDay",
				weekFirstDay).setParameter("weekEndDay", weekEndDay)
				.uniqueResult();
		
		Object secondResult = this.getSession().createSQLQuery(sql + " and b.price_pay <0").setParameter(
				"factoryId", factoryId).setParameter("weekFirstDay",
				weekFirstDay).setParameter("weekEndDay", weekEndDay)
				.uniqueResult();
		
		
		if(firstResult ==null)
			firstResult = 0.0;
		if(secondResult == null)
			secondResult =0.0;
		
		double total =Double.valueOf(firstResult.toString()) -Double.valueOf(secondResult.toString());
		
		
		return total;
	}
}
