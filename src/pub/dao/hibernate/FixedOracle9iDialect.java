package pub.dao.hibernate;

import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.dialect.Oracle9iDialect;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-9-4
 * Time: 22:44:00
 */
public class FixedOracle9iDialect extends Oracle9iDialect {

	public FixedOracle9iDialect() {
		registerHibernateType(Types.DATE, Hibernate.TIMESTAMP.getName());
		registerHibernateType(Types.CHAR, Hibernate.STRING.getName());
	}

}
