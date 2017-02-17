package com.web.pmanager.expressfee.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sys.entity.ExpressFee;
import com.sys.service.ExpressFeeService;
import com.web.pmanager.PManagerAction;

@Controller
public class ExpressFeeAction extends PManagerAction<ExpressFee>{
	@Autowired
	private ExpressFeeService expressFeeService;
}
