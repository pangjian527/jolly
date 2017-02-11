package com.sys.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import pub.dao.hibernate.HibernateDao;
import pub.types.IdText;

import com.sys.entity.Area;

@Repository
public class AreaDao extends HibernateDao<Area> {
	public AreaDao() {
		super(Area.class);
	}

	public List<IdText> queryByParentId(String id) {
		String hql = "select new pub.types.IdText(id, name) from Area where parentId =:parentId" +
		" order by keyword asc";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("parentId", id);
		return query.list();
	}
	
	public Area getByCode(String code){
		String hql = "from Area where code =:code";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("code", code);
		query.setMaxResults(1);
		return (Area)query.uniqueResult();
	}
	
	public Area getByName(String name){
		String hql = "from Area a where a.name =:name" ;
		Query query = this.getSession().createQuery(hql);
		query.setParameter("name", name);
		query.setMaxResults(1);
		return (Area)query.uniqueResult();
	}
	
	public Area getByLikeName(String name){
		String hql = "from Area a where a.name  like :name" ;
		Query query = this.getSession().createQuery(hql);
		query.setParameter("name", "%"+name+"%");
		query.setMaxResults(1);
		return (Area)query.uniqueResult();
	}

	public Area getParentById(String id) {
		String sql = "select a.* from t_area a ,t_area b where a.id=b.parent_id and b.id=:id" ;
		Query query = this.getSession().createSQLQuery(sql).addEntity(Area.class);
		query.setParameter("id", id);
		return (Area)query.uniqueResult();
	}
}
