package com.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;

import com.sys.entity.Product;

@Service
@Transactional(readOnly = true)
public class ProductService extends BaseService<Product>{

	@Override
	public QueryResult query(String condition, QuerySettings settings) {
		
		
		
		return null;
	}
	
}
