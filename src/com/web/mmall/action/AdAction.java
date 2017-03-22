package com.web.mmall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.mmall.MMallActon;

/*
 */
@Controller
public class AdAction  extends MMallActon {
	
	@RequestMapping
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		request.setAttribute("contentPhotoId", this.getParam("contentPhotoId"));
		return "mmall/adInfo";
	}
	
}
