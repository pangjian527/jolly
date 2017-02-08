package pub.dao.query;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-8-25
 * Time: 11:45:24
 */
public class PageSettings extends QuerySettings implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer pageNo = 1;
	private Integer pageSize = 15;

	// for ext {
	private Integer start;

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getLimit() {
		return pageSize;
	}

	public void setLimit(Integer limit) {
		pageSize = limit;
	}

	//}

	public PageSettings() {
		resultType = QueryResultType.MAP;
	}

	public static PageSettings of(Integer pageNo) {
		return of(pageNo, 10);
	}

	public static PageSettings of(Integer pageNo, int pageSize) {
		PageSettings settings = new PageSettings();
		settings.setPageNo(pageNo);
		settings.setPageSize(pageSize);
		return settings;
	}

	//
	public static PageSettings of(Integer pageNo, int pageSize, Class resultBeanClass) {
		PageSettings settings = of(pageNo, pageSize);
		settings.setResultType(QueryResultType.BEAN);
		settings.setResultBeanClass(resultBeanClass);
		return settings;
	}

	public Integer getPageNo() {
		if (start != null) {
			return (int) (start / pageSize) + 1;
		}
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		if (pageNo == null) {
			pageNo = 1;
		}
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public void apply(PageSettings settings) {
		super.apply(settings);
		if (settings.getPageNo() != null) {
			this.pageNo = settings.getPageNo();
		}
		if (settings.getPageSize() != null) {
			this.pageSize = settings.getPageSize();
		}
	}
}
