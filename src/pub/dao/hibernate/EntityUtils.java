package pub.dao.hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.persister.entity.SingleTableEntityPersister;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 11-7-2
 */
@SuppressWarnings("unchecked")
public class EntityUtils {

	private static Map<String, String> tablePkMap = new HashMap<String, String>();

	@Autowired
	public void setSessionFactory(SessionFactory sf) {
		Collection<SingleTableEntityPersister> items = sf.getAllClassMetadata().values();
		Iterator<SingleTableEntityPersister> iter = items.iterator();
		while(iter.hasNext()) {
			SingleTableEntityPersister persister = iter.next();
			String tableName = persister.getTableName();
			String pk = persister.getKeyColumnNames()[0];
			tablePkMap.put(tableName, pk);
		}
	}

	public static String getPkFieldName(String tableName) {
		return tablePkMap.get(tableName);
	}

}
