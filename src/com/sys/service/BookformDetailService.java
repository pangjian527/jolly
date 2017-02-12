package com.sys.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.HibernateDao;
import pub.dao.hibernate.ListQuery;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.DateFuncs;
import pub.functions.JsonFuncs;
import pub.functions.StrFuncs;

import com.sys.dao.BookformDao;
import com.sys.dao.BookformDetailDao;
import com.sys.entity.Bookform;
import com.sys.entity.BookformDetail;
import com.sys.entity.FactoryUser;
import com.sys.utils.SqlUtils;
import com.web.utils.SessionDataUtil;

@Service
@Transactional(readOnly = true)
public class BookformDetailService/* extends BaseService<BookformDetail>*/{
	
/*	public QueryResult query(Integer s, QuerySettings settings) throws Exception {
		Query query = new PagedQuery(settings);
		String select = "t.*,b.user_bookid,p.name as pname,p.factory_id,b.service_factory_id,(select f.name from t_factory f where f.id=b.service_factory_id) as fname ";
		select += ",ROUND(TO_NUMBER(t.verification_deadline - sysdate)) as ldate ";
		String where = "t.book_id=b.id and b.customer_id =:customerId and t.product_id=p.id ";
		if(s.intValue()==0){//未使用
			where += "and t.verification_status=0 and t.verification_deadline >sysdate ";
		}else if(s.intValue()==1){//已经使用
			where += "and t.verification_status=1 ";
		}else{//过期
			where += "and t.verification_deadline <=sysdate ";
		}
		select += ","+SqlUtils.getFileId("p.photo_ids");
		query.select(select).from(" t_bookform_detail t,t_product p,t_bookform b ").where(where).orderBy(" t.create_time desc ");	
		query.put("customerId", SessionDataUtil.getCustomerId());
		generalDao.execute(query);
		return query.getResult();
	}
	
	
	 * @功能说明：分页查询订单详情，用于商城管理员查看数据
	 * 
	 * @版本信息：2015-3-3 myq add
	 
	public QueryResult query(String condition, QuerySettings settings) {
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		
		Query query = new PagedQuery(settings);
		
		StringBuilder where = new StringBuilder(
				" t.product_id = p.id and t.book_id = b.id and b.customer_id = c.id and b.service_factory_id = f.id and b.status in(1, 2)");
		String select = " t.*, b.code bookform_code, b.id bookform_id, b.contact_man, b.contact_tel, f.name factory_name";
		String from = " t_bookform_detail t, t_product p, t_bookform b, t_customer c, t_factory f";
		
		this.addQueryEqualFilter(queryJson, where, query, "status", 
			" and t.verification_status = :status");
		this.addQueryEqualFilter(queryJson, where, query, "productTypeId", 
			" and p.product_type_id = :productTypeId");
		this.addQueryLikeFilter(queryJson, where, query, "factory", 
			" and (f.name like :factory or f.man like :factory or f.tel like :factory or f.mobile like :factory)");
		this.addQueryLikeFilter(queryJson, where, query, "product", 
			" and (p.name like :product or t.product_name like :product)");
		this.addQueryLikeFilter(queryJson, where, query, "code", 
			" and b.code like :code");
		this.addQueryLikeFilter(queryJson, where, query, "customer", 
			" and (c.name like :customer or c.mobile like :customer or c.account like :customer or b.contact_man like :customer or b.contact_tel like :customer)");
		
		query.select(select.toString())
				.from(from)
				.where(where)
				.orderBy(" t.create_time desc ");
		
		generalDao.execute(query);
		return query.getResult();
	}
	
	
	 * @功能说明：统计车主可用的消费卷
	 * 
	 * @版本信息：2014-11-14 pj add
	 
	public int calculateConsumption(String customerId){
		return bookformDetailDao.calculateConsumption(customerId);
	}
	
	
	 * @功能说明：查询到店付款或者在线付款成功的的消费卷
	 * 
	 * @版本信息：2014-11-14 pj add
	 
	public QueryResult getAllBookDetailByCustomer(String condition,QuerySettings settings) throws Exception {
		Query query = new ListQuery(settings);
		
		Map<String, String> map = JsonFuncs.toMap(condition);
		
		String from =" (select t.*,b.code,b.status,b.PAY_TYPE,b.customer_id,b.service_factory_id "+
						" from t_bookform_detail t left join t_bookform b on t.book_id=b.id where  b.pay_type=1 or" +
						" exists(select l.id from log_payment l where l.id=b.payment_id and l.status='1') )c";
		
		StringBuffer where =new StringBuffer(" 1=1  ");
		
		if(StrFuncs.notEmpty(map.get("factoryId"))){
			where.append(" and c.service_factory_id=:factoryId");
			query.put("factoryId", map.get("factoryId"));
		}
		if(StrFuncs.notEmpty(map.get("verificationStatus"))){
			where.append(" and c.verification_Status=:verificationStatus");
			query.put("verificationStatus", map.get("verificationStatus"));
		}
		if(StrFuncs.notEmpty(map.get("customerId"))){
			where.append(" and c.customer_id=:customerId");
			query.put("customerId", map.get("customerId"));
		}
		if(StrFuncs.notEmpty(map.get("payType"))){
			where.append(" and c.pay_type=:payType");
			query.put("payType", map.get("payType"));
		}
		
		query.select(" * ").from(from).where(where).orderBy(
				" c.create_time desc ");
		
		generalDao.execute(query);
		return query.getResult();
	}
	*/

	public List<BookformDetail> getAllByBookId(String bookId) throws Exception {
		return bookformDetailDao.getAllByBookId(bookId);
	}
	
	public BookformDetail getByVerificationCode(String verificationCode){
		return bookformDetailDao.getByVerifyCode(verificationCode);
	}
	
	@Autowired
	private GeneralDao generalDao;
	
	@Autowired
	private BookformDetailDao bookformDetailDao;

	

}
