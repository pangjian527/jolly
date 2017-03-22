package com.sys.service;

import net.sf.json.JSONObject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;

import com.sys.dao.ExpressFeeDao;
import com.sys.entity.ExpressFee;


@Service
@Transactional(readOnly = true)
public class ExpressFeeService extends BaseService<ExpressFee>{
	@Override
	public QueryResult query(String condition, QuerySettings settings) {
		//JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		Query query = new PagedQuery(settings);
		StringBuffer select = new StringBuffer(" t.* ");
		StringBuilder where = new StringBuilder(" 1=1 ");

		query.select(select.toString()).from(
				" t_express_fee t").where(
				where.toString()).orderBy(" t.update_time desc ");
		generalDao.execute(query);
		return query.getResult();
	}
	
	public double getDeliveryCost(double sales){
		
		List<ExpressFee> list = expressFeeDao.getAll();
		if(!list.isEmpty()){
				ExpressFee expressFee = list.get(0);
				if(sales >= expressFee.getAmountForFree()){
					return 0;
				}
		}
		return list.get(0).getFee();
	}
	@Autowired
	private ExpressFeeDao expressFeeDao;
	@Autowired
	private GeneralDao generalDao;
	
}
