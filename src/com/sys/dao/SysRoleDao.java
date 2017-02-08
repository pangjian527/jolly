package com.sys.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import pub.dao.hibernate.HibernateDao;
import com.sys.entity.SysRole;

@Repository
public class SysRoleDao extends HibernateDao<SysRole> {
	public SysRoleDao() {
		super(SysRole.class);
	}
	public List<SysRole> getAllByUserId(String id){
		String sql = "select s_r.* from sys_role s_r, sys_userrole s_ur " 
			+ "where s_ur.user_id = :id and s_ur.role_id = s_r.id";
		
		return this.getSession()
			.createSQLQuery(sql)
			.addEntity(SysRole.class)
			.setString( "id", id)
			.list();
	}

}
