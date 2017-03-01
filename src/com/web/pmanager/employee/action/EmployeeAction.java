package com.web.pmanager.employee.action;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.functions.DateFuncs;

import com.sys.entity.Product;
import com.sys.entity.Score;
import com.sys.entity.SysUser;
import com.sys.service.FactoryService;
import com.sys.service.ScoreService;
import com.sys.service.SysUserService;
import com.web.pmanager.PManagerAction;

@Controller
public class EmployeeAction extends PManagerAction<Score>{

	@RequestMapping
	public String execute(HttpServletRequest request,  ModelMap model,String sysUserId){
		
		int pageNo=this.getIntegerParam("pn", 1);
		
		//获取所有的员工
		List<SysUser> sysUserList = sysUserService.getAll();
		List<JSONObject> result = new LinkedList<JSONObject>();
		for (SysUser sysUser : sysUserList) {
			if(!sysUser.getOrganizationId().equals("channel"))
				continue;
			JSONObject object = JSONObject.fromObject(sysUser);
			object.element("factoryCount", 
					factoryService.countFactoryBySysUser(sysUser.getId()));
			result.add(object);
		}
		
		if(sysUserId == null && !result.isEmpty()){
			sysUserId =result.get(0).getString("id");
		}
		
		//1. 获取当前用户所有的积分
		double allScore = scoreService.getAllScoreBySysUser(sysUserId, null, null);
		//2. 获取当前月的积分
		Date date = new Date();
		Date monthFirstDay = DateFuncs.valueOf(DateFuncs.getMonthFirstDay(date));
		Date monthLastDay = DateFuncs.addDay(DateFuncs.valueOf(DateFuncs.getMonthLastDay(date)),1);
		double currentMonthScore = scoreService.getAllScoreBySysUser(sysUserId, monthFirstDay, monthLastDay);
		//3. 获取上个月的积分
		
		System.out.println(DateFuncs.toDateString(monthFirstDay));
		
		Date upMonth = DateFuncs.addDay(monthFirstDay, -2);
		System.out.println(DateFuncs.toDateString(upMonth));
		Date upMonthFirstDay = DateFuncs.valueOf(DateFuncs.getMonthFirstDay(upMonth));
		Date upMonthLastDay =  DateFuncs.addDay(DateFuncs.valueOf(DateFuncs.getMonthLastDay(upMonth)),1);
		double upMonthScore = scoreService.getAllScoreBySysUser(sysUserId, upMonthFirstDay, upMonthLastDay);
		
		JSONObject object = new JSONObject();
		object.element("sysUserId", sysUserId);
		QueryResult queryResult = scoreService.query(object.toString(), PageSettings.of(pageNo));
		
		model.put("result", result);
		model.put("queryResult", queryResult);
		model.put("sysUserId", sysUserId);
		model.put("allScore", allScore);
		model.put("currentMonthScore", currentMonthScore);
		model.put("upMonthScore", upMonthScore);
		return "/pmanager/employee/query";
	}
	
	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private FactoryService factoryService;
}
