package com.sys.data.sysorganization;

import java.util.ArrayList;
import java.util.List;

import pub.functions.ColFuncs;

import org.apache.commons.beanutils.BeanUtils;
import com.sys.entity.SysOrganization;


public class SysOrganizationData extends SysOrganization {
	


	private List<SysOrganizationData> childs;

	public SysOrganizationData(SysOrganization sysOrganization){
		try{
			BeanUtils.copyProperties(this, sysOrganization);
			childs = new ArrayList<SysOrganizationData>();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public List<SysOrganizationData> getChilds() {
		return childs;
	}
	
	public void addChild(SysOrganizationData data){
		childs.add(data);
	}

	
}
