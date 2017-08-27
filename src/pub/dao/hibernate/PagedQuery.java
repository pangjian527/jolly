package pub.dao.hibernate;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.hibernate.transform.ResultTransformer;
import pub.dao.query.PageSettings;
import pub.dao.query.PagedQueryResult;
import pub.dao.query.QueryResultType;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;

import java.util.List;

public class PagedQuery extends HibernateQuery {

	private PageSettings settings;
	private PagedQueryResult result;
	private boolean dontCount;

	public PagedQuery() {
		settings = PageSettings.of(1, 10);
		result = new PagedQueryResult();
		dontCount = false;
	}

	public PagedQuery(QuerySettings settings) {
		this();
		applySettings(settings);
	}


	private int calculateRowCount() {
		long startTick = System.currentTimeMillis();

		String countSql = constructCountSql();
		int count = (Integer) session.createSQLQuery(countSql)
			.addScalar("ct", Hibernate.INTEGER)
			.setProperties(params)
			.uniqueResult();

		System.out.println("Count: " + (System.currentTimeMillis() - startTick));
		return count;
	}

	public void execute() {
		if (!dontCount) {
			int rowCount = calculateRowCount();
			result.setRowCount(rowCount);
		}
		result.setPageSize(settings.getPageSize());
		int pageNo = settings.getPageNo();
		if (!dontCount) {
			if (pageNo <= 0 || pageNo > result.getPageCount()) {
				pageNo = result.getPageCount();
			}
		}
		result.setPageNo(pageNo);
		//
		SQLQuery query = constructSQLQuery(pageNo);

		long startTick = System.currentTimeMillis();
		List list = query.list();
		System.out.println("List: " + (System.currentTimeMillis() - startTick));

		result.setRows(list);
	}

	private SQLQuery constructSQLQuery(int pageNo) {
		String sql = getSql(true);
		if (StrFuncs.notEmpty(outerSelect)) {
			sql = constructPagedSql(sql);
		}
		SQLQuery query = session.createSQLQuery(sql);
		int startRow = settings.getPageSize() * (pageNo - 1) + 1;
		if (StrFuncs.isEmpty(outerSelect)) {
			query.setFirstResult(startRow - 1)
				.setMaxResults(settings.getPageSize());
		}
		else {
			query.setParameter("startRow", startRow);
			query.setParameter("endRow", startRow + settings.getPageSize() - 1);
		}
		query.setProperties(params);
		if (settings.getResultType() == QueryResultType.MAP) {
			ResultTransformer transformer = AliasToEntityMapResultTransformer.INSTANCE;
			query.setResultTransformer(transformer);
		}
		else if (settings.getResultType() == QueryResultType.BEAN) {
			Class resultBeanClass = settings.getResultBeanClass();
			if (resultBeanClass.getName().startsWith("java")) {
				throw new RuntimeException("not implemented");
			}
			//ResultTransformer transformer = new CaseInsensBeanTransformer(resultBeanClass);
			//query.setResultTransformer(transformer);
			query.addEntity(resultBeanClass);
		}
		
		return query;
	}

	private String constructPagedSql(String listsql) {
		StringBuilder sql = new StringBuilder("select ");
		sql.append(outerSelect).append(" from (");
		sql.append("select * from (select A.*,rownum as rn from (");
		sql.append(listsql);
		sql.append(") A where rownum<=:endRow").append(")");
		sql.append(") x where rn>=:startRow");
		return sql.toString();
	}

	private String constructCountSql() {
		StringBuilder sb = new StringBuilder();
		boolean subQueryCount = distinct || sql != null || groupBy != null;
		if (subQueryCount) {
			sb.append("select count(1) as ct from (");
			sb.append(getSql(false));
			sb.append(")");
		}
		else {
			sb.append("select count(1) as ct from ").append(from);
			if (StrFuncs.notEmpty(where)) {
				sb.append(" where ").append(where);
			}
		}
		return sb.toString();
	}

	// result
	public PagedQueryResult getResult() {
		return result;
	}
	public QuerySettings getSettings() {
		return settings;
	}
	// settings
	public void applySettings(QuerySettings pSettings) {
		PageSettings settings = (PageSettings) pSettings;
		this.settings.apply(settings);
	}

	//old interfaces
	public void setPageNo(Integer pageNo) {
		settings.setPageNo(pageNo);
	}
	public void setPageSize(Integer pageSize) {
		settings.setPageSize(pageSize);
	}
	public int getRowCount() {
		return result.getRowCount();
	}
	public void setPageCount(Integer pageCount) {
		//do nothing
	}
	public void setRows(List rows) {
		result.setRows(rows);
	}
	public List getRows() {
		return result.getRows();
	}
	public void setDontCount(boolean dontCount) {
		this.dontCount = dontCount;
	}
}
