package com.sys.dao;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.LogPayment;

@Repository
public class LogPaymentDao extends HibernateDao<LogPayment> {
	
	public LogPaymentDao() {
		super(LogPayment.class);
	}
	
}
