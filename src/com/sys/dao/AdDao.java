package com.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.Ad;

@Repository
public class AdDao extends HibernateDao<Ad> {

	public AdDao() {
		super(Ad.class);
	}
	
	public List<Ad> getActiveAd(){
		String sql="select * from t_ad t where t.status=1 order by seq";
		return this.getSession().createSQLQuery(sql).addEntity(Ad.class).list();
	}
}
