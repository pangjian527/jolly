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

import com.sys.dao.FactoryDao;
import com.sys.entity.Factory;
import com.sys.entity.ProfitConfig;
import com.sys.entity.Score;
import com.sys.entity.SysUser;

/**
 * 服务商家
 * @author Administrator
 *
 */
@Service
@Transactional(readOnly = true)
public class FactoryService extends BaseService<Factory>{

	/**
	 * 组合分页的查询结果
	 * @param queryData
	 * @param settings
	 * @return
	 */
	public QueryResult query(String condition,QuerySettings settings){
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		Query query = new PagedQuery(settings);
		StringBuffer select = new StringBuffer(" f.*,a.full_name as areaname ,(select name from t_factory where id= f.referee_id) referee_name "
				+ " ,(select name from SYS_USER where id= f.sys_user_id) sys_user_name");
		StringBuilder where = new StringBuilder(" 1=1 ");
		StringBuilder orderBy = new StringBuilder();

		this.addQueryEqualFilter(queryJson, where, query, "id",
				" and f.id = :id");
		this.addQueryEqualFilter(queryJson, where, query, "status",
				" and f.status = :status");
		this.addQueryLikeFilter(queryJson, where, query, "name",
				" and f.name like :name");
		this.addQueryLikeFilter(queryJson, where, query, "search",
				" and f.name like:search");
		this.addQueryLikeFilter(queryJson, where, query, "mobile",
				" and f.mobile like :mobile");
		this.addQueryEqualFilter(queryJson, where, query, "refereeId",
				" and f.referee_id = :refereeId");

		query.select(select.toString()).from(
				" t_factory f left join t_area a on f.county_id=a.id ").where(
				where.toString()).orderBy(" f.update_time desc ");
		generalDao.execute(query);
		return query.getResult();
	}
	
	@Transactional
	public boolean saveGps(String id, Double x, Double y, SysUser user) throws Exception{
		//1.验证操作合法性
		Factory factory = get(id);
		if(factory == null || factory.getStatus() == Factory.STATUS_OUT_OF_STOCK || user == null){
			return false;
		}
		
		//2.执行操作
		factory.setGpsX(x);
		factory.setGpsY(y);
		
		factoryDao.save(factory);
		
		return true;
	}
	
	@Transactional
	public void saveFactoryAndCreateFactoryUser(Factory factory,String password) throws Exception {
		
		ProfitConfig profitConfig = profitConfigService.getProfitConfigStatus();
		
		String describe = factory.getMobile() + "注册所得积分";
		if(StrFuncs.notEmpty(factory.getSysUserId()) && profitConfig !=null){
			//开店，地推积分
			scoreService.sysUserScore(profitConfig.getPushDirectOpenFactory(), factory.getId(), describe, factory.getSysUserId());
		}else if(StrFuncs.notEmpty(factory.getRefereeId()) && profitConfig !=null){
			//门店推荐开店，推荐的门店的积分
			Factory parentFactory = factoryDao.get(factory.getRefereeId());
			//找到父节点的sys_user增加积分
			scoreService.sysUserScore(profitConfig.getPushIndirectOpenFactory(), factory.getId(), describe, parentFactory.getSysUserId());
			factory.setSysUserId(parentFactory.getSysUserId());
		}
		
		this.save(factory);
		factoryUserService.addFactoryUser(factory.getMobile(), password, factory.getId());
	}
	
	@Transactional
	public void save(Factory factory){
		if(StrFuncs.isEmpty(factory.getId())){
			factory.setStatus(Factory.STATUS_DRAFT);  //草稿状态
		}
		//factory.setUpdateTime(new Date());
		factoryDao.save(factory);
		
	}
	
	@Transactional
	public boolean delete(String id, SysUser user) throws Exception{
		//1.验证操作合法性
		Factory factory = get(id);
		Integer oldStatus = factory.getStatus();
		if(factory == null || oldStatus == Factory.STATUS_INVALID || user == null){
			return false;
		}
		
		//2.执行操作
		factory.setStatus(Factory.STATUS_INVALID);
		factoryDao.save(factory);
		
		return true;
	}
	/**
	 * 上架
	 * 
	 * zhb 2015-05-06
	 * 增加了第2步停用词检查，检查广告语和简介
	 * 
	 * jmj 2015-05-20
	 * 扩展审核功能 实体类新定义了 状态码常量, 修改旧状态码
	 */
	@Transactional
	public boolean submit(String id, SysUser user) throws Exception{
		//1.验证操作合法性
		Factory factory = get(id);
		Integer oldStatus = factory.getStatus();
		if(factory == null || user == null){
			return false;
		}
		//2.若状态码不为 草稿 或 下架状态 不准申请上架
		if(oldStatus == Factory.STATUS_DRAFT || oldStatus ==Factory.STATUS_OUT_OF_STOCK ){
		}else{
			return false;
		}
		
		//4.执行操作
		factory.setStatus(Factory.STATUS_VALID);
		factoryDao.save(factory);
		
		return true;
	}
	
