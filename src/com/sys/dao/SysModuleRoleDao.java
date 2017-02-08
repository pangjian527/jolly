package com.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.SysModuleRole;

@Repository
public class SysModuleRoleDao extends HibernateDao<SysModuleRole> {
	public SysModuleRoleDao() {
		super(SysModuleRole.class);
		
	}
	
	public void delete(String roleId, String moduleId) {
		String hql = "delete SysModuleRole where roleId = :roleId and moduleId = :moduleId";
		getSession().createQuery(hql)
			.setParameter("roleId", roleId)
			.setParameter("moduleId", moduleId)
			.executeUpdate();
	}
	public void deleteAllByRoleId(String roleId) {
		String hql = "delete SysModuleRole where roleId = :roleId";
		getSession().createQuery(hql)
			.setParameter("roleId", roleId)
			.executeUpdate();
	}
/*	//zhuangzhonglong
	public List<SysModuleRole> getAllByRoleId(String roleId) {
		String hql = "from SysModuleRole where roleId = :roleId";
		return getSession().createQuery(hql)
			.setParameter("roleId", roleId)
			.list();
	}*/
}
