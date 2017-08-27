package com.sys.service;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;

import com.sys.dao.ProductBrandDao;
import com.sys.entity.ProductBrand;

/**
 * 
 * @author zhangz
 *
 */
@Service
@Transactional(readOnly = true)
public class ProductBrandService  extends BaseService<ProductBrand>{

	public QueryResult query(String condition, QuerySettings settings) {
		
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		Query query = new PagedQuery(settings);
		
		StringBuilder where = new StringBuilder(" status=1 ");
		
		this.addQueryLikeFilter(queryJson, where, query, "name", 
			" and t.name like :name");
		
		query.select( " t.*").from(" T_PRODUCT_BRAND t").
					where(where.toString()).orderBy(" t.create_time desc ");	
		generalDao.execute(query);
		return query.getResult();
	}
	
	public List<ProductBrand> getAll(){
		return productBrandDao.getAll(ProductBrand.STATUS_VALID);
	}
	
	@Transactional
	public void save(ProductBrand productBrand, String fileId) throws Exception{
		//1.保存bean
		productBrandDao.save( productBrand);
		
		if(StrFuncs.notEmpty(fileId)){
			//2.更新关联的图片附件
			fileService.setFile(ProductBrand.TABLE_NAME, productBrand.getId(), fileId);
		}
	}

	@Transactional
	public void delete( String id){
		ProductBrand check = productBrandDao.get( id);
		if( check!=null){
			check.setStatus(0);
			productBrandDao.save(check);
		}
	}
	

	@Autowired
	private ProductBrandDao productBrandDao;
	//@Autowired
	//FactoryBrandRelDao factoryBrandRelDao;
	@Autowired
	private GeneralDao generalDao;
	@Autowired
	private FileService fileService;
}
