package pub.dao.hibernate;

import java.sql.Types;

import org.hibernate.Hibernate;

public class MySQLDialect extends org.hibernate.dialect.MySQLDialect {

	public MySQLDialect() {		
		super();
		registerHibernateType(Types.LONGVARCHAR, 65535, "text");
		registerHibernateType(Types.LONGVARBINARY, Hibernate.BLOB.getName());//注册blob，Types.LONGVARBINARY的值就是-4  
	}
}
