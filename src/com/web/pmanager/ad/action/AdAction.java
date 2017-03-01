package com.web.pmanager.ad.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.View;

import pub.functions.StrFuncs;
import pub.spring.ActionResult;

import com.sys.entity.Ad;
import com.sys.service.AdService;
import com.sys.service.BaseService;
import com.web.pmanager.PManagerAction;

/**
 *
 */
@Controller
public class AdAction extends PManagerAction<Ad>{
	@Override
	public View save(HttpServletRequest request, String id) throws Exception {
		Ad ad = StrFuncs.isEmpty(id) ? adService.create() : adService.get(id);
		ad.setUserId(this.getUser(request).getId());
		this.populate(ad);
		adService.save(ad);
		return ActionResult.ok("保存成功", getActionPath() + "?op=query&loadcache=1");
	}
	@Autowired
	private AdService adService;
}
