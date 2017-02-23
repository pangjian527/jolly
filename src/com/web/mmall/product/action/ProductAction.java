package com.web.mmall.product.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.entity.Product;
import com.sys.service.BookformDetailService;
import com.sys.service.ProductService;
import com.web.mmall.entity.ProductEntity;
import com.web.pmanager.PManagerAction;

@Controller
public class ProductAction extends PManagerAction<Product>{
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
		
		request.setAttribute("lists", entityResult);
		return "/mmall/product/list";
	}
	
	@RequestMapping
	public String viewDetail(HttpServletRequest request,HttpServletResponse response,String productId){
		Product product = productService.get(productId);
		request.setAttribute("product", product);
		return "/mmall/product/detail";
	}
	
	@Autowired
	private ProductService productService;
	@Autowired
	private BookformDetailService bookformDetailService;
	

}
