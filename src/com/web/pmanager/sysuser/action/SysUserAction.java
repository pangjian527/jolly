package com.web.pmanager.sysuser.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.functions.CryptFuncs;
import pub.functions.StrFuncs;
import pub.spring.ActionResult;
import pub.types.IdText;

import com.sys.data.sysorganization.SysOrganizationData;
import com.sys.entity.SysUser;
import com.sys.service.SysOrganizationService;
import com.sys.service.SysRoleService;
import com.sys.service.SysUserService;
import com.web.pmanager.PManagerAction;

/**
 * 服务类型
 * @author zhangz
 *
 */
@Controller
public class SysUserAction extends PManagerAction<SysUser>{
	
	@RequestMapping
	public String showMyInfo(HttpServletRequest request, ModelMap model) throws Exception{
		//由于session登录时缓存的SysUser数据过老，还是要重新去数据库取一遍
		String id = this.getUser(request).getId();
		
		SysUser bean = sysUserService.get(id);
		
		model.put("bean", bean);

		return this.getJspFolderPath() + "/showMyInfo";
	}
	
	/**
	 * 用于系统管理员修改某个商城账号
	 */
	public String edit(HttpServletRequest request, ModelMap model, String id) throws Exception{
		//1.获取已用户已有的权限列表
		model.put("userRoles", sysRoleService.getAllByUserId(id));

		//2.将可用列表转为List<Map>，传递至页面
		model.put("roles", sysRoleService.getAll());
		
		//3.获取全部的部门列表，并转换成id-text关系
		List<IdText> organizations = new ArrayList<IdText>();
		Stack<SysOrganizationData> stack = new Stack<SysOrganizationData>();
		stack.addAll(sysOrganizationService.getDatas());
		while(!stack.empty()){
			SysOrganizationData data = stack.pop();
			organizations.add(new IdText(data.getId(), data.getName()));
			stack.addAll(data.getChilds());
		}
		model.put("organizations", organizations);
		
		//4.调用父类
		return super.edit(request, model, id);
	}
	
	public String add(HttpServletRequest request, ModelMap model) throws Exception{
		//2.将可用列表转为List<Map>，传递至页面
		model.put("roles", sysRoleService.getAll());
		
		//3.获取全部的部门列表，并转换成id-text关系
		List<IdText> organizations = new ArrayList<IdText>();
		Stack<SysOrganizationData> stack = new Stack<SysOrganizationData>();
		stack.addAll(sysOrganizationService.getDatas());
		while(!stack.empty()){
			SysOrganizationData data = stack.pop();
			organizations.add(new IdText(data.getId(), data.getName()));
			stack.addAll(data.getChilds());
		}
		model.put("organizations", organizations);
		
		//4.调用父类
		return super.add(request, model);
	}
	
	/*
	 * jmj 2015-04-29
	 * 管理员个人资料修改
	 * name:页面接收的用户名
	 * telNo:也难接收的手机号码
	 */
	@RequestMapping
	public void changeInfo(HttpServletRequest request, HttpServletResponse response,
		String name, String telNo) throws Exception{
		//1.从Session内获取 当前用户数据(只有id 确保有效)
		SysUser sessionUser = this.getUser(request);
		//2.根据id再次查询数据库  获取准确用户数据  修改用户名 和手机号码
		SysUser user = sysUserService.get(sessionUser.getId());
		user.setName(name);
		user.setTelNo(telNo);
		sysUserService.save(user);
		//3.返回保存信息 到请求页面
		this.writeJson(true);
		
	}
	
	/*
	 * jmj 2015-04-29
	 * 管理员密码信息修改
	 * oldpassword:页面接收的要修改的旧密码
	 * newpassword;页面接收的设置的新密码
	 */
	@RequestMapping
	public void changePassword(HttpServletRequest request, HttpServletResponse response,
		String oldpassword,String newpassword) throws Exception{
		//1.从Session内获取 当前用户数据(只有id 确保有效)
		SysUser sessionUser = this.getUser(request);
		//2.调用service层 比较保存  返回保存状态
		boolean flag=sysUserService.changePassword(sessionUser.getId(),oldpassword,newpassword);
		//3.判断状态  返回保存结果
		if(flag){
			this.writeJson(true);
		}else{
			this.writeErrorJson("旧密码填写错误, 请重新修改");
		}
		
	}
	/*
	 * jmj 2015-05-04
	 * 对保存扩展 数据校验功能  校验成功:保存 否则:返回失败信息
	 * id:id
	 */
	@RequestMapping
	public View save(HttpServletRequest request, String id) throws Exception{
		String[] roleIds = request.getParameterValues("roleId");
		String code = request.getParameter("code");
		String telNo = request.getParameter("telNo");
		String password = request.getParameter("password");
		
		//1.校验 账号 ,手机号码是否可用
		if(!sysUserService.indetifyCode(code, id)){
			return ActionResult.ok("账号已存在, 请重新修改", getActionPath() + "?op=query&loadcache=1");
		}
		if(!sysUserService.indetifyMobile(telNo, id)){
			return ActionResult.ok("手机号码已存在 , 请重新输入", getActionPath() + "?op=query&loadcache=1");
		}
		//2.判断是新增还是 修改 ,分别完善加密
		SysUser user = StrFuncs.isEmpty(id) ? new SysUser() : sysUserService.get(id);
		this.populate(user);
		//表单输入的密码长度如果 <32，说明是原始密码，需要转md5编码；否则password已经是 md5编码过了，无需转换
		user.setPassword(password.length() < 32 ? CryptFuncs.getMd5(password) : password);
		
		//3.保存,返回结果
		sysUserService.save(user, roleIds);
		return ActionResult.ok("保存成功", getActionPath() + "?op=query&loadcache=1");
	}

	@RequestMapping
	public View enable(HttpServletRequest request, String id) throws Exception{
		boolean success = sysUserService.enable(id, getUser(request));
		if(success){
			return ActionResult.ok("账号已启用", null);
		}
		else{
			return ActionResult.error("无效操作", null);
		}
	}
	
	@RequestMapping
	public View disable(HttpServletRequest request, String id) throws Exception{
		boolean success = sysUserService.disable(id, getUser(request));
		if(success){
			return ActionResult.ok("账号已停用", null);
		}
		else{
			return ActionResult.error("无效操作", null);
		}
	}
	
	/*
	 * jmj 2015-05-04
	 * 商城账号增加  前数据校验是否已存在
	 * code :增加账号
	 * id:id
	 */
    @RequestMapping
    public void checkCode(HttpServletResponse response, String code, String id){
    	//1.调service 验证账号是否可用 , 并返回处理数据
    	boolean success = sysUserService.indetifyCode(code, id);
    	if(!success){
    		this.writeErrorJson("该数据已存在 ,请重新输入");
    	}
    	
    }
    
    /*
     * jmj 2015-05-04
     * 商城账号增加前 校验数据是否已存在
     * telNo :增加的手机号码
     * id:id
     */
    @RequestMapping
    public void checkTelNo(HttpServletResponse response, String telNo,String id){
    	//1.调用service 验证手机号码是否被使用 , 并返回处理数据
    	boolean success = sysUserService.indetifyMobile(telNo, id);
    	if(!success){
    		this.writeErrorJson("该数据已存在 , 请重新输入");
    	}

    }
	
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysOrganizationService sysOrganizationService;
}
