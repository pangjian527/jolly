package com.web.pmanager.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.functions.StrFuncs;
import pub.spring.ActionResult;

import com.sys.entity.Product;
import com.sys.entity.ProductItem;
import com.sys.service.ProductItemService;
import com.sys.service.ProductService;
import com.web.pmanager.PManagerAction;

@Controller
public class ProductAction extends PManagerAction<Product>{

	@RequestMapping
	public String query(HttpServletRequest request,  ModelMap model)
		throws Exception{
		
		int pageNo=this.getIntegerParam("pn", 1);
		
		// @1：获取前端json查询条件,请求页数
		String queryCondition = request.getParameter("condition");
		QueryResult queryResult = productService.query(queryCondition, PageSettings.of(pageNo));
		
		request.setAttribute("queryResult", queryResult);
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
		
		ProductItem productItem = productItemService.getBySecurityCode(securityCode);
		
		if(productItem != null){
			this.writeErrorJson("防伪码已经存在，请重新输入！");
			return;
		}
		
		ProductItem item = new ProductItem();
		item.setProductId(productId);
		item.setSecurityCode(securityCode);
		item.setStatus(ProductItem.STATUS_EFFECTIVE);
		
		productItemService.save(item);
		this.writeJson(true);
	}
	
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductItemService productItemService;
}
