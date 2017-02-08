package pub.dao.hibernate;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import pub.types.Executable;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2009-3-23
 * Time: 10:43:44
 */
@SuppressWarnings("unchecked")
public class DbCommand implements Executable, SessionAware {

	private Session session;
	private Map params = new HashMap();
	private String sql;
	private String hql;
	private int affectedCount;

	public DbCommand setSql(String sql) {
		this.hql = null;
		this.sql = sql;
		return this;
	}

	public DbCommand setHql(String hql) {
		this.sql = null;
		this.hql = hql;
		return this;
	}

	public DbCommand put(String paramName, Object value) {
		params.put(paramName, value);
		return this;
	}

	public Object setSession(Session session) {
		this.session = session;
		return this;
	}

	public void execute() {
		Query query;
		if (this.hql != null) {
			query = session.createQuery(hql);
		}
		else {
			assert this.sql != null;
			query = session.createSQLQuery(sql);
		}
		query.setProperties(this.params);
		this.affectedCount = query.executeUpdate();
	}

	public int getAffectedCount() {
		return affectedCount;
	}
}
