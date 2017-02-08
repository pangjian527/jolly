package com.web.common.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class ActionResultAction {

	@RequestMapping
	public String execute() {
		return "forward:/common/action_result.jsp";
	}

}
