package com.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;
import pub.functions.ColFuncs;

import com.sys.entity.FactoryUser;

@Repository
public class FactoryUserDao extends HibernateDao<FactoryUser> {
	
	public FactoryUserDao() {
		super(FactoryUser.class);
	}

	/**
	 * 根据account/mobile/email，获取账号
	 * @param username
	 * @param password
	 * @return
	 * @throws Exception
	 */
	public FactoryUser getByKeyword(String keyword){
		String hql = "from FactoryUser where id = :keyword or account = :keyword or mobile = :keyword";
		return (FactoryUser)this.getSession()
								.createQuery(hql)
								.setParameter("keyword", keyword)
								.setMaxResults(1)
								.uniqueResult();
	}
	
	public FactoryUser getByAccount(String account){
		String sql= "select * from t_factory_user where account =:username ";
		List<FactoryUser> check = this.getSession().createSQLQuery( sql).addEntity(FactoryUser.class)
			.setString( "username", account)
				.list();
		if(check!=null && check.size()>0){
			return (FactoryUser)check.get(0);
		}else{
			return null;
		}
	}
	
	public FactoryUser getByMobileOrAccount(String mobileOrAccount){
		String sql= "select * from t_factory_user where account =:mobileOrAccount or mobile =:mobileOrAccount";
		List<FactoryUser> check = this.getSession().createSQLQuery( sql).addEntity(FactoryUser.class)
			.setString( "mobileOrAccount", mobileOrAccount)
				.list();
		if(check!=null && check.size()>0){
			return (FactoryUser)check.get(0);
		}else{
			return null;
		}
	}
	
	/*
	 * @功能说明：获取商家的所有用户
	 * 
	  * @版本说明：2014-11-17 pj
	 */
	public List<FactoryUser> getFactoryAllUser(String factoryId) {
		String sql = "select * from t_factory_user u where u.factory_id=:factoryId and status!=0";

		return this.getSession().createSQLQuery(sql).addEntity(
				FactoryUser.class).setParameter("factoryId", factoryId).list();
	}
	
	/*
	 * jmj 2015-05-04
	 * 根据某个属性 查询出是否存在跟其相同的数据
	 * attribute :所要校验的字段
	 * value :所要校验的数据
	 */
	public FactoryUser getByAttribute(String attribute, String value) {
		StringBuilder sql = new StringBuilder("select * from t_factory_user where ");
		sql.append(attribute+" =:value");
		List<FactoryUser> check = this.getSession().createSQLQuery( sql.toString()).addEntity(FactoryUser.class)
			.setString( "value", value)
				.list();
		if(check!=null && check.size()>0){
			return (FactoryUser)check.get(0);
		}else{
			return null;
		}
	}
}
