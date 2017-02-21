package com.web.mmall.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.entity.Product;
import com.sys.service.ProductService;
import com.web.pmanager.PManagerAction;

@Controller
public class ProductAction extends PManagerAction<Product>{
	@RequestMapping
	public String execute(){
		return "/mmall/product/list";
	}
	
	@RequestMapping
	public String viewDetail(HttpServletRequest request,HttpServletResponse response,String productId){
		Product product = productService.get(productId);
		request.setAttribute("product", product);
		return "/mmall/product/detail";
	}
	
	@Autowired
	private ProductService productService;
	

}
