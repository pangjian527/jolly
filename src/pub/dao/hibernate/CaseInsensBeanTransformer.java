package pub.dao.hibernate;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.hibernate.transform.ResultTransformer;

/**
 * 使SQLQuery返回bean对象列表的转换器，对属性大小写不敏感
 *
 * @author zhuangzhonglong
 * @since 2008-9-5
 * @time 9:25:11
 */
public class CaseInsensBeanTransformer implements ResultTransformer {

	private static final long serialVersionUID = 1L;

	private Class resultClass;
	private Map<String, Method> setterMap;
	private Map<String, Class> propTypes;

	public CaseInsensBeanTransformer(Class resultClass) {
		this.resultClass = resultClass;
		setterMap = new HashMap<String, Method>();
		propTypes = new HashMap<String, Class>();
		PropertyDescriptor[] propDescs = PropertyUtils.getPropertyDescriptors(resultClass);
		for (PropertyDescriptor propDesc : propDescs) {
			String upperPropName = propDesc.getName().toUpperCase();
			setterMap.put(upperPropName, propDesc.getWriteMethod());
			propTypes.put(upperPropName, propDesc.getPropertyType());
		}
	}


	public Object transformTuple(Object[] tuple, String[] aliases) {
		Object result;

		try {
			result = resultClass.newInstance();

			for (int i = 0; i < aliases.length; i++) {
				String alias = aliases[i].toUpperCase();
				Method method = setterMap.get(alias);
				if (method != null) {
					Object value = tuple[i];
					if (value != null) {
						Class propType = propTypes.get(alias);
						value = convert(value, propType);
					}
					method.invoke(result, value);
				}
			}
		}
		catch (Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}

		return result;
	}

	private Object convert(Object value, Class targetType) {
		if (value instanceof BigDecimal) {
			BigDecimal tvalue = (BigDecimal) value;
			if (targetType == Integer.class) {
				value = tvalue.intValue();
			}
			else if (targetType == Long.class) {
				value = tvalue.longValue();
			}
			else if (targetType == Double.class) {
				value = tvalue.doubleValue();
			}
			else if (targetType == String.class) {
				value = tvalue.toString();
			}
		}
		return value;
	}

	public List transformList(List collection) {
		return collection;
	}

}
