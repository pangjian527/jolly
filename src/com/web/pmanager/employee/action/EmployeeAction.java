package com.web.pmanager.employee.action;

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

import com.sys.entity.Product;
import com.sys.entity.Score;
import com.sys.entity.SysUser;
import com.sys.service.ScoreService;
import com.sys.service.SysUserService;
import com.web.pmanager.PManagerAction;

@Controller
public class EmployeeAction extends PManagerAction<Score>{

	@RequestMapping
	public String execute(HttpServletRequest request,  ModelMap model,String sysUserId){
		
		int pageNo=this.getIntegerParam("pn", 1);
		
		List<SysUser> sysUserList = sysUserService.getAll();
		
		List<SysUser> result = new LinkedList<SysUser>();
		for (SysUser sysUser : sysUserList) {
			if(!sysUser.getOrganizationId().equals("channel"))
				continue;
			result.add(sysUser);
		}
		
		if(sysUserId == null && !result.isEmpty()){
			sysUserId =result.get(0).getId();
		}
		
		int allScore = scoreService.getAllScore(sysUserId, null, null);
		
		JSONObject object = new JSONObject();
		object.element("sysUserId", sysUserId);
		
		QueryResult queryResult = scoreService.query(object.toString(), PageSettings.of(pageNo));
		
		model.put("result", result);
		model.put("queryResult", queryResult);
		model.put("sysUserId", sysUserId);
		model.put("allScore", allScore);
		return "/pmanager/employee/query";
	}
	
	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private ScoreService scoreService;
}
