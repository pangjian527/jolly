package pub.dao.hibernate;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import pub.dao.GeneralDao;
import pub.dao.query.QueryResultType;
import pub.functions.StrFuncs;
import pub.types.Executable;

/**
 * GeneralDao实现类.
 *
 * @author zhuangzhonglong
 * @since 2008-8-5
 * @time 20:29:35
 */
public class GeneralDaoImpl extends HibernateDao<Object> implements GeneralDao {

	public GeneralDaoImpl() {
		super(null);
	}

	public void execute(Executable executable) {
		if (executable instanceof SessionAware) {
			((SessionAware) executable).setSession(getSession());
		}
		executable.execute();
	}

	public Date getSysDate() {
		Session ss = getSession();
		Date time = (Date) ss.createSQLQuery(
			"select sysdate as tm from dual")
			.addScalar("tm", Hibernate.DATE)
			.uniqueResult();
		return time;
	}

	@Override
	public void flushOperations() {
		getSession().flush();
	}

	@Override
	public void evict(List entities) {
		Session session = getSession();
		for (Object entity : entities) {
			session.evict(entity);
		}
	}

	@Override
	public void evict(Object entity) {
		getSession().evict(entity);
	}
	
	@Override
	public void executeSql(String sql) {
		getSession().createSQLQuery(sql).executeUpdate();
	}
	
	@Override
	public Integer getCount(String tablename, Map<String,String> wheres) {
		String where = " 1=1 ";
		for (String key : wheres.keySet()) {
			where += "and "+key+" =:"+key+" ";
		}
		String sql = "select count(*) as count from "+tablename+" where "+where;
		SQLQuery query = getSession().createSQLQuery(sql);
		for (String key : wheres.keySet()) {
			query.setString(key, wheres.get(key));
		}
		Integer count = (Integer) query.addScalar("count", Hibernate.INTEGER).uniqueResult();
		return count;
	}
	
	
	/**
	 * 
	 * @Author：
	 * @ 方法说明：根据主键ID获取到相应的行数据
	 * @param tableName 表名称
	 * @param entityId 要获取的主键ID
	 * @return
	 * @ 算法如下：
	 * 
	 * @1：实例化分页查询对象
	 * @2：生成查询sql后执行查询
	 * @3：获取返回数据并且半段是否有目标数据
	 * @ 版本信息:2013-5-27
	 */
	public Map getEntity(String tableName, String entityId) {
		if(StrFuncs.isEmpty(entityId))
			return null;
		
		//@1：实例化分页查询对象
		ListQuery query = new ListQuery(QueryResultType.MAP);
		
		//@2：生成查询sql后执行查询
		query.select("*").from(tableName).where("id='" + entityId + "'");
		this.execute(query);
		
		//@3：获取返回数据并且半段是否有目标数据
		List resultRows = query.getResult().getRows();
		return resultRows.size() > 0 ? (Map) resultRows.get(0) : null;
	}

	/**
	 * 
	 * @Author：
	 * @ 方法说明：根据Id删除指定表的一行数据
	 * @param tableName 表名称
	 * @param entityId 主键ID
	 * @ 算法如下：
	 * 
	 * @1：生成需要执行删除的sql
	 * @2：调用this.getSession()获取到session，然后调用createSQLQuery方法执行
	 * @ 版本信息:2013-5-27
	 */
	public void deleteEntity(String tableName, String entityId) {
		//@1：生成需要执行删除的sql
		String sql = "delete from " + tableName + " t where t.id=:id";

		// @2：调用this.getSession()获取到session，然后调用createSQLQuery方法执行
		this.getSession().createSQLQuery(sql).setParameter("id", entityId);
	}

