package com.sys.dao;


import org.springframework.stereotype.Repository;

import com.sys.entity.ProfitConfig;

import pub.dao.hibernate.HibernateDao;

@Repository
public class ProfitConfigDao extends HibernateDao<ProfitConfig>{

	public ProfitConfigDao(){
		super(ProfitConfig.class);
	}
	
}
