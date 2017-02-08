package pub.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import pub.types.Executable;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-2-7
 * Time: 18:49:58
 */
public interface GeneralDao {

	void execute(Executable executable);
	Date getSysDate();
	void flushOperations();

	void evict(List entities);
	void evict(Object entity);
	
	//by dgs 2014-04-19 主要是执行update语句
	public void executeSql(String sql);
	
	//主要是查找个数
	public Integer getCount(String tablename,Map<String,String> wheres);


	
	//2014-12-22 pj add
	public Map getEntity(String tableName, String entityId);
	
	public void deleteEntity(String tableName, String entityId);
	
	public String saveEntity(String tableName, String entityId, Map entityMap)	throws Exception;
	
}