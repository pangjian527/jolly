package pub.dao.hibernate;

import org.hibernate.jdbc.util.FormatStyle;
import org.hibernate.jdbc.util.SQLStatementLogger;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2009-4-20
 * Time: 9:19:09
 */
public class SQLStatementLoggerEx extends SQLStatementLogger {

	private static ThreadLocal<Boolean> tlSuppressLog = new ThreadLocal<Boolean>();

	public SQLStatementLoggerEx(SQLStatementLogger oriLogger) {
		this.setLogToStdout(oriLogger.isLogToStdout());
		this.setFormatSql(oriLogger.isFormatSql());
	}

	public static void suppressLog() {
		tlSuppressLog.set(true);
	}

	public static void resumeLog() {
		tlSuppressLog.set(false);
	}

	public void logStatement(String statement, FormatStyle style) {
		if (Boolean.TRUE.equals(tlSuppressLog.get())) {
			return;
		}
		super.logStatement(statement, style);
	}
}
