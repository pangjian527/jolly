package com.sys.dao;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.Product;

@Repository
public class ProductDao extends HibernateDao<Product> {
	
	public ProductDao(){
		super(Product.class);
	}
	
}
