package com.sys.service;

import net.sf.json.JSONObject;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QueryResultType;
import pub.dao.query.QuerySettings;
import pub.functions.JsonFuncs;
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
		
		this.addQueryEqualFilter(queryJson, where, query, "category",
				" and p.category = :category");
		
		this.addQueryEqualFilter(queryJson, where, query, "brandId",
				" and p.brand_id = :brandId");
		
		this.addQueryLikeFilter(queryJson, where, query, "name",
				" and p.name like :name");
		
		query.select(select.toString()).from(" t_product p").where(
		where.toString()).orderBy(" p.update_time desc ");
		
		generalDao.execute(query);
		return query.getResult();
	}
	
	public List<Product> getAllByStatus(int statusValid){
		List<Product> products = productDao.getAll();
		
		List<Product> list = new LinkedList<Product>();
		for (Product product : products) {
			if(product.getStatus() == Product.STATUS_VALID){
				list.add(product);
			}
		}
		return list;
	}
	
	public void addStockOut(String productId,int addCount) {
		Product product = this.get(productId);
		product.setStockCount((product.getStockCount()==null?0:product.getStockCount())+addCount);
		this.save(product);
	}
	
	public QueryResult queryMall(JSONObject queryJson, QuerySettings settings) {
		
		settings.setResultBeanClass(Product.class);
		settings.setResultType(QueryResultType.BEAN);
		
		Query query = new PagedQuery(settings);
		StringBuffer select = new StringBuffer(" p.* ");
		StringBuilder where = new StringBuilder(" 1=1 ");
		
		this.addQueryEqualFilter(queryJson, where, query, "category",
				" and p.category = :category");
		
		this.addQueryLikeFilter(queryJson, where, query, "name",
				" and p.name like :name");
		
		if(!StrFuncs.isEmpty(queryJson.getString("brandIds"))) {
			query.put("brandIds", queryJson.getString("brandIds").split(","));
			where.append(" and p.brand_id in (:brandIds)");
		}
		
		this.addQueryEqualFilter(queryJson, where, query, "status"," and p.status = :status");
		query.select(select.toString()).from(" t_product p").where(where.toString());
		
		
		if( JsonFuncs.getIntValue(queryJson, "priceSort", 0) == 0) {
			query.orderBy(" p.price desc ");
		}else if (JsonFuncs.getIntValue(queryJson, "priceSort", 0) == 1) {
			query.orderBy(" p.price asc ");
		}
		
		generalDao.execute(query);
		return query.getResult();
	}
	
	@Autowired
	private GeneralDao generalDao;
	
	@Autowired
	private ProductDao productDao;

	
}
