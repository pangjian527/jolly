package pub.dao.hibernate;

import org.hibernate.Session;

import pub.dao.query.AbstractQuery;

public abstract class HibernateQuery extends AbstractQuery
	implements SessionAware<HibernateQuery> {

	protected Session session;

	public HibernateQuery setSession(Session session) {
		this.session = session;
		return this;
	}

}
