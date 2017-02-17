package com.sys.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.Factory;

@Repository
public class FactoryDao extends HibernateDao<Factory> {
	public FactoryDao() {
		super(Factory.class);
	}
	
	/**
	 * 获取全部有效的商家/商家
	 * @return
	 */
	public List<Factory> getAllByStatus(){
		String sql = " select * from t_factory where status =:status";
		List<Factory> result = this.getSession().createSQLQuery( sql)
				.addEntity( Factory.class).setParameter( "status", "1")
					.list();
		return result;
	}
	
	/**
	 * 订单处发起库存咨询
	 * @param countyId
	 * @return
	 */
	public List<Factory> getByCountyId(String countyId){
		String sql = " select * from t_factory where COUNTY_ID =:countyId";
		List<Factory> result = this.getSession().createSQLQuery( sql)
				.addEntity( Factory.class).setParameter( "countyId", countyId)
					.list();
		return result;
	}
	
	/**
	 * 根据名称查询店铺
	 * @param name
	 * @return
	 */
	public Factory getByName(String name){
		String sql = "select * from t_factory where name =:name";
		Factory result = (Factory) this.getSession().createSQLQuery(sql).addEntity(Factory.class).setParameter("name", name).uniqueResult();
		return result;
	}
	
	/**
	 * 根据电话或手机查询店铺
	 * @param name
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Factory getByMobile(String phone){
		String sql = "select * from t_factory where tel =:phone  or mobile =:phone";
		List<Factory> result = (List<Factory>) this.getSession().createSQLQuery(sql)
													.addEntity(Factory.class)
													.setParameter("phone", phone)
													.list();
		if(result.size()>0){
			result.get(0);
		}
		return null;
	}
	
	public int countFactoryBySysUser(String sysUserId){
		String sql = "select count(1) from t_factory f where f.sys_user_id =:sysUserId ";
		
		Query query = this.getSession().createSQLQuery(sql)
			.setParameter("sysUserId", sysUserId);
		
		return Integer.valueOf(query.uniqueResult().toString());
	}
	
}