package com.sys.data.cart;

import java.io.Serializable;
import java.util.List;

import com.sys.entity.Product;

public class CartItem implements Serializable {

	private static final long serialVersionUID = 8775559777625940729L;
	
	
	private String productId;
	
	private String productName;
	
	private Double price;
	
	private Double priceMart;
	//
	private String imageId;
	
	private int count = 1;
	
	private Integer stock;//库存
	
	//状态；0:无效； 1:有效；2 待审核
	private Integer status;
	
	//对应商品最高销售量
	private Integer countMax;
	
	public CartItem(){
		
	}
	
	public void copyProperties(Product product){
		
		this.price = product.getPrice();
		this.priceMart = product.getPriceMart();
		this.productId = product.getId();
		this.productName = product.getName();
		this.status = product.getStatus();
		List<String> images = product.imgIds();
		this.imageId =  images.size() > 0 ? images.get(0) : "0";
	}
	
	public Integer getStatus(){
		//对于有效状态的商品，如果库存为0了，一样不能购买
		if(this.status!=null&&this.status == 1 && this.getCount() <= 0){
			return -1;
		}
		return status;
	}

/*	public void setStatus(Integer status) {
		this.status = status;
	}*/

	public int getCount() {
		int result = this.count;
		if(this.countMax != null && result > this.countMax){
			result = countMax;
		}
		if(this.stock != null && result > this.stock){
			result = this.stock;
		}
		return result;
	}

	public void setCount(int count) {
		this.count = count;
/*		if(this.countMax != null && count > this.countMax){
			this.count = this.countMax;
		}
		else if(count < 1){
			this.count = 1;
		}
		else{
			this.count = count;
		}*/
	}
	
	public void addCount(int count) {
		
		int nextCount = this.count + count;
		this.count = nextCount;
		
		/*if(this.countMax != null && nextCount > this.countMax){
			this.count = this.countMax;
		}
		else if(nextCount < 1){
			this.count = 1;
		}
		else{
			this.count = nextCount;
		}*/
	}
	
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}


	public String getImageId() {
		return imageId;
	}

	public Double getPrice() {
		return price;
	}
	
	public Double getPriceMart() {
		return priceMart;
	}


	public Integer getCountMax() {
		return countMax;
	}

	
	public Integer getStock() {
		return this.stock;
	}

	

}
