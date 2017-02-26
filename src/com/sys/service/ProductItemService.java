package com.sys.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListResourceBundle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.DateFuncs;
import pub.functions.StrFuncs;
import pub.types.Pair;

import com.sys.dao.ProductItemDao;
import com.sys.entity.Bookform;
import com.sys.entity.Factory;
import com.sys.entity.ProductItem;
import com.sys.entity.StockRecord;
import com.sys.entity.UsageRecord;

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
	
	public List<Pair<Long, String>> getProeuctItemTimeLog(String securityCode,String factoryId){
		
		List<Pair<Long, String>> lineResult = new LinkedList<Pair<Long,String>>();
		
		//1. 获取到所有的库存记录
		List<StockRecord> stockRecords = stockRecordService.getStockRecordBySecurityCode(securityCode);
		
		for (StockRecord stockRecord : stockRecords) {
			
			if(stockRecord.getType() == 1){
				Pair<Long, String> pair = new Pair<Long, String>();
				pair.first = stockRecord.getCreateTime().getTime();
				pair.second = DateFuncs.toString(stockRecord.getCreateTime(),DateFuncs.format2) +" 扫描入库";
				lineResult.add(pair);
			}else{
				//1.1 获取到订单
				Bookform bookform = bookformService.get(stockRecord.getBookId());
				//1.2 获取到对应的门店
				Factory factory = factoryService.get(bookform.getFactoryId());
				
				//如果前端是某个门店查询电池的记录，不能查询到退货后在出库的记录和订单记录
				if(StrFuncs.notEmpty(factoryId) && !factoryId.equals(bookform.getFactoryId())){
					continue;
				}
				
				//1.4 出库说明
				Pair<Long, String> outStockPair = new Pair<Long, String>();
				outStockPair.first = stockRecord.getCreateTime().getTime();
				outStockPair.second = DateFuncs.toString(stockRecord.getCreateTime(),DateFuncs.format2) +" 扫描出库";
				lineResult.add(outStockPair);
				
				//1.3 订单说明
				StringBuffer orderDescribe = new StringBuffer(DateFuncs.toString(bookform.getCreateTime(),DateFuncs.format2));
				orderDescribe.append(factory.getName()).append("下单完成").append("订单编号：").append(bookform.getCode());
				
				Pair<Long, String> orderPair = new Pair<Long, String>();
				orderPair.first = bookform.getCreateTime().getTime();
				orderPair.second = orderDescribe.toString();
				lineResult.add(orderPair);
				
				//1.5 发货说明
				if(bookform.getDeliveryTime() != null){
					StringBuffer deliveryDescribe = new StringBuffer(DateFuncs.toString(bookform.getDeliveryTime(),DateFuncs.format2));
					deliveryDescribe.append("完成发货").append("快递类型"+bookform.getDeliveryFactory()).append("快递单号："+bookform.getTrackingNumber());
					
					Pair<Long, String> deliveryPair = new Pair<Long, String>();
					deliveryPair.first = bookform.getDeliveryTime().getTime();
					deliveryPair.second = deliveryDescribe.toString();
					lineResult.add(deliveryPair);
				}
			}
		}
		
		//2. 获取到所有的查询记录
		List<UsageRecord> usageByCode = usageRecordService.getUsageByCode(securityCode);
		for (UsageRecord usageRecord : usageByCode) {
			
			Factory factory  = factoryService.get(usageRecord.getFactoryId());
			
			Pair<Long, String> usagePair = new Pair<Long, String>();
			usagePair.first = usageRecord.getCreateTime().getTime();
			StringBuffer deliveryDescribe = new StringBuffer(DateFuncs.toString(usageRecord.getCreateTime(),DateFuncs.format2));
			usagePair.second = deliveryDescribe.append(factory.getName()+"销售查询").toString();
			lineResult.add(usagePair);
		}
		
		//3. 排序
		Collections.sort(lineResult, new Comparator<Pair<Long, String>>() {
			@Override
			public int compare(Pair<Long, String> o1, Pair<Long, String> o2) {
				Long i = o1.first - o2.first;
				return Integer.valueOf(i+"");
			}
		});
		
		return lineResult;
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
	@Autowired
	private FactoryService factoryService;
	
	
}
