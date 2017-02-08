package com.web.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import pub.dao.query.PagedQueryResult;
import pub.dao.query.QueryResult;
import pub.types.IdText;
import pub.web.ServletUtils;

@Component("pageUtils")
public class PageUtils {

	public PageData getPageData(QueryResult queryResult,HttpServletRequest request){
		String url = ServletUtils.getShortRequestUrl();
		System.out.println("url="+url);
		url = parse(url, 1);
		
		PagedQueryResult pqueryResult = (PagedQueryResult)queryResult;
		PageData pageData = new PageData();
		pageData.setHome(parse(url, 1));
		if(pqueryResult.getPrevPage()==1){
			pageData.setPrevPage(pageData.getHome());
		}else{
			pageData.setPrevPage(parse(url,pqueryResult.getPrevPage()));
		}
		pageData.setNextPage(parse(url,pqueryResult.getNextPage()));
		pageData.setEndPage(parse(url,pqueryResult.getPageCount()));
		int pageNo = pqueryResult.getPageNo();
		
		int startPage = Math.max(pageNo - 4, 1);
		int endPage = Math.min(pageNo + 4, pqueryResult.getPageCount());
		pageData.setSstartPage(startPage);
		pageData.setSendPage(endPage);
		for(int i=startPage;i<=endPage;i++){
			pageData.getPages().add(new IdText(i, parse(url,i)));
		}
		return pageData;
	}
	//为局部加载网页
	public PageData getPageData2(QueryResult queryResult,String divId,String LIST_URL){
		PagedQueryResult pqueryResult = (PagedQueryResult)queryResult;
		PageData pageData = new PageData();
		pageData.setHomeUrl(LIST_URL);
		pageData.setJsFunName(divId);//就用这个divId
		pageData.setHome(createJsUrl(divId,LIST_URL));
		if(pqueryResult.getPrevPage()==1){
			pageData.setPrevPage(createJsUrl(divId,LIST_URL));
		}else{
			pageData.setPrevPage(createJsUrl(divId,LIST_URL+"&page="+pqueryResult.getPrevPage()));
		}
		pageData.setNextPage(createJsUrl(divId,LIST_URL+"&page="+pqueryResult.getNextPage()));
		pageData.setEndPage(createJsUrl(divId,LIST_URL+"&page="+pqueryResult.getPageCount()));
		return pageData;
	}
	
	private String createJsUrl(String divId,String url){
		String jsUrl = "javascript:loadPage(";
		jsUrl += "'"+divId+"','"+url+"');";
		return jsUrl;
	}
	
	private String parse(String url,int page){
		if(!url.contains("page=")){
			if(page<=1){
				return url;
			}else{
				if(url.contains("?")){
					return url+"&page="+page;
				}else{
					return url+"?page="+page;
				}
			}
		}	
		String lefturl = url.substring(url.indexOf("page=")+5, url.length());
		url = url.substring(0, url.indexOf("page=")+5);
		if(lefturl.length()>0 && lefturl.contains("&")){
			lefturl = lefturl.substring(lefturl.indexOf("&"), lefturl.length());
		}else{
			lefturl = "";
		}
		if(page==1){
			url = url.replace("&page=", "").replace("?page=", "");
		}else{
			url = url+page;
		}
		url += lefturl;
		return url;
	}
	
	
	
	public static void main(String[] str){
		//String url = "http://www.mailuntai.cn/products/?type=2&auto_brand=%E6%9C%AC%E7%94%B0&vehicle=&page=2&emission=2.4L&year=2012&brand=0";
		String url = "http://www.mailuntai.cn/products/?type=2&auto_brand=%E6%9C%AC%E7%94%B0&vehicle=&emission=2.4L&year=2012&brand=0&page=2";
		if(!url.contains("page=")){
			return;
		}
		String lefturl = url.substring(url.indexOf("page=")+5, url.length());
		url = url.substring(0, url.indexOf("page=")+5);
		
		System.out.println("lefturl="+lefturl);
		if(lefturl.length()>0 && lefturl.contains("&")){
			lefturl = lefturl.substring(lefturl.indexOf("&"), lefturl.length());
		}else{
			lefturl = "";
		}
		System.out.println("url="+url);
		url = url+10;
		System.out.println("url="+url);
		System.out.println("lefturl="+lefturl);
		url += lefturl;
		System.out.println("url="+url);
	}
}
