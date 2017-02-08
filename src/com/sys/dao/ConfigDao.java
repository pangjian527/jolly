package com.sys.dao;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.Config;

@Repository
public class ConfigDao extends HibernateDao<Config> {
	public ConfigDao() {
		super(Config.class);
	}
}
