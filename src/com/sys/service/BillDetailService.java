package com.sys.service;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;

import com.sys.dao.BillDetailDao;
import com.sys.entity.BillDetail;
import com.sys.entity.Bookform;
import com.sys.entity.Product;
import com.sys.entity.ProductItem;

@Service
@Transactional(readOnly = true)
public class BillDetailService extends BaseService<BillDetail> {

	@SuppressWarnings("static-access")
	public QueryResult query(String condition, QuerySettings settings){

		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		
		Query query = new PagedQuery(settings);
		StringBuilder select = new StringBuilder(" t.*, f.name as factory_name ");
		
		StringBuilder where = new StringBuilder();
		where.append( "1 = 1");
		
		this.addQueryEqualFilter(queryJson, where, query, "factoryId", 
				" and t.factory_id = :factoryId");
		
		this.addQueryDateFilter(queryJson, where, query, "startTime", 
				" and t.create_time >= :startTime");
		this.addQueryDateFilter(queryJson, where, query, "endTime", 
				" and t.create_time <= :endTime");
		
		
		this.addQueryEqualFilter(queryJson, where, query, "status", 
				" and t.status = :status");	
		this.addQueryLikeFilter(queryJson, where, query, "productName", 
				" and t.product_name like :productName ");
		this.addQueryLikeFilter(queryJson, where, query, "factoryName", 
				" and f.name like :factoryName ");
		
		query.select(select.toString()).from(" t_bill_detail t left join t_factory f on t.factory_id=f.id ").where(
				where.toString()).orderBy(" t.update_time desc ");
		generalDao.execute(query);
		return query.getResult();
	}
	
	public List<BillDetail> getAllByBillId(String billId){
		return billDetailDao.getAllByBillId(billId);
	}
	
	public void deleteByBillId(String billId){
		billDetailDao.deleteByBillId(billId);
	}
	
	public List<BillDetail> getAllByFactoryId(String factoryId, int status) {
		return billDetailDao.getAllByFactoryId(factoryId, status);
	}
	
	public List<BillDetail> getAllByFactoryId(String factoryId) {
		return billDetailDao.getAllByProperty("serviceFactoryId", factoryId, "createTime desc");
	}
	
	@Transactional
	public void deliverBillDetail(Bookform bookform){
		
		BillDetail billDetail = new BillDetail();
		billDetail.setBookId(bookform.getId());
		billDetail.setFactoryId(bookform.getFactoryId());
		billDetail.setStatus(BillDetail.BILL_DETAIL_NOT_SETTLE);
		
		StringBuffer description = new StringBuffer("订单："+bookform.getCode());
		description.append(" || 交易金额：￥"+bookform.getSales()+"元");
		
		double amount = 0.0;
		if(bookform.getPayType() == 0){
			description.append(" || 付款类型：在线付款");
		}else if (bookform.getPayType() == 1){
			description.append(" || 付款类型：快递货到付款");
		}
		if(bookform.getPayType() == 2){
			//预发货，后付款
			amount = bookform.getSales();
			description.append(" || 付款类型：预发货后付款");
		}
		description.append(" || 门店应付平台：￥"+amount+"元");
		
		
		billDetail.setDescription(description.toString());
		billDetail.setPricePay(amount);
		billDetailDao.save(billDetail);
	}
	
	@Transactional
	public void rejectBillDetail(Bookform bookform, ProductItem productItem) {
		BillDetail billDetail = new BillDetail();
		billDetail.setBookId(bookform.getId());
		billDetail.setFactoryId(bookform.getFactoryId());
		billDetail.setStatus(BillDetail.BILL_DETAIL_NOT_SETTLE);
		
		StringBuffer description = new StringBuffer("订单："+bookform.getCode());
		description.append(" || 防伪码："+productItem.getSecurityCode()+"退货");
		
		Product product = productService.get(productItem.getProductId());
		description.append(" || 退款金额：￥"+product.getPrice()+"元");
		
		billDetail.setDescription(description.toString());
		billDetail.setPricePay(-product.getPrice());
		billDetailDao.save(billDetail);
	}

	@Autowired
	private BillDetailDao billDetailDao;
	@Autowired
	private GeneralDao generalDao;
	@Autowired
	private ProductService productService;
	
	
}
