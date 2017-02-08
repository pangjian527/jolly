package com.sys.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.functions.StrFuncs;

import com.sys.dao.ConfigDao;
import com.sys.entity.Config;

@Service
@Transactional(readOnly = true)
public class ConfigService {

	public Config get(String id) {
		return configDao.get(id);
	}

	@Transactional
	public void save(Config config) {
		configDao.save(config);
	}
	
	public Map<String, String> getByAll() {
		Map<String, String> result = new HashMap<String, String>();
		List<Config> configs = configDao.getAll();
		for(Config config: configs) {
			if(StrFuncs.notEmpty(config.getKey()) && StrFuncs.notEmpty(config.getValue())){
				result.put(config.getKey().trim(), config.getValue().trim());
			}
		}
		return result;
	}

	@Autowired
	private ConfigDao configDao;
}