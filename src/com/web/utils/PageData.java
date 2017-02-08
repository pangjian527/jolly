package com.web.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import pub.types.IdText;
/**web版前台分页数据**/
public class PageData implements Serializable {
	
	private static final long serialVersionUID = 4294443304587950093L;
	
	//首页
	private String home;
	//上一页
	private String prevPage;
	//下一页
	private String nextPage;
	
	//尾页
	private String endPage;
	//以下两项是局部加载用
	private String homeUrl;
	//js的方法名
	private String jsFunName;
	//显示中的页面的头页与尾页
	private int sstartPage = 1;
	
	private int sendPage = 0;
	
	private List<IdText> pages = new ArrayList<IdText>();
	
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(String prevPage) {
		this.prevPage = prevPage;
	}
	public String getNextPage() {
		return nextPage;
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	public String getEndPage() {
		return endPage;
	}
	public void setEndPage(String endPage) {
		this.endPage = endPage;
	}
	public String getHomeUrl() {
		return homeUrl;
	}
	public void setHomeUrl(String homeUrl) {
		this.homeUrl = homeUrl;
	}
	public String getJsFunName() {
		return jsFunName;
	}
	public void setJsFunName(String jsFunName) {
		this.jsFunName = jsFunName;
	}
	public List<IdText> getPages() {
		return pages;
	}
	public void setPages(List<IdText> pages) {
		this.pages = pages;
	}
	public int getSstartPage() {
		return sstartPage;
	}
	public void setSstartPage(int sstartPage) {
		this.sstartPage = sstartPage;
	}
	public int getSendPage() {
		return sendPage;
	}
	public void setSendPage(int sendPage) {
		this.sendPage = sendPage;
	}	
	
}
