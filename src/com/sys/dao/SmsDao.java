package com.sys.dao;

import java.util.Date;

import org.springframework.stereotype.Repository;
import pub.dao.hibernate.HibernateDao;
import com.sys.entity.Sms;

@Repository
public class SmsDao extends HibernateDao<Sms> {
	public SmsDao() {
		super(Sms.class);
	}
	
	public int staticCountByIp(String ip, Date minTime){
		String sql = "select count(1) from t_sms where ip_addr = :ip and create_time >= :minTime";
		String countText = this.getSession().createSQLQuery(sql)
			.setParameter("ip", ip)
			.setParameter("minTime", minTime)
			.uniqueResult()
			.toString();
		System.out.println(ip + "\t" + countText);
		return Integer.valueOf(countText);
	}
	
	public int staticCountByMobile(String mobile, Date minTime){
		String sql = "select count(1) from t_sms where obj_mobile = :mobile and create_time >= :minTime";
		String countText = this.getSession().createSQLQuery(sql)
			.setParameter("mobile", mobile)
			.setParameter("minTime", minTime)
			.uniqueResult()
			.toString();
		System.out.println(mobile + "\t" + countText);
		return Integer.valueOf(countText);
	}
	
	public int staticCount(String mobile, String ip, Date minTime){
		String sql = "select count(1) from t_sms where ip_addr = :ip and obj_mobile = :mobile and create_time >= :minTime";
		String countText = this.getSession().createSQLQuery(sql)
			.setParameter("ip", ip)
			.setParameter("mobile", mobile)
			.setParameter("minTime", minTime)
			.uniqueResult()
			.toString();
		System.out.println(mobile + "\t" + ip + "\t" + countText);
		return Integer.valueOf(countText);
	}
	
	public void saveError(String mobile, String ip, String content, String remark){
		Sms bean = new Sms();
		bean.setMobile(mobile);
		bean.setIpAddr(ip);
		bean.setContent(content);
		bean.setRemark(remark);
		bean.setStatus(2);
		save(bean);
	}
	
	public void saveSuccess(String mobile, String ip, String content, String remark){
		Sms bean = new Sms();
		bean.setMobile(mobile);
		bean.setIpAddr(ip);
		bean.setContent(content);
		bean.setRemark(remark);
		bean.setStatus(1);
		save(bean);
	}
}