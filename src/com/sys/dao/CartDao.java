package com.sys.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.Cart;

@Repository
public class CartDao extends HibernateDao<Cart> {
	public CartDao() {
		super(Cart.class);
	}
	
	public Cart get(String userId,String productId){
		String hql = "from Cart where userId = :userId and productId = :productId";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		query.setMaxResults(1);
		return (Cart)query.uniqueResult();
	}
	
	
}
