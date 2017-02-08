package com.web.pmanager.data;

import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.commons.beanutils.BeanUtils;
import com.sys.entity.SysModule;
import pub.functions.ColFuncs;

public class SysModuleData extends SysModule {

	private List<SysModuleData> childs;
	
	public SysModuleData(SysModule sysModule){
		try{
			BeanUtils.copyProperties(this, sysModule);
			childs = new ArrayList<SysModuleData>();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public List<SysModuleData> getChilds() {
		return childs;
	}
	
	public void addChild(SysModuleData childData){
		childs.add(childData);
	}
}

