package com.sys.dao;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.UsageRecord;

@Repository
public class UsageRecordDao extends HibernateDao<UsageRecord> {

	public UsageRecordDao(){
		super(UsageRecord.class);
	}

	public int countUsageQuery(String securityCode) {
		String sql = "select count(1) from t_Usage_Record u where u.security_Code =:securityCode";
		Query query = this.getSession().createSQLQuery(sql).setParameter("securityCode", securityCode);
		return Integer.valueOf(query.uniqueResult().toString());
	}
	
}
