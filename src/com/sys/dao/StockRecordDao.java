package com.sys.dao;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.StockRecord;

@Repository
public class StockRecordDao extends HibernateDao<StockRecord> {
	
	public StockRecordDao(){
		super(StockRecord.class);
	}

}
