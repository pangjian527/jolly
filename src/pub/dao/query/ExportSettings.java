package pub.dao.query;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 11-6-28
 */
public class ExportSettings extends QuerySettings {

	private Integer rowLimit;

	public ExportSettings() {
		resultType = QueryResultType.ARRAY;
	}

	public static ExportSettings limit(int rowLimit) {
		ExportSettings settings = new ExportSettings();
		settings.setRowLimit(rowLimit);
		return settings;
	}

	public Integer getRowLimit() {
		return rowLimit;
	}
	public void setRowLimit(Integer rowLimit) {
		this.rowLimit = rowLimit;
	}
}
