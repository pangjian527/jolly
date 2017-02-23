package com.sys.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.Factory;
import com.sys.entity.Score;

@Repository
public class ScoreDao extends HibernateDao<Score> {

	public ScoreDao(){
		super(Score.class);
	}

	public int getAllScore(String sysUserId, Date startDate, Date endDate) {
		
		StringBuffer sql = new StringBuffer(" select coalesce(sum(s.score),0) " +
				"from t_score s where s.sys_user_id =:sysUserId ");
		
		if(startDate != null){
			sql.append(" and s.create_time >=:startDate");
		}
		if(endDate != null){
			sql.append(" and s.create_time <=:endDate");
		}
		
		Query query = this.getSession().createSQLQuery(sql.toString()).
				setParameter("sysUserId", sysUserId);
		
		if(startDate !=null ){
			query.setParameter("startDate", startDate);
		}
		if(startDate !=null ){
			query.setParameter("endDate", endDate);
		}
		
		return Integer.valueOf(query.uniqueResult().toString());
	}

	public int getFactoryHistoryScore(String factoryId) {
		StringBuffer sql = new StringBuffer(" select coalesce(sum(s.score),0) " +
			"from t_score s where s.factory_id =:factoryId and score>=0");
		
		Query query = this.getSession().createSQLQuery(sql.toString()).
		setParameter("factoryId", factoryId);

		return Integer.valueOf(query.uniqueResult().toString());
	}
	
	public int getFactoryConsumeScore(String factoryId) {
		StringBuffer sql = new StringBuffer(" select coalesce(sum(s.score),0) " +
			"from t_score s where s.factory_id =:factoryId and score <0");
		
		Query query = this.getSession().createSQLQuery(sql.toString()).
		setParameter("factoryId", factoryId);

		return Integer.valueOf(query.uniqueResult().toString());
	}
	
}
