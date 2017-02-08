package pub.dao;

import javax.sql.DataSource;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: Jun 24, 2009
 * Time: 1:55:13 AM
 */
public interface DataSourceAware {

	void setDataSource(DataSource dataSource);

}
