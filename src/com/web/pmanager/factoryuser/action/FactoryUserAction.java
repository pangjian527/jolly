package com.web.pmanager.factoryuser.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.functions.StrFuncs;
import pub.spring.ActionResult;

import com.sys.entity.FactoryUser;
import com.sys.service.FactoryUserService;
import com.web.pmanager.PManagerAction;

/**
 * 门店员工
 * @author zhangz
 *
 */
@Controller
public class FactoryUserAction extends PManagerAction<FactoryUser>{
	
/*	@RequestMapping
	public String query(HttpServletRequest request, ModelMap model,String queryCondition) throws Exception{
		
		int pageNo = this.getIntegerParam("pn", 1);
		
		QueryResult result = baseService.query(queryCondition, PageSettings.of(pageNo));
		
		request.setAttribute("queryResult", result);

		model.put("queryCondition", StrFuncs.isEmpty(queryCondition) ? "{}" : queryCondition);
		return "/pmanager/factory/employee";
	}*/
	
/*	@RequestMapping
	public String add(HttpServletRequest request,ModelMap model)throws Exception {
		
		model.put( "readonly", true);
		
		FactoryUser factoryUser = new FactoryUser();
		
		model.addAttribute(factoryUser);
		
		//List<Factory> factorys =  factoryService.getAll();
		
		//model.put( "factorys", factorys);
		
		return "/pmanager/factory/show_employee";
	}*/
	
/*	
	@RequestMapping
	public String edit(HttpServletRequest request,String id,ModelMap model) throws Exception{
		
		model.put( "readonly", false);
		
		FactoryUser factoryUser = baseService.get(id);
		
		model.addAttribute(factoryUser);
		
		//List<Factory> factorys =  factoryService.getAll();
		
		//model.put( "factorys", factorys);
		
		return "/pmanager/factory/show_employee";
	}*/
	
	/*
	 * jmj 2015-05-04
	 * 门店账号 保存模块
	 * objectId:id
	 */
	@RequestMapping
	public View save(HttpServletRequest request, String id) {	
		String account = request.getParameter("account");
		String mobile = request.getParameter("mobile");
		//1.校验 账号,手机号码 是否可用
		boolean checkMessage = factoryUserService.indetifyAccount(account, id);
		if(!checkMessage){
			return ActionResult.ok("您的账号已被抢先注册, 请另择账号", "/pmanager/factory/employee.do?op=query&loadcache=1");			
		}
		checkMessage = factoryUserService.indetifyMobile(mobile, id);
		if(!checkMessage){
			return ActionResult.ok("您的手机号码已被抢先注册, 请另择号码", "/pmanager/factory/employee.do?op=query&loadcache=1");			
		}
		
		//2.根据新增还是修改 分别完善 并保存
		if(StrFuncs.isEmpty(id)){
			FactoryUser user = new FactoryUser();
			this.populate(user);
			user.setStatus(1);
			factoryUserService.save(user);
		}
		else{
			FactoryUser user = factoryUserService.get(id);
			this.populate(user);
			factoryUserService.save(user);
		}
		//3.返回保存结果
		return ActionResult.ok("保存成功", this.getActionPath() + "?op=query&loadcache=1");
	}
	
	
/*	@RequestMapping
	public View delete(HttpServletRequest request,String id) throws Exception{
		try {
			baseService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ActionResult.ok("删除成功", "/pmanager/factory/employee.do?op=query");
	}*/
	
	/*
	 * jmj 2015-05-04
	 * 门店账号增加模块 校验输入的账号是否存在
	 * account :增加账号
	 * objectId:id
	 */
    @RequestMapping
    public void checkAccount( HttpServletResponse response,String account,String id){
    	
    	//1.调用service 验证手机号码是否被使用 , 并返回处理数据
    	boolean success = factoryUserService.indetifyAccount(account, id);
    	if(!success){
    		this.writeErrorJson("该数据已存在 , 请重新输入");
    	}
    }
    
    /*
     * jmj 2015-05-04
     * 门店账号增加模块 校验输入的手机号码是否存在
     * mobile :增加的手机号码
     * objectId:id
     */
    @RequestMapping
    public void checkMobile( HttpServletResponse response,String mobile, String id){
    	//1.调service 验证账号是否可用 , 并返回处理数据
    	boolean success = factoryUserService.indetifyMobile(mobile, id);
    	if(!success){
    		this.writeErrorJson("该数据已存在 ,请重新输入");
    	}
    }

	@Autowired
	private FactoryUserService factoryUserService;
}
