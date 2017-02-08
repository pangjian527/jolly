package pub.dao.hibernate;

import java.io.Serializable;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import pub.dao.Dao;

import com.sun.org.apache.commons.beanutils.BeanUtils;

/**
 * Created by IntelliJ IDEA.
 * 
 * @author zhuangzhonglong
 * @Date: 2008-4-11
 * @Time: 6:53:46
 */
public class HibernateDao<T> extends HibernateDaoSupport implements Dao<T> {
	private final Class<T> clazz;

	public HibernateDao(Class<T> clazz) {
		this.clazz = clazz;
	}

	/**
	 * myq add 2015-4-20，用于对应的BaseService服务调用
	 * @return
	 * @throws Exception
	 */
	public T create() throws Exception{
		return this.clazz.newInstance();
	}

	@SuppressWarnings("unchecked")
	public T get(Serializable id) {
		if (id == null)
			return null;
		return (T) getSession().get(clazz, id);
	}

	public List<T> getAll() {
		return getAll(null);
	}

	@SuppressWarnings("unchecked")
	public List<T> getAll(String orderBy) {
		Criteria ct = getSession().createCriteria(clazz);
		if (orderBy != null)
			ct.addOrder(Order.asc(orderBy));
		return ct.list();
	}

	public void update(T t) {
		getSession().update(t);
	}

	public void delete(T t) {
		getSession().delete(t);
		// hibernate will do inserts before deletes!
		// we have to do flush to ensure execution order,
		// any potential side-effects??
		getSession().flush();
	}

	public void delete(Serializable id) {
		
		T t = get(id);
		if (t != null) 
			delete(t);
	}

	public void delete(Serializable[] ids) {
		for (Serializable id : ids)
			delete(id);
	}

	public void save(T t) {
		if(t == null)
			return;
		try{
			//Class entityClass = t.getClass();
			//Object id = entityClass.getMethod("getId").invoke(t);
			String id = BeanUtils.getProperty(t, "id");
			if("".equals(id)){
				//entityClass.getMethod("setId", new Class[]{String.class}).invoke(t, new Object[]{null});
				BeanUtils.setProperty(t, "id", null);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		getSession().saveOrUpdate(t);
	}

	public void saveandFlush(T t) {
		getSession().saveOrUpdate(t);
		getSession().flush();
	}

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory) {
		if (super.getSessionFactory() == null)
			super.setSessionFactory(sessionFactory);
	}
	/**
	 * myq add 2015-3-10，更新关联表信息，避免过去那种先全部删掉，然后全部新增的模式
	 * @param primeId，主表的 id，如某个 商家的 id
	 * @param primeProperty，主表id在 本关联表中的属性名称，如factoryId
	 * @param subIds，子数据的id数组，如某个商家关联的全部 productBrandIds
	 * @param subProperty，子数据id在关联表中的属性名称，如productBrandId
	 */
	public void saveRelations(String primeId, String primeProperty, 
			String[] subIds, String subProperty) throws Exception{
		
		List<T> rels = this.getAllByProperty(primeProperty, primeId);

		//1.遍历数据库旧数据，生成删除指令
		if(subIds == null){
			subIds = new String[0];
		}
		Set<String> newSubIdSet = new HashSet<String>(Arrays.asList(subIds));
		Set<String> oldSubIdSet = new HashSet<String>();
		for(T rel : rels){
			String subId = BeanUtils.getProperty(rel, subProperty);
			oldSubIdSet.add(subId);//这样走一遍，就生成了OldSubSet，用于步骤2
			if(!newSubIdSet.contains(subId)){
				delete(rel);
			}
		}
		
		//2.遍历SubIds中的新版数据，生成新增指令
		for(String subId: subIds){
			if(!oldSubIdSet.contains(subId)){
				T rel = clazz.newInstance();
				BeanUtils.setProperty(rel, primeProperty, primeId);
				BeanUtils.setProperty(rel, subProperty, subId);
				save(rel);
			}
		}
	}	
	/**
	 * myq add 2015-3-10，根据属性名=属性值 ，从表中查询子数组
	 * 本函数用于取代过去臃肿的getAllByXXX，如getAllByFactoryId(String productId)，getAllByProductName(String name)...
	 * @param name
	 * @param value
	 * @return
	 */
	public List<T> getAllByProperty(String name, String value){
		String hql = "from " + clazz.getSimpleName() 
			+ " where " + name + " = :value";
		return this.getSession().createQuery(hql).setParameter("value", value).list();
	}
	
	public List<T> getAllByProperty(String name, String value, String orderBy){
		String hql = "from " + clazz.getSimpleName() 
			+ " where " + name + " = :value order by " + orderBy;
		
		return this.getSession().createQuery(hql).setParameter("value", value).list();
	}
	
	public T getByProperty(String name, String value){
		String hql = "from " + clazz.getSimpleName() 
			+ " where " + name + " = :value";
		
		List<T> beans = this.getSession().createQuery(hql).setParameter("value", value).list();
		if(beans == null || beans.size() == 0){
			return null;
		}
		else{
			return beans.get(0);
		}
	}
}
