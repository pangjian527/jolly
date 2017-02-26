package com.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.StockRecord;

@Repository
public class StockRecordDao extends HibernateDao<StockRecord> {
	
	public StockRecordDao(){
		super(StockRecord.class);
	}

	public List<StockRecord> getStockRecordByBookIdAndType(String bookId, int type) {
		String sql = "select * from t_stock_record t where t.book_id =:bookId and t.type=:type";
		return this.getSession().createSQLQuery(sql)
				.addEntity(StockRecord.class)
				.setParameter("bookId", bookId)
				.setParameter("type", type)
				.list();
	}

}
