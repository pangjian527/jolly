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

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-3-30
 * Time: 4:05:51
 */
public class PagedQuery_back extends HibernateQuery {

	private PageSettings settings;
	private PagedQueryResult result;
	private boolean dontCount;

	public PagedQuery_back() {
		settings = PageSettings.of(1, 10);
		result = new PagedQueryResult();
		dontCount = false;
	}

	public PagedQuery_back(QuerySettings settings) {
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
		/*if (!dontCount) {
			if (pageNo <= 0 || pageNo > result.getPageCount()) {
				pageNo = result.getPageCount();
			}
		}*/
		result.setPageNo(pageNo);
		//
		SQLQuery query = constructSQLQuery(pageNo);
		List list = query.list();
		result.setRows(list);
	}

	private SQLQuery constructSQLQuery(int pageNo) {
		String sql = getSql(true);
		sql = constructPagedSql(sql); 
		SQLQuery query = session.createSQLQuery(sql);
		int startRow = settings.getPageSize() * (pageNo - 1);
		
		query.setParameter("startRow", startRow);
		query.setParameter("endRow", settings.getPageSize());
		
		query.setProperties(params);
		if (settings.getResultType() == QueryResultType.MAP) {
			ResultTransformer transformer = AliasToEntityMapResultTransformer.INSTANCE;
			query.setResultTransformer(transformer);
		}		
		return query;
	}

	private String constructPagedSql(String listsql) {
		StringBuilder sql = new StringBuilder();
		sql.append(" select A.*  from (");
		sql.append(listsql+" LIMIT :startRow , :endRow");
		sql.append(") A "); 
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