	/**
	 * 
	 * @Author：
	 * @ 方法说明：用来保存或修改没有实体的数据
	 * @param tableName 表名称
	 * @param entityId 初始化数据的ID
	 * @param entityMap 保存数据的map，key对应表字段，value对应值
	 * @return
	 * @throws Exception
	 * @ 算法如下：
	 * 
	 * @1：根据提供的ID判断tableName表中此数据是否存在
	 * @2: 调用saveEntity或者updateEneity持久化
	 * @ 版本信息:2013-5-26
	 */
	public String saveEntity(String tableName, String entityId, Map entityMap)
			throws Exception {
		//@1：根据提供的ID判断tableName表中此数据是否存在
		Map map=this.getEntity(tableName, entityId);
		String uuid=null;
		if(map==null||map.size()<=0){
			//@2: 调用saveEntity或者updateEneity持久化
			uuid = insertEntity(tableName, entityMap);
		}else{
			//@2: 调用saveEntity或者updateEneity持久化
			uuid=this.updateEntity(tableName, entityId, entityMap);
		}
		return uuid;
	}

	/**
	 * 
	 * @Author：pj
	 * @ 方法说明：用来保存没有实体的数据
	 * @param tableName
	 * @param entityMap
	 * @return
	 * @ 算法如下：
	 * 
	 * @1：利用UUID获取唯一编码
	 * @2：取出entityMap所有的字段keys
	 * @3：动态生成添加的sql语句
	 * @4：切除动态生成后多余的字符
	 * @5：执行持久化
	 * @ 版本信息:2013-5-27
	 */
	private String insertEntity(String tableName, Map entityMap) {
		
		//@1：利用UUID获取唯一编码
		String uuid=UUID.randomUUID().toString().replace("-", "") ;
		
		//@2：取出entityMap所有的字段keys
		Set<String> keys = entityMap.keySet();
		
		Map<String, Object> valuesMap = new HashMap<String, Object>();
		//@3：动态生成添加的sql语句
		StringBuffer insert = new StringBuffer();
		insert.append(" insert into  ").append(tableName).append("(id");
		StringBuffer values = new StringBuffer();
		values.append(" values ('").append(uuid).append("'");
		
		for (String fieldName : keys) {
			insert.append(", ").append(fieldName);
			
			values.append(" ,:"+fieldName);
			Object fieldValue = entityMap.get(fieldName);
			valuesMap.put(fieldName, fieldValue == null ? "" : entityMap.get(fieldName));
		}
		values.append(")");
		insert.append(")");
		//@4:切除动态生成后多余的字符
		String execSql = insert.toString() + values.toString();
		
		//@5:执行持久化
		this.getSession().createSQLQuery(execSql).setProperties(valuesMap).executeUpdate();
		return uuid;
	}
	
	/**
	 * 
	 * @Author：pj
	 * @ 方法说明：用来修改没对应实体的表数据
	 * @param tableName 表名称
	 * @param entityId 主键ID
	 * @param entityMap 修改后的数据（key，value）
	 * @return
	 * @ 算法如下：
	 * 
	 * @1：获取修改的所有字段
	 * @2：动态生成修改的sql语句
	 * @3：通过
	 * @ 版本信息:2013-5-27
	 */
	private String updateEntity(String tableName, String entityId, Map entityMap){
		                 
		//@1：获取修改的所有字段
		Set<String> keys = entityMap.keySet();
		
		//@2：动态生成修改的sql语句
		StringBuffer update = new StringBuffer(" update  " + tableName
				+ " t set ");

		Map<String, Object> valuesMap = new HashMap<String, Object>();
		for (String fieldName : keys) {
			update.append(" t." + fieldName + "=:" + fieldName + ",");
			
			Object fieldValue = entityMap.get(fieldName);
			valuesMap.put(fieldName, fieldValue == null ? "" : entityMap.get(fieldName));
		}
		String execSql = update.substring(0, update.length() - 1)
				+ " where t.id=:entityId";
		
		this.getSession().createSQLQuery(execSql)
			.setProperties(valuesMap)
			.setParameter("entityId", entityId).executeUpdate();
		return entityId;
	}
}
