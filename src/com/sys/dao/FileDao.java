package com.sys.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;

import com.sys.entity.File;

@Repository
public class FileDao extends HibernateDao<File> {
	public FileDao() {
		super(File.class);
	}
	
	public File getWithoutContent(String id) {
		String sql = "select id, file_name, file_size, content_type, null as content, upload_time, table_name, reference_id from t_file where id = :id";
		return (File) getSession().createSQLQuery(sql)
			.addEntity(File.class)
			.setParameter("id", id)
			.uniqueResult();
	}
	
	public List<String> getFileIds(String tableName, String referenceId) {
		String hql = "select id from File where tableName =:tableName and referenceId =:referenceId";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("tableName", tableName);
		query.setParameter("referenceId", referenceId);
		return query.list();
	}
	
	public void deleteFiles(String tableName, String referenceId) {
		String hql = "delete File where tableName = :tableName and referenceId =:referenceId";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("tableName", tableName);
		query.setParameter("referenceId", referenceId);
		query.executeUpdate();
	}
}
