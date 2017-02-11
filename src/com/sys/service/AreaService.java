package com.sys.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.functions.StrFuncs;
import pub.types.IdText;

import com.sys.dao.AreaDao;
import com.sys.entity.Area;


@Service
@Transactional(readOnly = true)
public class AreaService {
	
	public Area get(String id){
		return areaDao.get(id);
	}
	
	public List<IdText> queryByParentId(String id){
		return areaDao.queryByParentId(id);
	}

	//自己用不到别注释啊 
	public List<Area> queryProvince(){
		List<Area> result = new ArrayList<Area>();
		
		return result ;
	}
	
	public List<Area> getAllByParentId(String parentId){
		return areaDao.getAllByProperty("parentId", parentId);
	}
	
	public Area getByCode(String code){
		return areaDao.getByCode(code);
	}
	/**
	 * myq add @2015-01-24，根据省、市、区id，自动识别出对应的地区全称
	 */
	public Area get(String provinceId, String cityId, String countryId){
		if(StrFuncs.notEmpty(countryId)){
			return get(countryId);
		}
		else if(StrFuncs.notEmpty(cityId)){
			return get(cityId);
		}
		else if(StrFuncs.notEmpty(provinceId)){
			return get(provinceId);
		}
		else{
			return null;
		}
	}
	
	public Area getParentById(String id){
		return areaDao.getParentById(id);
	}
	
	/*
	 * 根据名称获取到区域
	 */
	public Area getByName(String name){
		return areaDao.getByName(name);
	}
	
	public Area getByLikeName(String name){
		return areaDao.getByLikeName(name);
	}
	
	/*
	 * 获取
	 */
	public List<IdText> getAllActiveProvince() {
		List<Area> areas = this.getAllByParentId(Area.PROVICE_PARENT_ID);
//		List<Area> provinces=new ArrayList<Area>();
//		for (Area area : areas) {
//			if (!"3098".equals(area.getId()) && !"3308".equals(area.getId())
//					&& !"3421".equals(area.getId())
//					&& !"3474".equals(area.getId())
//					&& !"3506".equals(area.getId())) {
//				provinces.add(area);
//			}
//		}
		
		Iterator<Area> it = areas.iterator();  
		while(it.hasNext()) {  
			Area area=it.next();
			if ("3098".equals(area.getId()) || "3308".equals(area.getId())
					|| "3421".equals(area.getId())
					|| "3474".equals(area.getId())
					|| "3506".equals(area.getId())) {
				it.remove();
			}
		}  
		
		return IdText.valueOf(areas, "id", "name");
	}
	
	/**
	 */
	public List<String> getAreaNamesByIds(String ids){
		if(StrFuncs.isEmpty(ids)){
			return null;
		}
		String areaIds[] = ids.split(",");
		//存储按照productTypeId查出来的每个name(按逗号拼接)
		List<String> areaNames = new ArrayList<String>();
		for (int j = 0; j < areaIds.length; j++) {
			String aeraId = areaIds[j];
			Area area = get(aeraId);
			if(area!=null){
				areaNames.add(area.getName());
			}
		}
		return areaNames;
	}
	
	@Autowired
	private AreaDao areaDao;
}
