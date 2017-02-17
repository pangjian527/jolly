package com.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;

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
		productService.addStockOut(productId,1);//增一个数量
		
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
		productService.addStockOut(productItem.getProductId(),-1);//减少一个数量
		return null;
	} 
	
	@Transactional
	public String rejectProudct(String securityCode) {
		
		ProductItem productItem = this.getBySecurityCode(securityCode);
		
		int count = usageRecordService.countUsageQuery(securityCode);
		if(count >0){
			return "商家已经销售，不能退货！";
		}
		
		//修改状态
		productItem.setStatus(ProductItem.STATUS_EFFECTIVE);
		productItemDao.save(productItem);
		
		//库存记录
		StockRecord record = new StockRecord();
		record.setSecurityCode(securityCode);
		record.setType(1);
		stockRecordService.save(record);
		
		//找到对应的订单记录
		List<StockRecord> stockRecordBySecurityCode = 
			stockRecordService.getStockRecordBySecurityCode(securityCode);
		
		String bookId = null;
		for (StockRecord stockRecord : stockRecordBySecurityCode) {
			if(stockRecord.getType() == 0&& StrFuncs.notEmpty(stockRecord.getBookId())){
				bookId = stockRecord.getBookId();
				break;
			}
		}
		
		Bookform bookform = bookformService.get(bookId);
		billDetailService.rejectBillDetail(bookform,productItem);
		
		return null;
	}
	
	@Autowired
	private ProductItemDao productItemDao;
	@Autowired
	private StockRecordService stockRecordService;
	@Autowired
	private BookformService bookformService;
	@Autowired
	private ProductService productService;
	@Autowired
	private UsageRecordService usageRecordService;
	@Autowired
	private BillDetailService billDetailService;
	
	
}
