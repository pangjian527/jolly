package com.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.BookformDetail;

@Repository
public class BookformDetailDao extends HibernateDao<BookformDetail> {

	public BookformDetailDao() {
		super(BookformDetail.class);
	}
	
	/**
	 * 根据订单id拿到订单明细数据
	 * @param bookId
	 * @return
	 * @throws Exception
	 */
	@Deprecated
	public BookformDetail getByBookId(String bookId) throws Exception {
		String sql = "select * from t_bookform_detail where book_id =:bookId";
		List<BookformDetail> result = this.getSession().createSQLQuery(sql).addEntity(BookformDetail.class)
				.setString("bookId", bookId).list();
		
		return result!=null&&result.size()>0?result.get(0):null;
	}
	
	public List<BookformDetail> getAllByBookId(String bookId) throws Exception {
		String hql = "from BookformDetail where bookId =:bookId";

		return getSession()
			.createQuery(hql)
			.setParameter("bookId", bookId)
			.list();
	}
	
	public List<BookformDetail> getAllByBookId(String bookId, int verificationStatus) throws Exception {
		String hql = "from BookformDetail where bookId = :bookId and verificationStatus = :verificationStatus";

		return getSession()
			.createQuery(hql)
			.setParameter("bookId", bookId)
			.setParameter("verificationStatus", verificationStatus)
			.list();
	}
	
	/**
	 * 门店获取所有未结算的订单数据 发起收款申请
	 * @param factoryId
	 * @return
	 * @throws Exception
	 */
	public List<BookformDetail> getAllByFactoryId(String factoryId) throws Exception {
		String sql = "select bd.*"
				+ // sign(bd.price_pay) signresult,
				" from t_bookform_detail bd left join t_bookform b"
				+ " on bd.book_id = b.id and bd.is_settlement=0 " +
						" where b.service_factory_id=:factoryId"; // signresult=-1

		List<BookformDetail> result = this.getSession().createSQLQuery(sql).addEntity(BookformDetail.class)
				.setString("factoryId", factoryId).list();
		
		return result;
	}
	
	/*
	 * 验卷 
	 */
	public BookformDetail getByVerifyCode(String verificationCode){
		String sql=" from BookformDetail b where b.verificationCode=:verificationCode";
		
		List list = this.getSession()
			.createQuery(sql).setParameter("verificationCode", verificationCode)
			.list();
		
		if(list!=null&&list.size()>0){
			return (BookformDetail)list.get(0);
		}
		return null;
	}

	/*
	 * @功能说明：统计车主可用的消费卷
	 * 
	 * @版本信息：2014-11-14 pj add
	 */
	public int calculateConsumption(String customerId) {

		String sql = "select count(1) from (select * from t_bookform_detail bd left join t_bookform b on bd.book_id = b.id"
			+ " where (b.pay_type = 1  or exists (select l.id from log_payment l where l.id = b.payment_id "
			+ " and l.status = '1')) and b.status in (1,2) ) c where c.verification_Status = 0 and c.customer_id = :customerId";
		
		return Integer.valueOf(this.getSession().createSQLQuery(sql)
				.setParameter("customerId", customerId).uniqueResult()
				.toString());
	}
}