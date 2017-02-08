package com.web.pmanager.sysorganization.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.entity.SysOrganization;
import com.sys.service.BaseService;
import com.sys.service.SysOrganizationService;
import com.web.pmanager.PManagerAction;

/**
 * 服务类型
 * @author zhangz
 *
 */

@Controller
public class SysOrganizationAction extends PManagerAction<SysOrganization>{
	
	@RequestMapping
	public String list(HttpServletRequest request, ModelMap model) throws Exception{
		//由于session登录时缓存的SysUser数据过老，还是要重新去数据库取一遍
		List datas = sysOrganizationService.getDatas();
		model.put("datas", JSONArray.fromObject(datas));
		return getJspFolderPath() + "/list";
	}
	
	@Autowired
	private SysOrganizationService sysOrganizationService;
	
}

