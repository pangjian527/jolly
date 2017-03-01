package com.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sys.dao.UsageRecordDao;
import com.sys.entity.UsageRecord;

@Service
@Transactional(readOnly = true)
public class UsageRecordService {

	public int countUsageQuery(String securityCode){
		return usageRecordDao.countUsageQuery(securityCode);
	}
	
	public List<UsageRecord> getUsageByCode(String securityCode){
		return usageRecordDao.getAllByProperty("security_Code", securityCode, "create_time desc");
	}
	
	@Transactional
	public void addUsage(String securityCode,String factoryId){
		UsageRecord record = new UsageRecord();
		record.setFactoryId(factoryId);
		record.setSecurityCode(securityCode);
		
		usageRecordDao.save(record);
	}
	
	@Autowired
	private UsageRecordDao usageRecordDao;
	
}


