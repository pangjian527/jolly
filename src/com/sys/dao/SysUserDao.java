package com.sys.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.SysUser;

@Repository
public class SysUserDao extends HibernateDao<SysUser> {

	public SysUserDao() {
		super(SysUser.class);
	}


	public SysUser getByCodeOrTel(String text) {
		String hql = "from SysUser where code = :text or telNo = :text";
		Query q = this.getSession().createQuery(hql);
		q.setParameter("text", text).setMaxResults(1);
		return (SysUser)q.uniqueResult();
	}


	public List<SysUser> queryAll(boolean isadmin) {
		String hql = "from SysUser where 1=1 "; //Adminuser
		if(!isadmin){
			hql += " and name <> 'admin'";
		}
		Query q = this.getSession().createQuery(hql);
		return q.list();
	}



	
}