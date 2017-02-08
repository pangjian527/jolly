package com.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.SysModule;

@Repository
public class SysModuleDao extends HibernateDao<SysModule> {
	public SysModuleDao() {
		super(SysModule.class);
	}
	public List<SysModule> getAllByUserId(String id){
		String sql = "select s_m.* from sys_module s_m, sys_modulerole s_mr, sys_userrole s_ur " 
			+ "where s_ur.user_id = :id and s_ur.role_id = s_mr.role_id and s_mr.module_id = s_m.id";
		
		List<SysModule> result = this.getSession()
			.createSQLQuery(sql)
			.addEntity(SysModule.class)
			.setString( "id", id)
			.list();
		return result;
	}
	
	public List<SysModule> getAllByParentId(String parentId){
		String hql = "from SysModule where parentId = :parentId";
		return this.getSession()
			.createQuery(hql)
			.setParameter("parentId", parentId)
			.list();
	}
}