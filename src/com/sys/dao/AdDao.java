package com.sys.dao;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.Ad;

@Repository
public class AdDao extends HibernateDao<Ad> {

	public AdDao() {
		super(Ad.class);
	}
}
