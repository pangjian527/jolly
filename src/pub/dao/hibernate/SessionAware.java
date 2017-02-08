package pub.dao.hibernate;

import org.hibernate.Session;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-5-15
 * Time: 0:36:14
 */
public interface SessionAware<T> {

	T setSession(Session session);

}
