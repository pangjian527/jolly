package com.sys.dao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
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


	public List<ProductBrand> getByCategory(String category) {
		String hql = "from ProductBrand ";
		if(StringUtils.isNotEmpty(category)){
			hql += " where category =:category";
		}
		hql += " order by seq,name asc";
		Query query = this.getSession().createQuery(hql);
		if(StringUtils.isNotEmpty(category)){
			query.setParameter("category", category);
		}
		return query.list();
	}
	
}
