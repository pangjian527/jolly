package com.web.pmanager.login.action;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.CryptFuncs;
import pub.functions.JsonFuncs;


import com.sys.entity.SysModule;
import com.sys.entity.SysNavTree;
import com.sys.entity.SysUser;
import com.sys.service.SysUserService;
import com.web.pmanager.PMallAction;
import com.web.pmanager.consts.Consts;

/**
 * 后台登录验证
 * @author zhangz
 *
 */
@Controller
public class LoginAction extends PMallAction{
	
	@RequestMapping
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {

		String code = this.getParam("code");
		String password = this.getParam("password");
		
		try {
			if(code == null){
				return "/pmanager/login/login";
			}
			SysUser user = sysUserService.login(code, CryptFuncs.getMd5(password));	
			
			request.setAttribute("ip", request.getRemoteAddr());
			request.setAttribute("host", request.getRemoteHost());
			request.setAttribute("now", new Date());
			String userName = user.getName();
			request.setAttribute("userName", userName);
			
			request.getSession().setAttribute(Consts.USER_SESSION_KEY, user);
			
			String userId = user.getId();
			// 查找出用户可访问的数组列表
			List<SysNavTree> menus = sysUserService.getNavTrees(userId);
			request.setAttribute("menus", JsonFuncs.toJson(menus));
			
			// 查找出用户的全部权限列表，并在session中缓存，以便后续调用
			List<SysModule> modules = sysUserService.getModules(userId);
			Set<String> moduleCodes = new HashSet<String>();
			for(SysModule module : modules){
				moduleCodes.add(module.getCode());
			}
			request.getSession().setAttribute("MODULE_CODES", moduleCodes);
			
			String remember = this.getParam("rememberMe");
			
			if ("1".equals(remember)) {
				this.setCookie("user_code", code);
				this.setCookie("user_pwd_md5", password);
				this.setCookie("remember_me", remember);
			} 
			else {
				this.removeCookie("user_code");
				this.removeCookie("user_pwd_md5");
				this.removeCookie("remember_me");
			}
			
			return "/pmanager/login/main";
		}
		catch (Throwable e) {
			request.setAttribute("name", code);
			request.setAttribute("errorInfo", "错误："+e.getMessage());
			return "/pmanager/login/login";
		}
	}
	
	@RequestMapping
	public String loginout(HttpServletRequest request, HttpServletResponse response)throws Exception {
		request.getSession().invalidate();
		return "/pmanager/login/login";
	}
	
	@Autowired
	private SysUserService sysUserService;
}
