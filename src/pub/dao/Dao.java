package pub.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: Jun 23, 2009
 * Time: 7:00:06 PM
 */
public interface Dao<T> {

	T get(Serializable id);

	List<T> getAll();
 	List<T> getAll(String orderBy);

	void save(T t);

	void delete(T t);
	void delete(Serializable id);
	void delete(Serializable[] ids);

}
