package com.sys.service;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.hibernate.HibernateDao;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.DateFuncs;
import pub.functions.StrFuncs;
import pub.models.listview.ListViewModel;

import com.sys.entity.File;

/**
 * 通用的基础业务层
 * 期望:具体业务功能集成该类-常规方法不需要每一个service重复写
 * @author zhangz
 *
 */
@Transactional(readOnly = true)
public abstract class BaseService<T>{

	/**
	 * 将查询条件转化为对应功能的实体bean
	 * @param condition
	 * @return
	 */
	public static Object build(String condition,Object objClass){
		String string = "";
		if(condition!=null && !"".equals(condition)){
			string = "["+condition+"]";
		}else{
			string = "[]";
		}
		JSONArray jsonCondition = JSONArray.fromObject(string);
		
		return jsonCondition != null && jsonCondition.size() > 0 ? JSONObject
				.toBean(jsonCondition.getJSONObject(0),objClass.getClass()) : null;
	}
	
	public T get(String id){
		return this.getBaseDao().get(id);
	}
	
	
	@Transactional
	public void save(T entity){
		this.getBaseDao().save(entity);
	}
	
	
	@Transactional
	public void delete(String id){
		this.getBaseDao().delete(id);
	}

	
	public abstract QueryResult query(String condition, QuerySettings settings);
	//protected abstract HibernateDao<T> getBaseDao();
	
	private HibernateDao<T> baseDao = null;
	protected HibernateDao<T> getBaseDao(){
		//baseService = null;//for debug only
		if(baseDao != null){
			return baseDao;
		}
		
		synchronized(this){
			if(baseDao == null){
				//a.获取泛型类T的class对象
				Class serviceTClass = getActualTypeClass(this.getClass());
				
				//b.通过反射遍历子类的全部service对象，找出对应的service     //获取实体类的所有属性，返回Field数组  
	            for(Field field : this.getClass().getDeclaredFields()){     //遍历所有属性
	            	//b.1 判断字段名称是否为 "xxxDao"格式
	            	if(!field.getName().endsWith("Dao")){
	            		continue;
	            	}
	            	//b.2 判断属性是object类型
	            	Type type = field.getGenericType();
	            	if(!(type instanceof Class)){
	            		continue;
	            	}
	            	//b.3 判断属性是 BaseService的子类
	            	Class fieldClass = (Class)type;
	            	if(!HibernateDao.class.isAssignableFrom(fieldClass)){
	            		continue;
	            	}
	            	//b.4 判断属性的泛型类=classT
	            	Class daoTClass = getActualTypeClass(fieldClass);
	            	if(serviceTClass.equals(daoTClass)){
	            		try{
	            			//这一步最为关键，否则父类是没有权利获取子类的私有变量的
	            			//spring对私有变量的注入，也是用的相同方法
	            			field.setAccessible(true);
	            			baseDao = (HibernateDao<T>)field.get(this);
	            		}
	            		catch(Exception e){
	            			e.printStackTrace();
	            		}
	            	}
	            }
			}
			return baseDao;
		}
	}
	
	//myq add 2015-5-12，获取泛型类对应的第一个class,如
	private Class getActualTypeClass(Class clazz){
		ParameterizedType parameterizedType = (ParameterizedType)clazz.getGenericSuperclass(); 
		Type[] params = parameterizedType.getActualTypeArguments();  
		return (Class)params[0];
	}
	public T create() throws Exception{
		return this.getBaseDao().create();
	}
	
	public List<T> getAll(){
		return this.getBaseDao().getAll();
	}
	
	
	protected static void addQueryEqualFilter(JSONObject condition, StringBuilder where, Query query, 
			String key, String joinSql){
		if(condition==null)
			return;
		
		if(!condition.containsKey(key)){
			return;
		}
		
		String value = condition.getString(key);
		if(StrFuncs.isEmpty(value) || value.equals("null")){
			return;
		}
		
		where.append(joinSql);
		query.put(key, value);	
	}
	//默认key与字段一样
	protected static void addQueryEqualFilter(JSONObject condition, StringBuilder where, Query query, 
			String key){
		if(!condition.containsKey(key)){
			return;
		}
		
		String value = condition.getString(key);
		if(StrFuncs.isEmpty(value) || value.equals("null")){
			return;
		}
		
		where.append("and "+key+" = :"+key);
		query.put(key, value);	
	}
	
	protected static void addQueryDateFilter(JSONObject condition, StringBuilder where, Query query, 
			String key, String joinSql){
		if(!condition.containsKey(key)){
			return;
		}
		
		String value = condition.getString(key);
		if(StrFuncs.isEmpty(value) || value.equals("null")){
			return;
		}
		
		where.append(joinSql);
		query.put(key,  DateFuncs.valueOf(value));	
	}
	
	protected static void addQueryLikeFilter(JSONObject condition, StringBuilder where, Query query, 
			String key, String joinSql){
		if(condition==null)
			return;
		
		if(!condition.containsKey(key)){
			return;
		}
		
		String value = condition.getString(key);
		if(StrFuncs.isEmpty(value) || value.equals("null")){
			return;
		}
		where.append(joinSql);
		query.put(key, "%" + value.trim() + "%");	
	}
	//默认key与字段一样
	protected static void addQueryLikeFilter(JSONObject condition, StringBuilder where, Query query, 
			String key){
		if(condition==null)
			return;
		if(!condition.containsKey(key)){
			return;
		}
		
		String value = condition.getString(key);
		if(StrFuncs.isEmpty(value)){
			return;
		}
		where.append("and "+key+" like :"+key);
		query.put(key, "%" + value + "%");	
	}
	
	protected static void addQueryLeftLikeFilter(JSONObject condition, StringBuilder where, Query query, 
			String key, String joinSql){
		if(condition==null)
			return;
		if(!condition.containsKey(key)){
			return;
		}
		
		String value = condition.getString(key);
		if(StrFuncs.isEmpty(value)){
			return;
		}
		
		where.append(joinSql);
		query.put(key, "%" + value);	
	}
	/*
	 * 获取图片的JSON数据
	 */
	protected JSONObject getImgJson(String id,String tableName) {
		JSONObject object=new JSONObject();
		List<File> fileList=fileService.getFileIds(tableName, id);
		for(File file:fileList){
			JSONObject jsonObject=new JSONObject();
			jsonObject.element("id", file.getId());
			jsonObject.element("fileName", file.getFileName());
			object.element(file.getCode(), jsonObject);
		}
		return object;
	}
	
	public ListViewModel getExportModel(String condition, QuerySettings settings) throws Exception {
		return null;
	}
	@Autowired
	private FileService fileService;
}
