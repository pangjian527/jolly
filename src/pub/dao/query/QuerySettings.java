package pub.dao.query;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-9-3
 * Time: 20:23:21
 */
public class QuerySettings implements Serializable {

	private static final long serialVersionUID = -74433747975640550L;

	protected QueryResultType resultType = QueryResultType.MAP;

	//
	protected Class resultBeanClass;

	public QuerySettings() {
		//
	}

	public QuerySettings(Class resultBeanClass) {
		resultType = QueryResultType.BEAN;
		this.resultBeanClass = resultBeanClass;
	}

	public QueryResultType getResultType() {
		return resultType;
	}
	public void setResultType(QueryResultType resultType) {
		this.resultType = resultType;
	}

	public Class getResultBeanClass() {
		return resultBeanClass;
	}
	public void setResultBeanClass(Class resultBeanClass) {
		this.resultBeanClass = resultBeanClass;
	}

	public void apply(QuerySettings settings) {
		this.setResultType(settings.getResultType());
		this.setResultBeanClass(settings.getResultBeanClass());
	}
}
