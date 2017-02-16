package com.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;

import com.sys.dao.StockRecordDao;
import com.sys.entity.Score;
import com.sys.entity.StockRecord;

@Service
@Transactional(readOnly = true)
public class StockRecordService extends BaseService<Score>{

	@Override
	public QueryResult query(String condition, QuerySettings settings) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<StockRecord> getStockRecordBySecurityCode(String securityCode){
		return stockRecordDao.getAllByProperty("securityCode", securityCode, "createTime desc");
	}
	
	@Autowired
	private StockRecordDao stockRecordDao;
	
}