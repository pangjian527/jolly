package com.web.pmanager.product.action;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.functions.DateFuncs;
import pub.functions.JsonFuncs;
import pub.functions.StrFuncs;
import pub.spring.ActionResult;

import com.sys.entity.Bookform;
import com.sys.entity.Factory;
import com.sys.entity.Product;
import com.sys.entity.ProductItem;
import com.sys.entity.StockRecord;
import com.sys.entity.UsageRecord;
import com.sys.service.BookformService;
import com.sys.service.FactoryService;
import com.sys.service.ProductItemService;
import com.sys.service.ProductService;
import com.sys.service.StockRecordService;
import com.sys.service.UsageRecordService;
import com.web.pmanager.PManagerAction;

@Controller
public class ProductAction extends PManagerAction<Product>{

	@RequestMapping
	public String query(HttpServletRequest request,  ModelMap model)
		throws Exception{
		
		int pageNo=this.getIntegerParam("pn", 1);
		
		// @1：获取前端json查询条件,请求页数
		String queryCondition = request.getParameter("condition")==null 
				?"{}":request.getParameter("condition");
		
		QueryResult queryResult = productService.query(queryCondition, PageSettings.of(pageNo));
		
		request.setAttribute("queryResult", queryResult);
		request.setAttribute("queryCondition", queryCondition);
		return "/pmanager/product/query";
	}
	
	@RequestMapping
	public String add(HttpServletRequest request,  ModelMap model){
		model.put("bean", new Product());
		return "/pmanager/product/show";
	}
	
	@RequestMapping
	public View save(HttpServletRequest request,String id){
		Product product = StrFuncs.isEmpty(id) ? new Product() : productService.get(id);
		product.setStatus(Product.STATUS_APPROVE);
		this.populate(product);
		
		productService.save(product);
		//3.返回
		return ActionResult.ok("保存成功", getActionPath() + "?op=query");
	}
	
	@RequestMapping
	public String inStockExecute(HttpServletRequest request,ModelMap model){
		model.put("productId", request.getParameter("productId"));
		return "/pmanager/product/instock";
	}
	
	@RequestMapping
	public void inStock(HttpServletRequest request, HttpServletResponse response){
		
		String securityCode = request.getParameter("securityCode");
		String productId = request.getParameter("productId");
		
		String result = productItemService.inStock(productId,securityCode);
		if(result == null){
			this.writeJson(true);
		}else{
			this.writeErrorJson(result);
		}
	}
	
	@RequestMapping
	public String outStockExecute(HttpServletRequest request,ModelMap model){
		model.put("bookId", request.getParameter("bookId"));
		return "/pmanager/order/outstock";
	}
	
	@RequestMapping
	public void outStock(HttpServletRequest request, HttpServletResponse response){
		
		String securityCode = request.getParameter("securityCode");
		String bookId = request.getParameter("bookId");
		
		String result = productItemService.outStock(bookId,securityCode);
		if(result == null){
			this.writeJson(true);
		}else{
			this.writeErrorJson(result);
		}
	}
	
	@RequestMapping
	public void effective(HttpServletRequest request, HttpServletResponse response,String productId){
		
		Product product = productService.get(productId);
		product.setStatus(Product.STATUS_VALID);
		
		productService.save(product);
		
		this.writeJson(true);
	}
	@RequestMapping
	public void distable(HttpServletRequest request, HttpServletResponse response,String productId){
		
		Product product = productService.get(productId);
		product.setStatus(Product.STATUS_OUT_OF_STOCK);
		
		productService.save(product);
		this.writeJson(true);
	}
	
