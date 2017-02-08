package com.web.pmanager.sysrole.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.functions.JsonFuncs;
import pub.functions.StrFuncs;
import pub.spring.ActionResult;

import com.sys.entity.SysRole;
import com.sys.service.SysRoleService;
import com.web.pmanager.PManagerAction;
import com.web.pmanager.data.SysModuleData;


/**
 * 服务类型
 * @author zhangz
 *
 */

@Controller
public class SysRoleAction extends PManagerAction<SysRole>{
	public String edit(HttpServletRequest request, ModelMap model, String id) throws Exception{		
		//@2 获取所有权限
		List<SysModuleData> modules = sysRoleService.getDatas();
		request.setAttribute("modules", JsonFuncs.toJson(modules));
		
		/*
		//@3 拿到当前角色对应的权限列表*/
		List<String> ids = sysRoleService.getSysModuleIds(id);
		request.setAttribute("selectedIds", JSONArray.fromObject(ids));
		
		return super.edit(request, model, id);
	}
	
	public String add(HttpServletRequest request, ModelMap model) throws Exception{
		//@2 获取所有权限
		List<SysModuleData> modules = sysRoleService.getDatas();
		request.setAttribute("modules", JsonFuncs.toJson(modules));
		request.setAttribute("selectedIds", "[]");
		
		return super.add(request, model);
	}

	public View save(HttpServletRequest request, String id) throws Exception{
		String[] moduleIds = request.getParameterValues("moduleId");
		//1.获取基本表的属性
		SysRole sysRole = StrFuncs.isEmpty(id) ? new SysRole() : sysRoleService.get(id);
		this.populate(sysRole);
		
		sysRoleService.save(sysRole, moduleIds);
		
		//3.返回
		return ActionResult.ok("保存成功", getActionPath() + "?op=query&loadcache=1");
	}

	@RequestMapping
	public View delete(HttpServletRequest request, String id) throws Exception{
		boolean success = sysRoleService.delete(id, this.getUser(request));
		if(success){
			return ActionResult.ok("删除成功", null);
		}
		else{
			return ActionResult.error("非法数据操作，请确认该权限", null);
		}
	}
	
	@Autowired
	private SysRoleService sysRoleService;
}
