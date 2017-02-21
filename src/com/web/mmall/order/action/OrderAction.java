package com.web.mmall.order.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.entity.Bookform;
import com.web.pmanager.PManagerAction;

@Controller
public class OrderAction extends PManagerAction<Bookform>{

	@RequestMapping
	public String execute(){
		return "/mmall/order/submit";
	}
	@RequestMapping
	public String list(){
		return "/mmall/order/list";
	}
	
}
