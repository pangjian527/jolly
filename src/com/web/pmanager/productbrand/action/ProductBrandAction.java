package com.web.pmanager.productbrand.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import pub.functions.StrFuncs;
import pub.spring.ActionResult;

import com.sys.entity.ProductBrand;
import com.sys.service.FileService;
import com.sys.service.ProductBrandService;
import com.web.pmanager.PManagerAction;

/**
 *
 */
@Controller
public class ProductBrandAction extends PManagerAction<ProductBrand>{

	
	@RequestMapping
	public String edit(HttpServletRequest request, ModelMap model, String id) throws Exception{
		
		//List<String> attachmentIds = fileInfoService.getFileIds(ProductBrand.TABLE_NAME, id, FileInfo.TYPE_INTERNET);
		List<String> attachmentIds = fileService.getFileIds(ProductBrand.TABLE_NAME, id);
		if(attachmentIds!=null && attachmentIds.size()>0){
			String _attachmentIds = "";
			for (int i = 0; i < attachmentIds.size(); i++) {
				_attachmentIds += attachmentIds.get(i)+",";
			}
			model.put( "attachmentIds", _attachmentIds);
		}
		return super.edit(request, model, id);
	}

	@RequestMapping
	public View save(HttpServletRequest request, String id) {	
		ProductBrand productBrand = StrFuncs.isEmpty(id) ? new ProductBrand() : baseService.get(id);
		String attachmentIds = request.getParameter("attachmentIds");
		
		this.populate(productBrand);
		
		try {
			baseService.save(productBrand,attachmentIds);
			
		} catch (Exception e) {
			e.printStackTrace();			
			return ActionResult.error(e);
		}
		return ActionResult.ok("保存成功", "/pmanager/productbrand/product_brand.do?op=query&loadcache=1");
	}
	
	@Autowired
	private ProductBrandService baseService;
	@Autowired
	private FileService fileService;
}
