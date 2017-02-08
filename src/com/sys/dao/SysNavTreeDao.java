package com.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.SysNavTree;

@Repository
public class SysNavTreeDao extends HibernateDao<SysNavTree> {
	public SysNavTreeDao() {
		super(SysNavTree.class);
	}
	
	
	/**
	 * 获取当前登录用户拥有的系统权限
	 * @param userId
	 * @param parentNavTreeId
	 * @return
	 */
/*	public List<SysNavTree> getSubNavTrees(String userId, String parentNavTreeId) {
		String sql = "select distinct n.* from sys_navtree n, sys_modulerole mr, sys_userrole ur " +
			"where mr.role_id = ur.role_id and n.module_id = mr.module_id " +
			"and ur.user_id = :userId and n.parent_id = :parentId and n.is_visible = 1 order by n.seq ";//n.seq,
		return getSession().createSQLQuery(sql).addEntity("n", SysNavTree.class)
			.setParameter("userId", userId)
			.setParameter("parentId", parentNavTreeId)
			.list();
	}*/
	
	public List<SysNavTree> getAllByUserId(String userId) {
		String sql = "select distinct n.* from sys_navtree n, sys_modulerole mr, sys_userrole ur " +
			"where mr.role_id = ur.role_id and n.module_id = mr.module_id " +
			"and ur.user_id = :userId ";//n.seq,
		return getSession().createSQLQuery(sql).addEntity("n", SysNavTree.class)
			.setParameter("userId", userId)
			.list();
	}
}