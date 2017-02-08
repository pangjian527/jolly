package pub.dao.hibernate;

import java.lang.reflect.Field;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.hibernate.transform.PassThroughResultTransformer;
import org.hibernate.transform.ResultTransformer;
import org.hibernate.type.Type;

import pub.dao.query.QueryResult;
import pub.dao.query.QueryResultType;
import pub.dao.query.QuerySettings;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-8-19
 * Time: 9:53:30
 */
@SuppressWarnings("unchecked")
public class ListQuery_mysql<T> extends HibernateQuery {

	private String hql;
	private QuerySettings settings;
	private QueryResult result;


	public ListQuery_mysql() {
		settings = new QuerySettings();
		result = new QueryResult();
	}

	public ListQuery_mysql(QuerySettings settings) {
		this();
		if (settings != null) {
			this.settings.setResultType(settings.getResultType());
			this.settings.setResultBeanClass(settings.getResultBeanClass());
		}
	}

	public ListQuery_mysql(QueryResultType resultType) {
		this();
		settings.setResultType(resultType);
	}

	public void execute() {
		List rows;
		if (hql != null) {
			rows = session.createQuery(hql).setProperties(params).list();
		}
		else {
			String sql = getSql(true);			
			ResultTransformer transformer = null;
			boolean scalar = false;
			if (settings.getResultType() == QueryResultType.BEAN) {
				Class resultBeanClass = settings.getResultBeanClass();
				if (resultBeanClass.getName().startsWith("java")) {
					scalar = true;
					transformer = PassThroughResultTransformer.INSTANCE;
				}
				else {
					transformer = new CaseInsensBeanTransformer(resultBeanClass);
				}
			}
			else if (settings.getResultType() == QueryResultType.MAP) {
				transformer = AliasToEntityMapResultTransformer.INSTANCE;
			}

			SQLQuery query = session.createSQLQuery(sql);
			if (scalar) {
				try {
					Field field = Hibernate.class.getField(
						settings.getResultBeanClass().getSimpleName().toUpperCase());
					
					query.addScalar("result", (Type) field.get(Hibernate.class));
				}
				catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
			rows = query.setResultTransformer(transformer)
				.setProperties(params).list();
		}
		result.setRows(rows);
	}

	public QueryResult<T> getResult() {
		return result;
	}
	public QuerySettings getSettings() {
		return settings;
	}
	public void applySettings(QuerySettings settings) {
		this.settings.setResultType(settings.getResultType());
	}

	public String getHql() {
		return hql;
	}
	public ListQuery_mysql<T> setHql(String hql) {
		this.hql = hql;
		return this;
	}

}
