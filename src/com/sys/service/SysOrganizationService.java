package com.sys.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;

import com.sys.dao.SysOrganizationDao;
import com.sys.data.sysorganization.SysOrganizationData;
import com.sys.entity.SysOrganization;


@Service("sysOrganizationService")
@Transactional(readOnly = true)
public class SysOrganizationService extends BaseService<SysOrganization>{
/*	public List<SysOrganizationData> getOrganizationTree(String parentId) {
		List<SysOrganization> organizations = sysOrganizationDao
				.getAllByParentId(parentId);

		List<SysOrganizationData> result = SysOrganizationData
				.valueOf(organizations);
		for (SysOrganizationData organization : result) {

			List<SysOrganizationData> childDatas = this
					.getOrganizationTree(organization.getId());

			if (ColFuncs.notEmpty(childDatas)) {
				organization.setChilds(childDatas);
			}

		}
		return result;
	}
	*/
	public List<SysOrganizationData> getDatas() {
		List<SysOrganizationData> result = new ArrayList<SysOrganizationData>();
		List<SysOrganization> organizations = sysOrganizationDao.getAll();
		for(SysOrganization organization : organizations){
			if(StrFuncs.isEmpty(organization.getParentId())){
				SysOrganizationData data = getData(organization, organizations);
				result.add(data);
			}
		}
		return result;
	}
	
	private SysOrganizationData getData(SysOrganization organization, List<SysOrganization> organizations){
		SysOrganizationData result = new SysOrganizationData(organization);
		String id = organization.getId();
		for(SysOrganization target: organizations){
			if(id.equals(target.getParentId())){
				SysOrganizationData childData = getData(target, organizations);
				result.addChild(childData);
			}
		}
		return result;
	}
	

/*	protected HibernateDao<SysOrganization> getBaseDao(){
		return sysOrganizationDao;
	}*/
	
/*	public SysOrganization create(){
		return new SysOrganization();
	}*/
	public QueryResult query(String condition, QuerySettings settings){
		return null;
	}
	@Autowired
	private SysOrganizationDao sysOrganizationDao;
}
