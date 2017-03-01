package com.sys.service;

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

import com.sys.dao.AdDao;
import com.sys.entity.Ad;


@Service
@Transactional(readOnly = true)
public class AdService extends BaseService<Ad>{
	public QueryResult query(String condition, QuerySettings settings){
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		
		Query query = new PagedQuery(settings);
		
		StringBuilder where = new StringBuilder();
		where.append( " 1=1");
		
		this.addQueryLikeFilter(queryJson, where, query, "title", 
			" and (t.title like :title )");
		this.addQueryEqualFilter(queryJson, where, query, "status", " and t.status = :status ");
		
		query.select( " t.*,(select name from sys_user where id = t.user_id) user_name ").
				from(" t_ad t ").
				where(where.toString()).
				orderBy(" t.update_time desc ");	
		
		generalDao.execute(query);
		return query.getResult();
	}
	
	@Autowired
	private AdDao adDao;
	@Autowired
	private GeneralDao generalDao;
}
