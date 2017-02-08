package com.sys.service;

import java.util.ArrayList;
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
import pub.functions.StrFuncs;

import com.sys.dao.SysModuleDao;
import com.sys.dao.SysModuleRoleDao;
import com.sys.dao.SysRoleDao;
import com.sys.dao.SysUserRoleDao;
import com.sys.entity.SysModule;
import com.sys.entity.SysModuleRole;
import com.sys.entity.SysRole;
import com.sys.entity.SysUser;
import com.sys.entity.SysUserRole;
import com.web.pmanager.data.SysModuleData;

@Service("sysNavTreeService")
@Transactional(readOnly = true)
public class SysRoleService extends BaseService<SysRole>{
	
	public List<SysRole> getAll(){
		return sysRoleDao.getAll();
	}
	
	public List<SysRole> getAllByUserId(String userId){
		return sysRoleDao.getAllByUserId(userId);
	}
	
/*	protected HibernateDao<SysRole> getBaseDao(){
		return sysRoleDao;
	}*/
	
/*	public SysRole create(){
		return new SysRole();
	}*/
	public QueryResult query(String condition, QuerySettings settings){
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		
		Query query = new PagedQuery(settings);
		
		StringBuilder where = new StringBuilder();
		where.append( " 1=1");
		
		this.addQueryLikeFilter(queryJson, where, query, "name", 
			" and t.name like :name");
		this.addQueryLikeFilter(queryJson, where, query, "code", 
				" and t.name like :code");
		
		query.select( " t.*").
				from(" sys_role t ").
				where(where.toString());	
		
		generalDao.execute(query);
		return query.getResult();
	}
	
	public List<SysModuleData> getDatas(){
		List<SysModuleData> result = new ArrayList<SysModuleData>();
		
		List<SysModule> modules = sysModuleDao.getAll();
		for(SysModule module : modules){
			if(StrFuncs.isEmpty(module.getParentId())){
				SysModuleData data = getData(module, modules);
				result.add(data);
			}
		}
		
		return result;
	}
	
	private SysModuleData getData(SysModule module, List<SysModule> modules){
		SysModuleData result = new SysModuleData(module);
		String id = module.getId();
		for(SysModule target: modules){
			if(id.equals(target.getParentId())){
				SysModuleData childData = getData(target, modules);
				result.addChild(childData);
			}
		}
		return result;
	}
	
	@Transactional
	public boolean delete(String id, SysUser user){
		//0.校验
		SysRole sysRole = get(id);
		List<SysUserRole> userRoles = sysUserRoleDao.getAllByRoleId(id);
		if(sysRole == null || user == null || ColFuncs.notEmpty(userRoles)){
			return false;
		}
		
		//1.删除关联的sys_module_role
		sysModuleRoleDao.deleteAllByRoleId(id);
		
		//2.删除自身
		sysRoleDao.delete(id);
		
		return true;
	}
/*	private List<SysModuleData> getSysModuleDatas(String parentId) {
		List<SysModule> sysModules = sysModuleDao.getAllByParentId(parentId);

		List<SysModuleData> result = SysModuleData.valueOf(sysModules);
		for (SysModuleData sysModuleData : result) {

			List<SysModuleData> childDatas = this.getSysModuleDatas(sysModuleData.getId());

			if (ColFuncs.notEmpty(childDatas)) {
				sysModuleData.setChilds(childDatas);
			}
		}
		return result;
	}*/
	
/*	public void addModulesInRole(String roleId, String[] addModuleIds){
		for(String moduleId : addModuleIds) {
			SysModuleRole moduleRole = new SysModuleRole();
			moduleRole.setRoleId(roleId);
			moduleRole.setModuleId(moduleId);
			sysModuleRoleDao.save(moduleRole);
		}
	}*/
	
	@Transactional
	public void save(SysRole sysRole, String[] moduleIds) throws Exception{
		//1.保存bean
		sysRoleDao.save(sysRole);
		//2.保存 sysRole与sysModel的关联关系
		sysModuleRoleDao.saveRelations(sysRole.getId(),"roleId", moduleIds, "moduleId");
	}
	
	@Transactional
	public void delete(String id){
		sysModuleRoleDao.deleteAllByRoleId(id);
		sysRoleDao.delete(id);
	}
	
	public List<String> getSysModuleIds(String roleId){
		List<SysModuleRole> moduleRoles = sysModuleRoleDao.getAllByProperty("roleId", roleId);
		List<String> result = new ArrayList<String>();
		for(SysModuleRole moduleRole : moduleRoles){
			result.add(moduleRole.getModuleId());
		}
		return result;
	}
	
	@Autowired
	private SysRoleDao sysRoleDao;
	@Autowired
	private SysUserRoleDao sysUserRoleDao;
	@Autowired
	private SysModuleDao sysModuleDao;
	@Autowired
	private SysModuleRoleDao sysModuleRoleDao;
	@Autowired
	private GeneralDao generalDao;
}
