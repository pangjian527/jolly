package com.sys.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.CriteriaSpecification;
import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;
import pub.functions.StrFuncs;

import com.sys.entity.Bookform;

@Repository
public class BookformDao extends HibernateDao<Bookform> {
	
	public BookformDao() {
		super(Bookform.class);
	}
	
	/*
	 * @版本说明：2014-11-10 pj add
	 * 
	 * @功能说明：统计商家库存咨询
	 */
	public int calculateInquirystock(String serviceFactoryId){
		String sql = "select count(1) from " +
				"(select distinct b.* from t_bookform b ,t_bookform_detail d ,t_product p " +
				"where b.id=d.book_id and b.status=1 and p.id=d.product_id and p.category=0 and b.service_factory_id=:serviceFactoryId " +
				"and b.tracking_type='w') c";

		return Integer.valueOf(this.getSession().createSQLQuery(sql)
				.setParameter("serviceFactoryId", serviceFactoryId).uniqueResult().toString());
	}
	
	/*
	 * @版本说明：2014-11-21 pj add
	 * 
	 * @功能说明：查询到需要发送库存咨询的订单
	 * 
	 * @业务说明：必须是已经确认的订单并且是配送模式是b.tracking_type=w的订单
	 */
	public List<Bookform> getAllInventoryConsult(String serviceFactoryId){
		String sql="select distinct b.* from t_bookform b ,t_bookform_detail d ,t_product p " +
				"where b.id=d.book_id and b.status=1 and p.id=d.product_id and p.category=0 " +
				"and b.tracking_type='w'";
		
		if(StrFuncs.notEmpty(serviceFactoryId)){
			sql+=" and b.service_factory_id=:serviceFactoryId ";
		}
		SQLQuery query = this.getSession().createSQLQuery(sql).addEntity(Bookform.class);
		if(StrFuncs.notEmpty(serviceFactoryId)){
			query.setParameter("serviceFactoryId", serviceFactoryId);
		}
		return query.list();
	}

	/*
	 * @功能说明：统计客户待付款订单数
	 * 
	 * @版本信息：2014-12-9 pj add
	 */
	public int waitPayBookCount(String customerId) {
		String sql="select count(1) from t_bookform b where b.pay_type=0 and b.customer_id=:customerId  and b.payment_id is null and b.status = 0";
		
		return Integer.parseInt(this.getSession().createSQLQuery(sql).setParameter("customerId", customerId).uniqueResult()
				.toString());
	}
	/* 根据订单号code查询Bookform
	 * 2015-02-09 by dgs
	 * */
	public Bookform getByCode(String code){
		String hql = "from Bookform where code =:code";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("code", code);
		query.setMaxResults(1);
		return (Bookform)query.uniqueResult();
	}
	
	
	/**
	 * 查询订单(店铺分组,审计导出用)
	 * @param date
	 * @return
	 */
	public List<Map<String,Object>> getBookFormForCertificateProduct(String beginTime, String endTime){
		String sql = "select b.contact_man,b.contact_addr,b.priority,bd.product_name as name,f.name as factory_name,f.addr as factory_addr, f.man as factory_man, ec.code, sum(bd.count) as total_count,bd.price,sum(bd.price) as total_price,pt.speed_symbol,pt.load_index,pt.pattern,ts.tread,ts.flat_rate,ts.diameter,ts.remark from t_bookform b"
				+ " left join t_bookform_detail bd on b.id = bd.book_id"
				+ " left join t_external_config ec on bd.product_id = ec.reference_id"
				+ " left join t_factory f on b.service_factory_id = f.id"
				+ " left join t_product_tyre pt on bd.product_id = pt.product_id"
				+ "	left join t_tyre_size ts on pt.tyre_size_id = ts.id"
				+ " where b.is_Self = 1 and b.tracking_type in ('c','s') and b.create_time >= to_date(:beginTime,'yyyy-mm-dd hh24:mi:ss') and b.create_time <= to_date(:endTime,'yyyy-mm-dd hh24:mi:ss')"
				+ " group by b.contact_man,b.contact_addr,b.priority,bd.product_name,f.name,f.addr,f.man,ec.code,bd.price,pt.speed_symbol,pt.load_index,pt.pattern,ts.tread,ts.flat_rate,ts.diameter,ts.remark"
				+ " order by f.name";
		
		return this.getSession().createSQLQuery(sql).setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP).setParameter("beginTime", beginTime).setParameter("endTime", endTime).list();
	}
	
	/* 统计商家已经确认的订单数量 */
	public int getFactoryBookformCount(String serviceFactoryId) {

		String sql = "select count(1) from t_bookform b where b.service_factory_id =:serviceFactoryId ";

		return Integer.valueOf(this.getSession().createSQLQuery(sql)
				.setParameter("serviceFactoryId", serviceFactoryId)
				.uniqueResult().toString());
	}

	/* 统计商家当天确认的订单数量 */
	public int getCurrentDayBookformCount(String serviceFactoryId,
			Date startDate, Date endDate) {

		String sql = "select count(1) from t_bookform b where  b.service_factory_id =:serviceFactoryId and "
				+ "b.create_time >=:startDate and b.create_time <:endDate and b.status <> 0";
		return Integer.valueOf(this.getSession().createSQLQuery(sql)
				.setParameter("serviceFactoryId", serviceFactoryId)
				.setParameter("startDate", startDate).setParameter("endDate",
						endDate).uniqueResult().toString());
	}
	
	/* 统计商家的所有订单数 */
	public int countBookformByFactory(String factoryId) {

		String sql = "select count(1) from t_bookform b where  b.factory_id =:factoryId ";
		
		return Integer.valueOf(this.getSession().createSQLQuery(sql)
				.setParameter("factoryId", factoryId).uniqueResult().toString());
	}

	public void autoFinishOrder() {
		String sql = "update t_bookform t set t.status = 4 where t.status = 2 and t.delivery_time<date_sub(date(now()),interval  9 DAY);";
		this.getSession().createSQLQuery(sql).executeUpdate();
	}
	
}
