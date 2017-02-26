package com.web.pmanager.order.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.spring.ActionResult;

import com.sys.data.book.BookformData;
import com.sys.entity.Bookform;
import com.sys.service.AreaService;
import com.sys.service.BookformService;
import com.sys.service.FactoryService;
import com.sys.service.SysUserService;
import com.web.pmanager.PManagerAction;

/**
 * 订单数据
 * @author zhangz
 *
 */
@Controller
public class BookformAction extends PManagerAction<Bookform>{ 
	
	public View delete(HttpServletRequest request, String id) throws Exception{
		return ActionResult.error("非法数据操作", null);
	}
	
	/**
	 * 查看订单详情
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping
	public String view(HttpServletRequest request, ModelMap model, String id)throws Exception {
		
		BookformData bookformData = baseService.getData(id);
		model.put("data", bookformData);
		model.put("nowDate", new Date());
		return "/pmanager/order/view";
	}
	
	@RequestMapping
	public View disable(HttpServletRequest request, ModelMap model, String id)throws Exception {
		String reason = request.getParameter("reason");
		boolean success = baseService.disable(id, getUser(request), reason);
		if(success){
			return ActionResult.ok("订单已被取消！", null);
		}
		else{
			return ActionResult.error("无效操作", null);
		}
	}
	
	
	/**
	 * 保存发货信息
	 * @param request
	 * @param model
	 * @param bookformId
	 * @param deliveryName
	 * @param deliveryNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping
	public void deliver(HttpServletRequest request, HttpServletResponse response,
			String id, String deliveryFactory, String trackingNumber)throws Exception {
		
		boolean success = baseService.deliver(id, deliveryFactory, trackingNumber, this.getUser(request));
		if(success){
			this.writeJson(true);
		}
		else{
			this.writeErrorJson("非法数据操作，请求被拒绝");
		}
		
	}
	
	
	
	
	@Autowired
	public BookformService baseService;
	@Autowired
	public SysUserService sysUserService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private FactoryService factoryService;
	
}
