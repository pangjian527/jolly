package pub.dao.query;

import java.util.HashMap;
import java.util.Map;

import pub.functions.StrFuncs;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-9-3
 * Time: 21:11:30
 */
@SuppressWarnings("unchecked")
public abstract class AbstractQuery implements Query {

	protected String outerSelect;
	protected String innerSelect;
	protected String select;
	protected String from;
	protected String where;
	protected String sql;
	protected String orderBy;
	protected boolean distinct;
	protected String groupBy;
	protected Map params;

	public AbstractQuery() {
		params = new HashMap();
	}

	public Query select(String select) {
		this.select = select;
		return this;
	}
	public Query outerSelect(String outerSelect) {
		this.outerSelect = outerSelect;
		return this;
	}
	public Query innerSelect(String innerSelect) {
		this.innerSelect = innerSelect;
		return this;
	}
	public Query from(String from) {
		this.from = from;
		return this;
	}
	public Query where(Object objWhere) {
		where = objWhere.toString();
		where = where.trim();
		if (where.startsWith("where ")) {
			where = where.substring(6);
		}
		else if (where.startsWith("and ")) {
			where = where.substring(4);
		}
		return this;
	}
	public Query distinct(boolean distinct) {
		this.distinct = distinct;
		return this;
	}
	public Query orderBy(String orderBy) {
		this.orderBy = orderBy;
		return this;
	}
	public Query groupBy(String groupBy) {
		this.groupBy = groupBy;
		return this;
	}

	public Query setSql(String sql) {
		this.sql = sql;
		return this;
	}

	public Query put(String paramName, Object paramValue) {
		params.put(paramName, paramValue);
		return this;
	}

	protected String getSql(boolean withOrderBy) {
		if (StrFuncs.notEmpty(sql)) {
			return sql;
		}
		StringBuilder sb = new StringBuilder();
		sb.append("select ");
		if (distinct) {
			sb.append("distinct ");
		}
		sb.append(select == null ? innerSelect : select);
		sb.append(" from ").append(from);
		if (StrFuncs.notEmpty(where)) {
			sb.append(" where ").append(where);
		}
		if (StrFuncs.notEmpty(groupBy)) {
			sb.append(" group by ").append(groupBy);
		}
		if (withOrderBy && StrFuncs.notEmpty(orderBy)) {
			sb.append(" order by ").append(orderBy);
		}
		return sb.toString();
	}
}
