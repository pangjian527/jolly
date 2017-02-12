package com.sys.service;

import java.util.Date;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;

import com.sys.dao.ScoreDao;
import com.sys.entity.Score;

@Service
@Transactional(readOnly = true)
public class ScoreService extends BaseService<Score>{

	@Override
	public QueryResult query(String condition, QuerySettings settings) {
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		Query query = new PagedQuery(settings);
		StringBuffer select = new StringBuffer(" s.* ");
		StringBuilder where = new StringBuilder(" 1=1 ");

		this.addQueryEqualFilter(queryJson, where, query, "sysUserId",
				" and s.sys_user_id = :sysUserId");

		query.select(select.toString()).from(" t_score s ").where(
				where.toString()).orderBy(" s.create_time desc ");
		generalDao.execute(query);
		return query.getResult();
	}
	
	public int getAllScore(String sysUserId,Date startDate,Date endDate){
		return scoreDao.getAllScore(sysUserId,startDate,endDate);
	}
	
	
	@Autowired
	private GeneralDao generalDao;
	
	@Autowired
	private ScoreDao scoreDao;
	
}
