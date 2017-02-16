package com.sys.dao;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.Bill;

@Repository
public class BillDao extends HibernateDao<Bill> {

	public BillDao() {
		super(Bill.class);
	}

	/*
	 * @功能说明：获取商家未付款的申请
	 * 
	 * @版本信息：2014-11-14 pj add
	 */
	public Bill getActiveBill(String factoryId) {
		String hql = "from Bill where factoryId = :factoryId and status in(0, 1, 4)";
		
		return (Bill)this.getSession()
						.createQuery(hql)
						.setParameter("factoryId", factoryId)
						.uniqueResult();
	}
}
