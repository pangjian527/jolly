package com.sys.dao;

import java.util.Date;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.Score;

@Repository
public class ScoreDao extends HibernateDao<Score> {

	public ScoreDao(){
		super(Score.class);
	}

	public int getAllScore(String sysUserId, Date startDate, Date endDate) {
		
		StringBuffer sql = new StringBuffer(" select sum(s.score) from t_score s where s.sys_user_id =:sysUserId ");
		
		int countScore = Integer.valueOf(this.getSession().
		createSQLQuery(sql.toString()).
		setParameter("sysUserId", sysUserId).uniqueResult().toString());
		
		return countScore;
	}
	
}
