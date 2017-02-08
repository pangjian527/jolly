package com.sys.app.aspect;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.event.PostDeleteEvent;
import org.hibernate.event.PostDeleteEventListener;
import org.hibernate.event.PostInsertEvent;
import org.hibernate.event.PostInsertEventListener;
import org.hibernate.event.PostUpdateEvent;
import org.hibernate.event.PostUpdateEventListener;
import org.hibernate.event.PreUpdateEvent;
import org.hibernate.event.PreUpdateEventListener;
import org.hibernate.persister.entity.AbstractEntityPersister;

import pub.functions.DateFuncs;
import pub.functions.VarFuncs;

import com.sys.entity.LogFieldChange;
import com.sys.entity.LogRecordChange;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2009-4-9
 * Time: 18:48:43
 */
public class RecordChangeListener implements PostInsertEventListener,
	PreUpdateEventListener, PostUpdateEventListener, PostDeleteEventListener {

	private static final long serialVersionUID = 1L;

	private LogRecordChange newLogRecordChange(String tableName, Serializable recordId, int changeType) {
		ClientData clientData = ClientData.contextData.get();
		if (clientData == null) {
			clientData = new ClientData();
		}

		LogRecordChange recordChange = new LogRecordChange();
		recordChange.setChangeType(changeType);

		recordChange.setTableName(tableName);
		recordChange.setChangeTime(new Date());
		recordChange.setUserId(clientData.getUserId());
		recordChange.setUserIp(clientData.getIpAddr());

		recordChange.setRecordId((String) recordId);
		return recordChange;
	}

	private String getString(Object obj) {
		if (obj == null) {
			return null;
		}
		if (obj instanceof Date) {
			return DateFuncs.toString((Date) obj);
		}
		return obj.toString();
	}

	public void onPostInsert(PostInsertEvent event) {
		AbstractEntityPersister persister = (AbstractEntityPersister) event.getPersister();
		String tableName = persister.getTableName();
		if (ignoreTable(tableName)) {
			return;
		}
		if (!(event.getId() instanceof Integer)) {
			return;
		}
		Object[] newFields = event.getState();

		LogRecordChange recordChange = newLogRecordChange(tableName, event.getId(), 1);
		
		Session session = event.getSession().getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			
			List<LogFieldChange> fieldChanges = new ArrayList<LogFieldChange>();
			boolean[] updatables = persister.getPropertyUpdateability();
			
			for (int n = 0; n < newFields.length; n++) {
				Object newField = newFields[n];
				if (!updatables[n]) {
					continue;
				}
				LogFieldChange fieldChange = new LogFieldChange();
				fieldChange.setFieldName(persister.getPropertyColumnNames(n)[0]);
				fieldChange.setNewValue(getString(newField));
				fieldChanges.add(fieldChange);
				
			}
			session.save(recordChange);
			for (LogFieldChange fieldChange : fieldChanges) {
				fieldChange.setRecordChangeId(recordChange.getId());
				session.save(fieldChange);
			}
			tx.commit();
		}
		catch (Exception e) {
			tx.rollback();
		}
		finally {
			session.close();
		}
	}

	public boolean onPreUpdate(PreUpdateEvent event) {
		AbstractEntityPersister persister = (AbstractEntityPersister) event.getPersister();
		String tableName = persister.getTableName();
		if (ignoreTable(tableName)) {
			return false;
		}
		if (!(event.getId() instanceof Integer)) {
			return false;
		}
		Object[] oriFields = event.getPersister().getDatabaseSnapshot(event.getId(), event.getSession());
		Object[] newFields = event.getState();

		Session session = event.getSession().getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			
			LogRecordChange recordChange = newLogRecordChange(tableName, event.getId(), 2);
			
			List<LogFieldChange> fieldChanges = new ArrayList<LogFieldChange>();
			boolean[] updatables = persister.getPropertyUpdateability();
			if(oriFields!=null){//临时解决 2012-09-12 by dgs
				for (int n = 0; n < oriFields.length; n++) {
					Object oriField = oriFields[n];
					Object newField = newFields[n];
					if (!updatables[n] || VarFuncs.equals(oriField, newField)) {
						continue;
					}
					LogFieldChange fieldChange = new LogFieldChange();
					fieldChange.setFieldName(persister.getPropertyColumnNames(n)[0]);
					fieldChange.setOldValue(getString(oriField));
					fieldChange.setNewValue(getString(newField));
					fieldChanges.add(fieldChange);
					
				}
			}
			
			if (fieldChanges.size() > 0) {
				session.save(recordChange);
				for (LogFieldChange fieldChange : fieldChanges) {
					fieldChange.setRecordChangeId(recordChange.getId());
					session.save(fieldChange);
				}
			}
			tx.commit();
		}
		catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return false;
	}

	public void onPostUpdate(PostUpdateEvent event) {

	}

	public void onPostDelete(PostDeleteEvent event) {
		AbstractEntityPersister persister = (AbstractEntityPersister) event.getPersister();
		String tableName = persister.getTableName();
		if (ignoreTable(tableName)) {
			return;
		}
		if (!(event.getId() instanceof Integer)) {
			return;
		}
		Object[] oriFields = event.getDeletedState();

		LogRecordChange recordChange = newLogRecordChange(tableName, event.getId(), 3);
		
		Session session = event.getSession().getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			
			List<LogFieldChange> fieldChanges = new ArrayList<LogFieldChange>();
			boolean[] updatables = persister.getPropertyUpdateability();
			
			for (int n = 0; n < oriFields.length; n++) {
				Object oriField = oriFields[n];
				if (!updatables[n]) {
					continue;
				}
				LogFieldChange fieldChange = new LogFieldChange();
				fieldChange.setFieldName(persister.getPropertyColumnNames(n)[0]);
				fieldChange.setOldValue(getString(oriField));
				fieldChanges.add(fieldChange);
				
			}
			session.save(recordChange);
			for (LogFieldChange fieldChange : fieldChanges) {
				fieldChange.setRecordChangeId(recordChange.getId());
				session.save(fieldChange);
			}
			tx.commit();
		}
		catch (Exception e) {
			tx.rollback();
		}
		finally {
			session.close();
		}
	}

	private boolean ignoreTable(String tableName) {
		return tableName.startsWith("LOG") || tableName.equals("SYS_MODULEROLE");
	}
}
