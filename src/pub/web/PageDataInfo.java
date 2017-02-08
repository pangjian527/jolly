package pub.web;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: Sep 8, 2009
 * Time: 10:33:45 PM
 */
public class PageDataInfo {

	private Object data;
	// System.currentTimeMillis
	private long lastVisitTime;

	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public long getLastVisitTime() {
		return lastVisitTime;
	}
	public void setLastVisitTime(long lastVisitTime) {
		this.lastVisitTime = lastVisitTime;
	}
}
