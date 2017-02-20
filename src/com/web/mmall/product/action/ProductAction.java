package com.web.mmall.product.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.entity.Product;
import com.web.pmanager.PManagerAction;

@Controller
public class ProductAction extends PManagerAction<Product>{
	@RequestMapping
	public String execute(){
		return "/mmall/product/list";
	}
	

}
