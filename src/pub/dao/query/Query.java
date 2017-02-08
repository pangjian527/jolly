package pub.dao.query;

import pub.types.Executable;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-9-3
 * Time: 20:46:16
 */
public interface Query extends Executable {

	Query select(String select);
	Query from(String from);
	Query where(Object where);
	Query distinct(boolean distinct);
	Query orderBy(String orderBy);
	Query groupBy(String groupBy);
	Query put(String paramName, Object paramValue);
	Query setSql(String sql);
	QueryResult getResult();
	QuerySettings getSettings();
	void applySettings(QuerySettings settings);

}
