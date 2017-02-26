package com.web.mmall.area.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.types.IdText;

import com.sys.service.AreaService;
import com.web.mmall.MMallActon;

/*
 * 
 */
@Controller
public class AreaAction  extends MMallActon{

	@RequestMapping
	public String getAreas(HttpServletRequest request,HttpServletResponse response, String parentId) throws Exception{
		try {
			List<IdText> areas = areaService.queryByParentId(parentId);
			
			this.writeJson(areas);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@Autowired
	private AreaService areaService;

}
