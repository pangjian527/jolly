package com.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sys.dao.ProfitConfigDao;
import com.sys.entity.ProfitConfig;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;

@Service
@Transactional(readOnly = true)
public class ProfitConfigService extends BaseService<ProfitConfig>{

	public QueryResult query(String condition, QuerySettings settings) {
		Query query = new PagedQuery(settings);
		StringBuffer select = new StringBuffer(" p.* ");
		StringBuilder where = new StringBuilder(" 1=1 ");
		
		query.select(select.toString()).from(" t_Profit_Config p").where(
		where.toString()).orderBy(" p.update_time desc ");
		generalDao.execute(query);
		return query.getResult();
	}
	
	@Transactional
	public String enable(String id) {
		
		List<ProfitConfig> profitList = profitConfigDao.getAllByProperty("status", ProfitConfig.STATUS_EFFECTIVE);
		
		if(profitList.size() >0 ){
			return "当前已经有激活的配置";
		}
		ProfitConfig profitConfig = profitConfigDao.get(id);
		profitConfig.setStatus(ProfitConfig.STATUS_EFFECTIVE);
		
		profitConfigDao.save(profitConfig);
		return null;
	}
	
	@Transactional
	public String disable(String id) {
		ProfitConfig profitConfig = profitConfigDao.get(id);
		profitConfig.setStatus(ProfitConfig.STATIC_INVALID);
		
		profitConfigDao.save(profitConfig);
		return null;
	}
	
	@Autowired
	private GeneralDao generalDao;
	@Autowired
	private ProfitConfigDao profitConfigDao;
	
	
}
