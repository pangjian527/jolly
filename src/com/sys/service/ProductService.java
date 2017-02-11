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

import com.sys.dao.ProductDao;
import com.sys.entity.Product;

@Service
@Transactional(readOnly = true)
public class ProductService extends BaseService<Product>{

	@Override
	public QueryResult query(String condition, QuerySettings settings) {
		
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		
		Query query = new PagedQuery(settings);
		StringBuffer select = new StringBuffer(" p.* ");
		StringBuilder where = new StringBuilder(" 1=1 ");
		
		query.select(select.toString()).from(" t_product p").where(
		where.toString()).orderBy(" p.update_time desc ");
		generalDao.execute(query);
		return query.getResult();
	}
	
	@Autowired
	private GeneralDao generalDao;
	
	@Autowired
	private ProductDao productDao;
}
