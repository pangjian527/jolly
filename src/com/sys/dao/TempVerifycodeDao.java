package com.sys.dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;
import pub.functions.DateFuncs;

import com.sys.entity.TempVerifycode;

@Repository
public class TempVerifycodeDao  extends HibernateDao<TempVerifycode>{

	public TempVerifycodeDao(){
		super(TempVerifycode.class);
	}
	
	
	public boolean testExistsCode(String key,String code,int minute){
		
		String sql="select count(1) from t_temp_verifycode t where t.key=:key and t.value=:value and  t.create_time>=:tempTime";
		
		Date date = DateFuncs.addMinute(new Date(), -minute);
		
		int count = (Integer.valueOf(this.getSession()
				.createSQLQuery(sql).setParameter("key", key).setParameter(
						"value", code).setParameter("tempTime", date)
				.uniqueResult().toString()));
		
		if(count>0){
			return true;
		}

		return false;
	}
	
	public List<TempVerifycode> getValid(String key){
		String hql = "from TempVerifycode where code_key = :key and deadline > :now order by createTime desc";
		return this.getSession()
			.createQuery(hql)
			.setParameter("key", key)
			.setParameter("now", new Date())
			.list();
	}
}
