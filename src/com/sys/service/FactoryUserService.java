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
import pub.functions.ColFuncs;
import pub.functions.CryptFuncs;
import pub.functions.StrFuncs;

import com.sys.dao.FactoryUserDao;
import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;

/**
 * 商家商家账号
 * @author zhangz
 *
 */

@Service
@Transactional(readOnly = true)
public class FactoryUserService  extends BaseService<FactoryUser>{

	public QueryResult query(String condition, QuerySettings settings) {
		
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		
		Query query = new PagedQuery(settings);
		
		StringBuilder where = new StringBuilder();
		where.append( " t.factory_id = f.id and t.status > 0");
		
		this.addQueryLikeFilter(queryJson, where, query, "factory", 
			" and (f.name like :factory or f.tel like :factory)");
		this.addQueryLikeFilter(queryJson, where, query, "account", 
				" and t.account  like :account");
		this.addQueryLikeFilter(queryJson, where, query, "mobile", 
			" and t.mobile like :mobile");
		this.addQueryEqualFilter(queryJson, where, query, "factoryId", " and t.factory_id=:factoryId ");
		
		this.addQueryEqualFilter(queryJson, where, query, "provinceId",
				" and f.PROVINCE_ID = :provinceId");
		this.addQueryEqualFilter(queryJson, where, query, "cityId",
				" and f.CITY_ID = :cityId");
		this.addQueryEqualFilter(queryJson, where, query, "countyId",
				" and f.COUNTY_ID = :countyId");
		this.addQueryLikeFilter(queryJson, where, query, "addr",
				" and f.addr like :addr");
		
		query.select( " t.*,f.name factoryname").
				from(" T_FACTORY_USER t ,t_factory f").
					where(where.toString()).
						orderBy(" t.create_time desc ");	
		generalDao.execute(query);
		
		return query.getResult();
	}
	
	/*
	 * jmj 
	 */
//	@Transactional
//	public void save(FactoryUser factoryUser){
//		factoryUser.setStatus(FactoryUser.STATUS_VALID);
//		FactoryUser user = this.get(factoryUser.getId());
//		user = factoryUser;
//		baseDao.save( user);
//	}
	
	/**
	 * jmj 2015-05-28
	 * 删除
	 */
	@Transactional
	public void delete( String id){
		baseDao.delete(id);
	}
	
	/*
	 * 冻结删除
	 */
//	@Transactional
//	public void delete( String id){
//		FactoryUser factoryUser = baseDao.get( id);
//		if( factoryUser!=null){
//			factoryUser.setStatus(FactoryUser.STATUS_INVALID);
//			baseDao.save( factoryUser);
//		}
//	}
	
	/*
	 * @功能说明：批量删除
	 * 
	  * @版本说明：2014-11-17 pj
	 */
	@Transactional
	public void batchDelete(String[] ids)throws Exception{
		for (String id : ids) {
			FactoryUser factoryUser = baseDao.get(id);
			factoryUser.setStatus(0);
		}
	}
	/*
	 * @功能说明：批量删除
	 * 
	  * @版本说明：2014-11-17 pj
	 */
	@Transactional
	public void updateStatus(String[] ids,int status) {
		for (String id : ids) {
			FactoryUser factoryUser = baseDao.get(id);
			factoryUser.setStatus(status);
		}
	}
	
	public FactoryUser getByKeyword(String keyword){
		return baseDao.getByKeyword(keyword);
	}
	
	public FactoryUser getByAccount(String account){
		return baseDao.getByProperty("account", account);
	}
	
	public FactoryUser getByOpenid(String openid){
		return baseDao.getByProperty("openid", openid);
	}
	
	public FactoryUser getByMobile(String mobile){
		List<FactoryUser> beans = baseDao.getAllByProperty("mobile", mobile);
		if(ColFuncs.isEmpty(beans)){
			return null;
		} else{
			return  beans.get(0);
		}
	}
	
	@Transactional
	public FactoryUser resetPassword(String id, String newPassword){
		//1.验证
		FactoryUser factoryUser = this.get(id);
		if(factoryUser == null || factoryUser.getStatus() != 1){
			return null;
		}
		factoryUser.setPwd(newPassword);
		baseDao.save(factoryUser);
		return factoryUser;
	}
	