	@RequestMapping
	public String securityInfo(HttpServletRequest request, HttpServletResponse response,String securityCode){

		String url = "/pmanager/product/security";
		request.setAttribute("securityCode", securityCode);
		if(StrFuncs.isEmpty(securityCode))
			return url;
		
		//1. 获取防伪码
		ProductItem productItem = productItemService.getBySecurityCode(securityCode);
		if(productItem == null)
			return url;
		
		//2. 获取商品信息
		Product product = productService.get(productItem.getProductId());
		
		//3. 获取出入库记录
		List<StockRecord> stockRecords = stockRecordService.getStockRecordBySecurityCode(securityCode);
		List<StockStatus> listStockStatus = this.getData(stockRecords);
		
		//4. 获取查询记录
		int usageCount = usageRecordService.countUsageQuery(securityCode);
		List<UsageRecord> listUsageRecord = usageRecordService.getUsageByCode(securityCode);

		request.setAttribute("product", product);
		request.setAttribute("productItem", productItem);
		request.setAttribute("listStockStatus", listStockStatus);
		request.setAttribute("listUsageStatus", this.getDataUsage(listUsageRecord));
		request.setAttribute("usageCount", usageCount);
		
		return url;
	}
	
	private List<UsageStatus> getDataUsage(List<UsageRecord> listUsageRecord){
		List<UsageStatus> list =new LinkedList<UsageStatus>();
		for (UsageRecord usageRecord : listUsageRecord) {
			UsageStatus status  = new UsageStatus();
			status.createTime = usageRecord.getCreateTime();
			
			Factory factory = factoryService.get(usageRecord.getFactoryId());
			status.factoryName = factory.getName();
			
			list.add(status);
		}
		return list;
	}
	
	
	private List<StockStatus> getData(List<StockRecord> stockRecords){
		
		List<StockStatus> list = new LinkedList<StockStatus>();
		
		for (StockRecord stockRecord : stockRecords) {
			
			StockStatus status = new StockStatus();
			status.stockType = stockRecord.getType();
			status.createTime = stockRecord.getCreateTime();
			
			list.add(status);
			
			if(StrFuncs.isEmpty(stockRecord.getBookId()))
				continue;
			
			Bookform bookform = bookformService.get(stockRecord.getBookId());
			status.bookformCode = bookform.getCode();
			
			Factory factory = factoryService.get(bookform.getFactoryId());
			status.factoryName = factory.getName();
			status.factoryMobile = factory.getMobile();
			
		}
		
		return list;
	}
	
	@RequestMapping
	public void rejectProudct(HttpServletRequest request, HttpServletResponse response){
		//退货
		String securityCode = request.getParameter("securityCode");
		
		String result = productItemService.rejectProudct(securityCode);
		if(result == null){
			this.writeJson(true);
		}else{
			this.writeErrorJson(result);
		}
	}
	
	public static class StockStatus{
		
		private Date createTime;
		private String factoryName;
		private String bookformCode;
		private int stockType;
		private String factoryMobile;

		public Date getCreateTime() {
			return createTime;
		}
		public void setCreateTime(Date createTime) {
			this.createTime = createTime;
		}
		public String getFactoryName() {
			return factoryName;
		}
		public void setFactoryName(String factoryName) {
			this.factoryName = factoryName;
		}
		public String getBookformCode() {
			return bookformCode;
		}

		public void setBookformCode(String bookformCode) {
			this.bookformCode = bookformCode;
		}

		public int getStockType() {
			return stockType;
		}

		public void setStockType(int stockType) {
			this.stockType = stockType;
		}

		public String getFactoryMobile() {
			return factoryMobile;
		}

		public void setFactoryMobile(String factoryMobile) {
			this.factoryMobile = factoryMobile;
		}
	}
	
	public static class UsageStatus{
		private String factoryName;
		private Date createTime;
		public String getFactoryName() {
			return factoryName;
		}
		public void setFactoryName(String factoryName) {
			this.factoryName = factoryName;
		}
		public Date getCreateTime() {
			return createTime;
		}
		public void setCreateTime(Date createTime) {
			this.createTime = createTime;
		}
	}
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductItemService productItemService;
	@Autowired
	private StockRecordService stockRecordService;
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private BookformService bookformService;
	@Autowired
	private UsageRecordService usageRecordService;
}
