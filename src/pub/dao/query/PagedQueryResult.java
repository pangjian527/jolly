package pub.dao.query;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: zhuangzhonglong
 * Date: 2008-8-9
 * Time: 22:23:53
 */
public class PagedQueryResult extends QueryResult implements Serializable {

	private static final long serialVersionUID = 6844463695053352163L;

	int pageSize;
	int pageNo;
	int rowCount;

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	//
	public boolean getHasPrevPage() {
		return pageNo > 1;
	}
	public int getPrevPage() {
		int n = pageNo - 1;
		if (n < 1) n = 1;
		return n;
	}
	public boolean getHasNextPage() {
		return pageNo < getPageCount();
	}
	public int getNextPage() {
		return pageNo + 1;
	}
	public int getPageCount() {
		return (int) Math.ceil(1.0 * rowCount / pageSize);
	}
}
