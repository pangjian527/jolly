package com.sys.dao;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.ExpressFee;

@Repository
public class ExpressFeeDao extends HibernateDao<ExpressFee> {
	public ExpressFeeDao() {
		super(ExpressFee.class);
	}
}
