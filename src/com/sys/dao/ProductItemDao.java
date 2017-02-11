package com.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.ProductItem;

@Repository
public class ProductItemDao extends HibernateDao<ProductItem> {

	public ProductItemDao(){
		super(ProductItem.class);
	}

	public ProductItem getBySecurityCode(String securityCode) {
		
		String hql = "from ProductItem where securityCode = :securityCode";
		List<ProductItem> list = this.getSession().createQuery(hql)
			.setParameter("securityCode", securityCode).list();
		
		if(list.isEmpty()){
			return null;
		}
		
		return list.get(0);
	}
}
