package pub.dao.query;

import java.io.Serializable;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-9-3
 * Time: 19:26:20
 */
@SuppressWarnings("unchecked")
public class QueryResult<T> implements Serializable {

	private static final long serialVersionUID = 4289122068530607759L;

	private Object result;

	public void setValue(Object result) {
		this.result = result;
	}

	// for unique query
	public T _getValue() {
		return (T) result;
	}

	// for list query
	public List<T> getRows() {
		return (List<T>) result;
	}
	public void setRows(List<T> rows) {
		this.result = rows;
	}
	public int getRowCount() {
		return getRows().size();
	}

}
