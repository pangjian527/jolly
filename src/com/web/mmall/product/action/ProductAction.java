package com.web.mmall.product.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.StrFuncs;

import com.sys.entity.Ad;
import com.sys.entity.Area;
import com.sys.entity.ExpressFee;
import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.entity.Product;
import com.sys.service.AdService;
import com.sys.service.AreaService;
import com.sys.service.BookformDetailService;
import com.sys.service.ExpressFeeService;
import com.sys.service.FactoryService;
import com.sys.service.ProductService;
import com.web.mmall.MMallActon;
import com.web.mmall.consts.Consts;
import com.web.mmall.entity.ProductEntity;
import com.wxpay.util.WXConfigUtil;

@Controller
public class ProductAction extends MMallActon{
	@RequestMapping
	public String execute(HttpServletRequest request,HttpServletResponse response){
		List<Product> lists = productService.getAllByStatus(Product.STATUS_VALID);
		
		List<ProductEntity> entityResult = new ArrayList<ProductEntity>();
		for (Product product : lists) {
			ProductEntity entity = new ProductEntity();
			BeanUtils.copyProperties(product, entity);
			
			int realSalesCount = bookformDetailService.getCountByProductId(product.getId());
			entity.setRealSalesCount(realSalesCount);
			entityResult.add(entity);
		}
		
		Object object = request.getSession().getAttribute(Consts.FACTORY_USER_SESSION_KEY);
		
		if(object == null){
			request.setAttribute("islogin", false);
		}else{
			request.setAttribute("islogin", true);
		}
		
		//查询广告数据 
		List<Ad> adList = adService.getActiveAd();
		
		WXConfigUtil.createWXConfigParam(request);
		request.setAttribute("lists", entityResult);
		request.setAttribute("adList", adList);
		return "/mmall/product/list";
	}
	
	@RequestMapping
	public String viewDetail(HttpServletRequest request,HttpServletResponse response,String productId){
		Product product = productService.get(productId);
		request.setAttribute("product", product);
		request.setAttribute("productPhotoIds", this.SplitToList(product.getPhotoIds()));
		request.setAttribute("contentPhotoIds", this.SplitToList(product.getContentPhotoIds()));
		
		List<ExpressFee> expressFeeList = expressFeeService.getAll();
		ExpressFee expressFee = expressFeeList.size()==0?null:expressFeeList.get(0);
		request.setAttribute("expressFee", expressFee);
		
		FactoryUser user = this.getUser();
		if(user!=null){
			Factory factory = factoryService.get(user.getFactoryId());
			Area area = areaService.get(factory.getCountyId());
			request.setAttribute("area", area);
		}
		
		return "/mmall/product/detail";
	}
	
	public List<String> SplitToList(String imgIds){
		if(StrFuncs.notEmpty(imgIds)){
			return Arrays.asList(imgIds.split(","));
		}else{
			return new ArrayList<String>();
		}
	}
	@Autowired
	private ProductService productService;
	@Autowired
	private BookformDetailService bookformDetailService;
	@Autowired
	private ExpressFeeService expressFeeService;
	@Autowired
	private AreaService areaService;
	@Autowired 
	private FactoryService factoryService;
	@Autowired
	private AdService adService;
}