	/**
	 * jmj 2015-05-20
	 * 批准上架开业
	 * @param id
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public boolean confirm(String id, SysUser user) throws Exception{
		//1.验证操作合法性
		Factory factory = get(id);
		Integer oldStatus = factory.getStatus();
		if(factory == null || oldStatus != Factory.STATUS_APPROVE|| user == null){
			return false;
		}
//		//2.进行停用词检查，简介可能为空
//		if(stopWordService.test(factory.getCharacteristic())!=null&&
//				stopWordService.test(factory.getCharacteristic()).size() != 0){
//			return false;
//		}else if(factory.getIntroduction() != null){
//			if(stopWordService.test(factory.getIntroduction()).size() != 0){
//				return false;
//			}
//		}
		//3.执行操作
		factory.setStatus(Factory.STATUS_VALID);
		factoryDao.save(factory);
		
//		//4.记日志了
//		draftService.saveLog(Factory.TABLE_NAME, id,  user, "批准",
//				"status", factory.getStatus().toString(), oldStatus.toString());
		return true;
	}
	
	/**
	 * jmj 2015-05-20
	 * 驳回
	 * @param id
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public boolean reject(String id, SysUser user) throws Exception{
		//1.验证操作合法性
		Factory factory = get(id);
		Integer oldStatus = factory.getStatus();
		if(factory == null || oldStatus != Factory.STATUS_APPROVE|| user == null){
			return false;
		}
//		//2.进行停用词检查，简介可能为空
//		if(stopWordService.test(factory.getCharacteristic())!=null
//				&&stopWordService.test(factory.getCharacteristic()).size() != 0){
//			return false;
//		}else if(factory.getIntroduction() != null){
//			if(stopWordService.test(factory.getIntroduction()).size() != 0){
//				return false;
//			}
//		}
		//3.执行操作
		factory.setStatus(Factory.STATUS_DRAFT);
		factoryDao.save(factory);
		
//		//4.记日志了
//		draftService.saveLog(Factory.TABLE_NAME, id,  user, "驳回",
//				"status", factory.getStatus().toString(), oldStatus.toString());
		return true;
	}
	
	/**
	 * 直接下架
	 * jmj 201-05-20 
	 * 扩展审核功能 实体类新定义了 状态码常量, 修改旧状态码
	 * @param id
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public boolean disable(String id, SysUser user) throws Exception{
		//1.验证操作合法性
		Factory factory = get(id);
		Integer oldStatus = factory.getStatus();
		if(factory == null || oldStatus != Factory.STATUS_VALID || user == null){
			return false;
		}	
		
		//2.执行操作
		factory.setStatus(Factory.STATUS_OUT_OF_STOCK);
		factoryDao.save(factory);
		
//		//3.记日志了
//		draftService.saveLog(Factory.TABLE_NAME, id,  user, "下架",
//				"status", factory.getStatus().toString(), oldStatus.toString());
		return true;
	}
	
	
	/*
	 * 统计某一员工的开店数量
	 */
	public int countFactoryBySysUser(String sysUserId){
		return factoryDao.countFactoryBySysUser(sysUserId);
	}
	
	/**
	 * @param key
	 * @param value
	 * @param orderBy
	 * @return
	 */
	public List<Factory> getAllByRefereeId(String refereeId){
		return factoryDao.getAllByProperty("refereeId", refereeId, "createTime desc");
	}
	
	/* 统计某一商家的开店数量*/
	public int countFactoryByRefereeId(String factoryId){
		return factoryDao.countFactoryByRefereeId(factoryId);
	}
	

	@Autowired
	private FactoryDao factoryDao;
	@Autowired
	private GeneralDao generalDao;
	@Autowired
	private FactoryUserService factoryUserService;
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private ProfitConfigService profitConfigService;
	
}
