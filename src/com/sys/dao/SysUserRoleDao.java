package com.sys.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.SysUser;
import com.sys.entity.SysUserRole;

@Repository
public class SysUserRoleDao extends HibernateDao<SysUserRole> {
	public SysUserRoleDao() {
		super(SysUserRole.class);
	}
	
/*	public List<SysUserRole> getAllByUserId(String userId){
		String hql = "from SysUserRole where userId = :userId";
		return this.getSession().createQuery(hql)
			.setParameter("userId", userId)
			.list();
	}*/
	
	public List<SysUserRole> getAllByRoleId(String roleId){
		String hql = "from SysUserRole where roleId = :roleId";
		return this.getSession().createQuery(hql)
			.setParameter("roleId", roleId)
			.list();
	}
	
	public void delete(String userId, String roleId){
		String hql = "delete from SysUserRole where userId = :userId and roleId = :roleId";
		this.getSession().createQuery(hql)
			.setParameter("userId", userId)
			.setParameter("roleId", roleId)
			.executeUpdate();
	}
}