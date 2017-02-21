package com.web.mmall.home.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.entity.FactoryUser;
import com.web.pmanager.PManagerAction;

@Controller
public class IndexAction  extends PManagerAction<FactoryUser>{

	@RequestMapping
	public String execute(){
		return "/mmall/home/index";
	}
}
