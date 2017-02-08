package pub.dao.hibernate;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.AliasToEntityMapResultTransformer;

import pub.types.Executable;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-8-19
 * Time: 19:15:09
 */
public class UniqueQuery<T> implements Executable, SessionAware {

	private Session session;
	private String sql;
	private String hql;
	private Class resultClass;
	private T result;
	private Map params = new HashMap();

	public Object setSession(Session session) {
		this.session = session;
		return this;
	}
	public Class getResultClass() {
		return resultClass;
	}
	public void setResultClass(Class resultClass) {
		this.resultClass = resultClass;
	}
	@SuppressWarnings("unchecked")
	public void execute() {
		Query query;
		if (hql != null) {
			query = session.createQuery(hql);
		}
		else {
			SQLQuery sqlQuery = session.createSQLQuery(sql);
			if (resultClass != null) {
				if (resultClass.equals(Map.class)) {
					sqlQuery.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
				}
				else {
					sqlQuery.addEntity(resultClass);
				}
			}
			//sqlQuery.addScalar()
			query = sqlQuery;
		}
		result = (T) query.setProperties(params).uniqueResult();
	}

	public T getResult() {
		return result;
	}

	public UniqueQuery<T> put(String paramName, Object value) {
		params.put(paramName, value);
		return this;
	}
	//
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getHql() {
		return hql;
	}
	public UniqueQuery<T> setHql(String hql) {
		this.hql = hql;
		return this;
	}

	public Map getParams() {
		return params;
	}
	public void setParams(Map params) {
		this.params = params;
	}
}
