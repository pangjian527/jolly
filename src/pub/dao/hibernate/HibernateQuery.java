package pub.dao.hibernate;

import org.hibernate.Session;

import pub.dao.query.AbstractQuery;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-9-3
 * Time: 21:37:13
 */
public abstract class HibernateQuery extends AbstractQuery
	implements SessionAware<HibernateQuery> {

	protected Session session;

	public HibernateQuery setSession(Session session) {
		this.session = session;
		return this;
	}

}
