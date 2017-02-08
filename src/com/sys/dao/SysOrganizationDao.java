package com.sys.dao;

import org.springframework.stereotype.Repository;
import pub.dao.hibernate.HibernateDao;
import com.sys.entity.SysOrganization;

@Repository
public class SysOrganizationDao extends HibernateDao<SysOrganization> {
	public SysOrganizationDao() {
		super(SysOrganization.class);
	}
}