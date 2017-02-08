package pub.functions;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ConvertUtilsBean;
import org.apache.commons.beanutils.converters.AbstractConverter;
import org.apache.commons.beanutils.converters.BooleanConverter;
import org.apache.commons.beanutils.converters.DoubleConverter;
import org.apache.commons.beanutils.converters.IntegerConverter;
import org.apache.commons.beanutils.converters.LongConverter;

import com.sun.org.apache.commons.beanutils.BeanUtils;

/**
 * Created by IntelliJ IDEA.
 * 
 * @author zhuangzhonglong Date: 2008-8-21 Time: 11:35:17
 */
@SuppressWarnings( { "unchecked" })
public class BeanFuncs {
	private static final BeanUtilsBean beanUtilBean = new BeanUtilsBean();
	static {
		ConvertUtilsBean convertUtils = beanUtilBean.getConvertUtils();
		
		convertUtils.register(new AbstractConverter(){
			@Override
			protected Object convertToType(Class type, Object value)
					throws Throwable {
				// TODO Auto-generated method stub
				//System.out.println("[Date-toType]" + type.getName() + "\t" 
				//		+ value.getClass().getSimpleName() + ":" + value.toString());
				return DateFuncs.valueOf(value);
			}
			@Override
			protected String convertToString(Object value){
				//System.out.println("[Date-toString]" + value.getClass().getName() + ":" + value.toString());
				return DateFuncs.toString((Date)value);
			}
			
			@Override
			protected Class<?> getDefaultType() {
				// TODO Auto-generated method stub
				return null;
			}
		}, Date.class);
		
		convertUtils.register(new AbstractConverter(){
			@Override
			protected Object convertToType(Class type, Object value)
					throws Throwable {
				// TODO Auto-generated method stub
				//System.out.println("[Text-toType]" + type.getName() + "\t" 
				//		+ value.getClass().getSimpleName() + ":" + value.toString());
				return value.toString();
			}
			@Override
			protected String convertToString(Object value){
			//	System.out.println("[Text-toString]" + value.getClass().getName() + ":" + value.toString());
				if(value == null){
					return "";
				}
				else if(value instanceof Date){
					return DateFuncs.toString((Date)value);
				}
				else{
					return value.toString();
				}
			}
			
			@Override
			protected Class<?> getDefaultType() {
				// TODO Auto-generated method stub
				return null;
			}
		}, String.class);
		
		convertUtils.register(new BooleanConverter(null), Boolean.class);
		convertUtils.register(new LongConverter(null), Long.class);
		convertUtils.register(new IntegerConverter(null), Integer.class);
		convertUtils.register(new DoubleConverter(null), Double.class);
	}


	public static <T> T deepClone(T t) {
		assert t instanceof Serializable : t.getClass().getName()
				+ " not serializable!";
		try {
			ByteArrayOutputStream obuf = new ByteArrayOutputStream();
			ObjectOutputStream os = new ObjectOutputStream(obuf);
			os.writeObject(t);

			ByteArrayInputStream ibuf = new ByteArrayInputStream(obuf
					.toByteArray());
			ObjectInputStream is = new ObjectInputStream(ibuf);
			T t1 = (T) is.readObject();
			return t1;
		} 
		catch (Exception e) {
			assert false : "this should not happen";
			return null;
		}
	}
	
	public static void populate(Object targetBean, Map srcObj){
		try{
			beanUtilBean.populate(targetBean, srcObj);
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}
	
	public static void copyProperty(Object bean, String name, Object value){
		try{
			beanUtilBean.copyProperty(bean, name, value);
		}
		catch(Exception e){
			e.printStackTrace();
		}	
	}
	
	public static Map<String, String> describe(Object bean) throws Exception{
		if(bean instanceof Map){
			return describe((Map) bean);
		}
		else{
			return beanUtilBean.describe(bean);
		}
	}
	
	
	public static Map<String, String> describe(Map map) throws Exception{
		Map<String, String> result = new HashMap<String, String>();
		ConvertUtilsBean converter = beanUtilBean.getConvertUtils();
		for(Object key : map.keySet()){
			Object value = map.get(key);
			result.put(key.toString(), converter.convert(value));
		}
		
		return result;
	}
	public static void insertLog(Object bean, String propertyName, String operate, String operator){
		insertLog(bean, propertyName, operate, operator, "");
	}
	public static void insertLog(Object bean, String propertyName, String operate, String operator,  String describe){
		//1.获得当前数组
		JSONArray logJsonArr = null;
		try{
			String dataLog = BeanUtils.getProperty(bean, propertyName);
			logJsonArr = StrFuncs.isEmpty(dataLog) ? new JSONArray() : JSONArray.fromObject(dataLog);
		}
		catch(Exception e){
			e.printStackTrace();
			logJsonArr = new JSONArray();
		}
		
		//2.生成新 的操作对象
		JSONObject logJsonObj = new JSONObject();
		logJsonObj.element("time", DateFuncs.toString(new Date()));
		logJsonObj.element("operate", operate);
		logJsonObj.element("operator", operator);
		if(describe != null && describe.length() > 200){
			describe = describe.substring(0, 200);
		}
		logJsonObj.element("describe", describe);
		
		//3.回写到bean中，需要控制长度，避免溢出
		logJsonArr.add(logJsonObj);
		while(logJsonArr.toString().length() >= 1000){
			logJsonArr.remove(0);
		}	
		try{
			BeanUtils.setProperty(bean, propertyName, logJsonArr.toString());
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