	@Transactional
	public FactoryUser login(String key, String password , String ipAddr) throws Exception{
		//2.是否有这个用户
		FactoryUser user = getByKeyword(key);
		if(user == null){
			throw new Exception("不存在的用户"); 
		}
		
		//3.密码对不对
		if(!user.getPwd().equals(password)){
			throw new Exception("密码错误"); 
		}
		
		//4.检查账户有效性
		if(user.getStatus() == 0){
			throw new Exception("账户未激活"); 
		}
		if(user.getStatus() == 2){
			throw new Exception("账户已被冻结"); 
		}
		
		//5.检查商家有效性
		Factory factory = factoryService.get(user.getFactoryId());
		if(factory.getStatus() != 1){
			throw new Exception("商家尚未开通"); 
		}
		
		
		return user;
	}
	/*
	 * @功能说明：商家用户修改密码
	 * 
	  * @版本说明：2014-11-17 pj
	 */
	@Transactional
	public boolean changePassword(String key, String oldPassword,String newPassword){
		FactoryUser user = getByKeyword(key);
		
		if(user == null || !user.getPwd().equals(oldPassword)){
			return false;
		}
		
		user.setPwd(newPassword);
		save(user);
		return true;
	}
	/*
	 * @功能说明：获取商家的所有用户
	 * 
	  * @版本说明：2014-11-17 pj
	 */
	public List<FactoryUser> getFactoryAllUser(String factoryId){
		return baseDao.getFactoryAllUser(factoryId);
	}
	/*
	 * @功能说明：添加新用户
	 * 
	  * @版本说明：2014-11-17 pj
	 */
	@Transactional
	public FactoryUser addFactoryUser(String mobileOrAccount,String pwd,String factoryId)throws Exception{
		
		FactoryUser factoryUser = baseDao.getByMobileOrAccount(mobileOrAccount);
		if(factoryUser!=null){
			throw new RuntimeException("账号已经存在");
		}
		factoryUser=new FactoryUser();
		factoryUser.setAccount(mobileOrAccount);
		factoryUser.setMobile(mobileOrAccount);
		factoryUser.setPwd(CryptFuncs.getMd5(pwd));
		factoryUser.setFactoryId(factoryId);
		factoryUser.setStatus(FactoryUser.STATUS_VALID);
		
		baseDao.save(factoryUser);
		
		return factoryUser;
	}
	
	/**
	 * zhb 2015-05-14
	 * 修改用户的账号和手机号码
	 * @param id 当前用户 id
	 * @param account 当前用户账号
	 * @param mobile 当前用户手机号码
	 * @return
	 */
	@Transactional
	public boolean changeInfo(String id, String account, String mobile){
		//1.判断该账号是否已经存在，如果用原来的账号进行保存的话也是可以保存的
		FactoryUser factoryUser = baseDao.getByAccount(account);
		if(factoryUser != null){
			if(!factoryUser.getId().equals(id)){
				return false;
			}
		}
		//2.找到ID所对应的FactoryUser类，即根据id查找用户
		FactoryUser user = get(id);
		//3.修改用户的账号和手机号码，并保存到数据库中
		user.setAccount(account);
		user.setMobile(mobile);
		save(user);
		return true;
	}
	
/*	public FactoryUser create(){
		return new FactoryUser();
	}*/
/*	protected HibernateDao<FactoryUser> getBaseDao(){
		return baseDao;
	}*/
	
	/*
	 * jmj 2015-5-04
	 * 校验账号
	 * account:账号
	 * objectId:id
	 */
	public boolean indetifyAccount(String account, String id) {
		//1.根据参数查询出是否存在相同的 数据,若存在该条数据 属不属于自己 并返回
		List<FactoryUser> beans = baseDao.getAllByProperty("account", account);
		if(ColFuncs.isEmpty(beans)){
			return true;
		}
		else{
			FactoryUser bean = beans.get(0);
			return bean.getId().equals(id);
			//return result;
		}
	}
	/*
	 * jmj 2015-5-04
	 * 校验手机号码
	 * mobile:手机号码
	 * objectId:id
	 */
	public boolean indetifyMobile(String mobile, String id) {
		//1.根据参数查询出是否存在相同的 数据,若存在该条数据 属不属于自己 并返回
		List<FactoryUser> beans = baseDao.getAllByProperty("mobile", mobile);
		if(ColFuncs.isEmpty(beans)){
			return true;
		}
		else{
			FactoryUser bean = beans.get(0);
			return bean.getId().equals(id);
		}
	}
	
	/**
	 * 修改factory user协议状态
	 * @param factoryUser
	 * @param protocol 
	 */
	@Transactional
	public void modifyFactoryUserProtocol(FactoryUser factoryUser, int protocol){
		factoryUser.setProtocol(protocol);
		this.save(factoryUser);
	}
	
	public FactoryUser login(String key,String password) throws Exception {
		//2.是否有这个用户
		FactoryUser user = getByKeyword(key);
		if(user == null){
			throw new Exception("不存在的用户"); 
		}
		
		//3.密码对不对
		String md5Pwd = CryptFuncs.getMd5(password); 
		if(!user.getPwd().equals(md5Pwd)){
			throw new Exception("密码错误"); 
		}
		
		//4.检查账户有效性
		if(user.getStatus() == 0){
			throw new Exception("账户未激活"); 
		}
		if(user.getStatus() == 2){
			throw new Exception("账户已被冻结"); 
		}
		
		/*//5.检查门店有效性
		Factory factory = factoryService.get(user.getFactoryId());
		if(factory.getStatus() != 1){
			throw new Exception("门店尚未开通"); 
		}*/
		
		return user;
	}
	
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private FactoryUserDao baseDao;
	@Autowired
	private GeneralDao generalDao;
	
	
}
