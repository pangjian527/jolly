package com.sys.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.ProductBrand;

@Repository
public class ProductBrandDao extends HibernateDao<ProductBrand> {
	public ProductBrandDao() {
		super(ProductBrand.class);
	}
	
	
	public List<ProductBrand> getAll(Integer status){
		String hql = "from ProductBrand ";
		if(status!=null){
			hql += " where status =:status";
		}
		hql += " order by name asc";
		Query query = this.getSession().createQuery(hql);
		if(status!=null){
			query.setParameter("status", status);
		}
		return query.list();
	}
	
	
}
