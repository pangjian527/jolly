package com.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;

import com.sys.dao.ProductItemDao;
import com.sys.entity.Bookform;
import com.sys.entity.ProductItem;
import com.sys.entity.StockRecord;

@Service
@Transactional(readOnly = true)
public class ProductItemService extends BaseService<ProductItem>{

	public QueryResult query(String condition, QuerySettings settings) {
		
		return null;
	}
	
	public ProductItem getBySecurityCode(String securityCode){
		return productItemDao.getBySecurityCode(securityCode);
	}
	
	@Transactional
	public String inStock(String productId,String  securityCode) {
		ProductItem productItem = this.getBySecurityCode(securityCode);
		
		if(productItem != null){
			return "防伪码已经存在，请重新输入！";
		}
		
		ProductItem item = new ProductItem();
		item.setProductId(productId);
		item.setSecurityCode(securityCode);
		item.setStatus(ProductItem.STATUS_EFFECTIVE);
		
		productItemDao.save(item);
	
		StockRecord stockRecord = new StockRecord();
		stockRecord.setType(1);
		stockRecord.setSecurityCode(securityCode);
		stockRecordService.save(stockRecord);
		
		return null;
	}
	
	@Transactional
	public String outStock(String bookId, String securityCode) {
		
		ProductItem productItem = this.getBySecurityCode(securityCode);
		if(productItem == null){
			return "防伪码不存在，请重新输入！";
		}
		
		if(productItem.getStatus() == ProductItem.STATUS_OUT_STOCK ){
			return "该电池已经销售出库，请重新输入！";
		}
		if(productItem.getStatus() == ProductItem.STATUS_INVALID ){
			return "该电池已经无效，请重新输入！";
		}
		Bookform bookform = bookformService.get(bookId);
		
		productItem.setStatus(ProductItem.STATUS_OUT_STOCK);
		productItemDao.save(productItem);
		
		StockRecord stockRecord = new StockRecord();
		stockRecord.setType(0);
		stockRecord.setSecurityCode(securityCode);
		stockRecord.setBookId(bookId);
		stockRecordService.save(stockRecord);
		
		return null;
	} 
	
	@Autowired
	private ProductItemDao productItemDao;
	@Autowired
	private StockRecordService stockRecordService;
	@Autowired
	private BookformService bookformService;


	
}
