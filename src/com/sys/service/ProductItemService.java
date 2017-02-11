package com.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;

import com.sys.dao.ProductItemDao;
import com.sys.entity.ProductItem;

@Service
@Transactional(readOnly = true)
public class ProductItemService extends BaseService<ProductItem>{

	public QueryResult query(String condition, QuerySettings settings) {
		
		return null;
	}
	
	public ProductItem getBySecurityCode(String securityCode){
		return productItemDao.getBySecurityCode(securityCode);
	}
	
	@Autowired
	private ProductItemDao productItemDao;
}
