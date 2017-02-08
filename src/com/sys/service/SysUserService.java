package com.sys.service;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.ColFuncs;
import pub.functions.CryptFuncs;
import pub.functions.StrFuncs;
import pub.types.ValidationError;

import com.sys.dao.SysModuleDao;
import com.sys.dao.SysNavTreeDao;
import com.sys.dao.SysUserDao;
import com.sys.dao.SysUserRoleDao;
import com.sys.entity.SysModule;
import com.sys.entity.SysNavTree;
import com.sys.entity.SysUser;

@Service("sysUserService")
@Transactional(readOnly = true)
public class SysUserService extends BaseService<SysUser>{

	public SysUser login(String text, String password) {
		SysUser user = sysUserDao.getByCodeOrTel(text);
		if (user == null) {
			throw new ValidationError("账号不存在");
		}
		if(user.getStatus() == 0){
			throw new ValidationError("账号未启用");
		}
		if(user.getStatus() == -1){
			throw new ValidationError("账号已被禁用");
		}
		if (!StrFuncs.equalsIgnoreNullAndCase(user.getPassword(), password)) {
			throw new ValidationError("密码无效");
		}
		return user;
	}
	
	public List<SysNavTree> getNavTrees(String userId){
		//1.调用
		return sysNavTreeDao.getAllByUserId(userId);
	}
	
	public List<SysModule> getModules(String userId){
		return sysModuleDao.getAllByUserId(userId);
	}
	
	@Transactional
	public void save(SysUser user, String[] roleIds) throws Exception{
		sysUserDao.save(user);
		sysUserRoleDao.saveRelations(user.getId(), "userId", roleIds, "roleId");
	}
	
	@Transactional
	public boolean enable(String id, SysUser user){
		SysUser sysUser = get(id);
		if(sysUser == null || sysUser.getStatus() != 0 || user == null){
			return false;
		}
		sysUser.setStatus(1);
		sysUserDao.save(sysUser);
		return true;
	}
	
	@Transactional
	public boolean disable(String id, SysUser user){
		SysUser sysUser = get(id);
		if(sysUser == null || sysUser.getStatus() != 1 || user == null){
			return false;
		}
		sysUser.setStatus(0);
		sysUserDao.save(sysUser);
		return true;
	}

	public QueryResult query(String condition, QuerySettings settings){
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		
		Query query = new PagedQuery(settings);
		
		StringBuilder where = new StringBuilder();
		where.append( " 1=1");
		
		this.addQueryLikeFilter(queryJson, where, query, "user", 
			" and (t.name like :user or t.tel_no like :user or t.code like :user)");
		this.addQueryLikeFilter(queryJson, where, query, "orgName", 
				" and o.name like :orgName");
		this.addQueryEqualFilter(queryJson, where, query, "status", " and t.status = :status ");
		
		query.select( " t.*, o.name org_name ").
				from(" sys_user t left join sys_organization o on o.id = t.organization_id ").
				where(where.toString()).
				orderBy(" t.create_time desc ");	
		
		generalDao.execute(query);
		return query.getResult();
	}
	/*
	 * jmj 2015-04-29
	 * 管理会员账户修改
	 * id:id
	 * oldpassword:从action接收的要修改的旧密码
	 * newpassword;从action页面接收的设置的新密码
	 */
	@Transactional
	public boolean changePassword(String id, String oldpassword,String newpassword) {
		//1.根据id获取用户数据  
		SysUser user = this.get(id);
		//2.把页面传输的旧密码使用md5加密 并重数据库获取原始密码
		oldpassword = CryptFuncs.getMd5(oldpassword);
		String password=user.getPassword();
		//3.把加密过的旧密码 与获取的原始密码进行比较  符合 就把新密码使用md5 加密 并保存  及返回保存状态
		if(oldpassword.equals(password)){
			newpassword = CryptFuncs.getMd5(newpassword);
			user.setPassword(newpassword);
			sysUserDao.save(user);
			return true;
		}else{
			return false;
		}
		
	}
	
	public List<SysUser> getAll() {		
		return sysUserDao.getAll("code");
	}

	/*
	 * jmj 2015-05-04
	 * 校验商城新增账户 的资料是否存在
	 * code:所要校验的字段
	 * sysUserId :id
	 */
	public boolean indetifyCode(String code, String id) {
		//1.根据参数查询出是否存在相同的 数据,若存在该条数据 属不属于自己 并返回
		List<SysUser> beans = sysUserDao.getAllByProperty("code", code);
		if(ColFuncs.isEmpty(beans)){
			return true;
		}else{
			SysUser bean = beans.get(0);
			return bean.getId().equals(id);
		}
	}
	/*
	 * jmj 2015-05-04
	 * 校验商城新增账户 的资料是否存在
	 * telNo:所要校验的字段
	 * sysUserId :id
	 */
	public boolean indetifyMobile(String telNo, String id) {
		//1.根据参数查询出是否存在相同的 数据,若存在该条数据 属不属于自己 并返回
		List<SysUser> beans = sysUserDao.getAllByProperty("tel_no", telNo);
		if(ColFuncs.isEmpty(beans)){
			return true;
		}
		else{
			SysUser bean = beans.get(0);
			return bean.getId().equals(id);
		}
	}
	
	
	@Autowired
	GeneralDao generalDao;
	@Autowired
	private SysUserDao sysUserDao;
	@Autowired
	SysNavTreeDao sysNavTreeDao;
	@Autowired
	SysModuleDao sysModuleDao;
	@Autowired
	SysUserRoleDao sysUserRoleDao;

}
