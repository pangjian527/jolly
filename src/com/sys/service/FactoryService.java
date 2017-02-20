package com.sys.service;

import java.util.Date;
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
import com.sys.entity.FactoryUser;
import com.sys.entity.SysUser;
import com.sys.utils.SqlUtils;

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
	public void saveFactoryAndCreateFactoryUser(Factory factory) throws Exception {
		this.save(factory);
		factoryUserService.addFactoryUser(factory.getMobile(), "123456", factory.getId());
	}
	
	@Transactional
	public void save(Factory factory){
		if(StrFuncs.isEmpty(factory.getId())){
			factory.setStatus(Factory.STATUS_AUDITFAIL);  //草稿状态
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
	 * 组合分页的查询结果
	 * 主要用于data_provider查询，加上排序会出现分页错乱问题
	 * @param queryData
	 * @param settings
	 * @return
	 *//*
	public QueryResult queryWithOutOrderby(String condition,QuerySettings settings){
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		Query query = new PagedQuery(settings);
		StringBuffer select = new StringBuffer(" f.*,a.full_name as areaname ");
		StringBuilder where = new StringBuilder(" 1=1 ");
		//StringBuilder orderBy = new StringBuilder();

		if (queryJson.containsKey("factory_Ids")) {
			where.append(" and f.id in (:factory_Ids)");
			query.put("factory_Ids", queryJson.getString("factory_Ids").split(","));
		}
		this.addQueryEqualFilter(queryJson, where, query, "id",
				" and f.id = :id");
		this.addQueryEqualFilter(queryJson, where, query, "status",
				" and f.status = :status");
		this.addQueryLikeFilter(queryJson, where, query, "name",
				" and f.name like :name");
		this.addQueryLikeFilter(queryJson, where, query, "search",
				" and f.name like:search");
		this.addQueryLikeFilter(queryJson, where, query, "tel",
				" and f.tel like :tel");
		this.addQueryEqualFilter(queryJson, where, query, "provinceId",
				" and f.PROVINCE_ID = :provinceId");
		this.addQueryEqualFilter(queryJson, where, query, "cityId",
				" and f.CITY_ID = :cityId");
		this.addQueryEqualFilter(queryJson, where, query, "countyId",
				" and f.COUNTY_ID = :countyId");
		this.addQueryLikeFilter(queryJson, where, query, "addr",
				" and f.addr like :addr");
		this.addQueryEqualFilter(queryJson, where, query, "erectility",
				" and f.erectility = :erectility");
		this.addQueryEqualFilter(queryJson, where, query, "platform",
				" and f.platform = :platform");

		select.append("," + SqlUtils.getFileId("f.photo_ids"));
		主要用于b2b查询暂时不排序，排序会导致分页出问题
		 * if (queryJson.containsKey("grade")
				&& queryJson.getString("grade").equals("desc")) {
			orderBy.append(" f.grade desc");
		} else if (queryJson.containsKey("grade")
				&& queryJson.getString("grade").equals("asc")) {
			orderBy.append(" f.grade asc");
		} else {
			orderBy.append(" f.create_time desc ");
		}

		query.select(select.toString()).from(
				" t_factory f left join t_area a on f.county_id=a.id ").where(
				where.toString());
		generalDao.execute(query);
		return query.getResult();
	}
	
	*//**
	 * 组合分页的查询结果
	 * 主要用于data_provider_parent查询，加上排序会出现分页错乱问题
	 * 店名、手机、联系模糊摸索
	 * @param queryData
	 * @param settings
	 * @return
	 *//*
	public QueryResult queryByKeyWordWithOutOrderby(String condition,QuerySettings settings){
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		Query query = new PagedQuery(settings);
		StringBuffer select = new StringBuffer(" f.*,a.full_name as areaname ");
		StringBuilder where = new StringBuilder(" 1=1 ");
		//StringBuilder orderBy = new StringBuilder();

		if (queryJson.containsKey("factory_Ids")) {
			where.append(" and f.id in (:factory_Ids)");
			query.put("factory_Ids", queryJson.getString("factory_Ids").split(","));
		}
		this.addQueryEqualFilter(queryJson, where, query, "id",
				" and f.id = :id");
		this.addQueryEqualFilter(queryJson, where, query, "status",
				" and f.status = :status");
		this.addQueryLikeFilter(queryJson, where, query, "keyword",
				" and (f.name like :keyword or f.mobile like :keyword or f.man like :keyword) ");
		this.addQueryEqualFilter(queryJson, where, query, "provinceId",
				" and f.PROVINCE_ID = :provinceId");
		this.addQueryEqualFilter(queryJson, where, query, "cityId",
				" and f.CITY_ID = :cityId");
		this.addQueryEqualFilter(queryJson, where, query, "countyId",
				" and f.COUNTY_ID = :countyId");
		this.addQueryLikeFilter(queryJson, where, query, "addr",
				" and f.addr like :addr");
		this.addQueryEqualFilter(queryJson, where, query, "platform",
				" and f.platform = :platform");

		select.append("," + SqlUtils.getFileId("f.photo_ids"));
		主要用于b2b查询暂时不排序，排序会导致分页出问题
		 * if (queryJson.containsKey("grade")
				&& queryJson.getString("grade").equals("desc")) {
			orderBy.append(" f.grade desc");
		} else if (queryJson.containsKey("grade")
				&& queryJson.getString("grade").equals("asc")) {
			orderBy.append(" f.grade asc");
		} else {
			orderBy.append(" f.create_time desc ");
		}

		query.select(select.toString()).from(
				" t_factory f left join t_area a on f.county_id=a.id ").where(
				where.toString());
		generalDao.execute(query);
		return query.getResult();
	}
	
	*//**
	 * 拿到全部商户数据
	 * @return
	 * @throws Exception
	 *//*
	public List<Factory> getAll() {
		List<Factory> result = new ArrayList<Factory>();
		result = factoryDao.getAllByStatus();
		return result;
	}
	
	public List<Factory> getByCountyId(String countyId){
		return factoryDao.getByCountyId(countyId);
	}
	
	*//**
	 * 根据名称查询店铺
	 * @param name
	 * @return
	 *//*
	public Factory getByName(String name){
		return factoryDao.getByName(name);
	}
	
	public Factory get(String id){
		if(Factory.MAIN_STORE_ID.equals(id)){
			Factory factory = new Factory();
			factory.setId("-1");
			factory.setStatus(1);
			factory.setName("好胎屋");
			return factory;
		}
		else{
			return factoryDao.get(id);
		}
	}
	
	
	
	*//**
	 * pmall分页的查询
	 * @param queryData
	 * @param settings
	 * @return
	 *//*
	public QueryResult queryShopWeb(QueryData queryData,QuerySettings settings){
		Query query = new PagedQuery(settings);
		try {
			String select = " f.id,f.name,f.tel,f.addr,gps_x,f.gps_y,f.grade,f.comment_count,(select a.name from t_area a where a.id=f.county_id) as area_full_name ";
			select +=" ,f.characteristic ";
			String from = " t_factory f ";
			String where = "f.status=1 and f.platform='o2o' ";
			String orderby = " f.create_time desc ";
			if(queryData!=null){
				if(queryData.getOy()==2){
					orderby = " f.grade desc ";
				}else if(queryData.getOy()==3){
					orderby  = " f.comment_count desc";
				}
				if(StrFuncs.notEmpty(queryData.getKw())){
					where += " and f.name like:name ";
					query.put("name", StrFuncs.anyLike(queryData.getKw()));
				}
				if (StrFuncs.notEmpty(queryData.getFactoryIds())) {
					where+=" and f.id in (:factoryIds)";
					query.put("factoryIds", queryData.getFactoryIds().split(","));
				}
				if(StrFuncs.isEmpty(queryData.getFactoryId())){//由店铺进来的时候，忽略区域by dgs
					if(StrFuncs.notEmpty(queryData.getCountyId())){
						where += " and f.county_id =:countyId";
						query.put("countyId", queryData.getCountyId());
					}else{//这里就要考虑市级的ID
						if(StrFuncs.notEmpty(queryData.getCityId())){
							where += " and f.city_id =:cityId";
							query.put("cityId", queryData.getCityId());
						}
					}
				}else{
					where += " and f.id =:factoryId ";
					query.put("factoryId", queryData.getFactoryId());
				}
				if(StrFuncs.notEmpty(queryData.getNotFactoryId())){
					where += " and f.id <>:notFactoryId ";
					query.put("notFactoryId", queryData.getNotFactoryId());
				}
			}
			
			select += (","+SqlUtils.getFileId("f.photo_ids"));
			query.select(select).from(from).where(where)
					.orderBy(orderby);	
			generalDao.execute(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return query.getResult();
	}
	
	
	 * 版本信息：2015-1-13 pj add
	 * 
	 * 功能说明：根据中心点查询到商家之后，获取到相应的商家信息
	 
	public List<Object> queryMap(String condition,MapData mapData,QuerySettings settings){
		
		QueryData queryData=(QueryData)JSONObject.toBean(JsonFuncs.toJsonObject(condition), QueryData.class);
		
		QueryResult queryResult = this.queryShopWeb(queryData, settings);
		for(Object o : queryResult.getRows()){
			Map map = (Map)o;
			String id = map.get("ID").toString();
			
			map.put("DISTANCE",mapData.getDistanceById(id));
		}
		return queryResult.getRows();
	}
	
	
	*//**
	 * 百度地图某点中心查找店铺后
	 * 查询店铺详细信息
	 * @return
	 *//*
	public QueryResult queryMapShop(List<String> factoryIds){
		Query query = new ListQuery();
		try {
			String select = " f.id,f.name,f.tel,f.addr,gps_x,f.gps_y,f.grade,f.comment_count,(select a.name from t_area a where a.id=f.county_id) as area_full_name ";
			String from = " t_factory f ";
			String where = "f.status=1 and f.id in(:factoryIds)";
			query.put("factoryIds", factoryIds);
			//select += ","+SqlUtils.createGetFileId(Factory.TABLE_NAME, "f.id", 3);
			select += (","+SqlUtils.getFileId("f.photo_ids"));
			query.select(select).from(from).where(where);	
			generalDao.execute(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return query.getResult();
	}
	
	
	 * @功能说明：统计商家余额
	 * 
	 * @版本说明：2014-11-5 pj
	 
	public double countFactoryBalance(String factoryId){
		return billService.;
	}
	
	 * @功能说明：统计商家未计算记录数
	 * 
	 * @版本说明：2014-11-5 pj
	 
	public int countNotSettlement(String factoryId){
		return billDetailDao.countNotSettlement(factoryId);
	}
	
	//获得最近浏览的店铺
	public List<BrowseData> getLast(List<String> ids){
		List<BrowseData> browseDatas = new ArrayList<BrowseData>();
		Query query = new ListQuery();
		String sql = "select t.id,t.name,"+SqlUtils.getFileId("t.photo_ids");
		sql += " from t_factory t where t.status = 1 and t.id in (:ids)";
		query.put("ids", ids);
		query.setSql(sql);
		generalDao.execute(query);
		QueryResult result = query.getResult();
		for(String id : ids){
			for(Object o : result.getRows()){
				Map map = (Map)o;
				if(id.equals(map.get("ID").toString())){
					BrowseData browseData = new BrowseData();
					browseData.setId(id);
					browseData.setName(map.get("NAME").toString());
					browseData.setImgId(map.get("FILEID")==null?null:map.get("FILEID").toString());
					//browseData.setPrice(Double.valueOf(map.get("PRICE").toString()));
					browseDatas.add(browseData);
					break;
				}
			}
		}
		return browseDatas;
	}
	
	
	*//**
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
		if(oldStatus == Factory.STATUS_AUDITFAIL || oldStatus ==Factory.STATUS_OUT_OF_STOCK ){
		}else{
			return false;
		}
//		//3.进行停用词检查，简介可能为空
//		if(stopWordService.test(factory.getCharacteristic())!=null
//				&&stopWordService.test(factory.getCharacteristic()).size() != 0){
//			return false;
//		}else if(factory.getIntroduction() != null){
//			if(stopWordService.test(factory.getIntroduction()).size() != 0){
//				return false;
//			}
//		}
		//4.执行操作
		factory.setStatus(Factory.STATUS_VALID);
		factoryDao.save(factory);
		
//		//5.记日志了
//		draftService.saveLog(Factory.TABLE_NAME, id,  user, "上架",
//				"status", factory.getStatus().toString(), oldStatus.toString());
		return true;
	}
	
//	@Transactional
//	public boolean enable(String id, FactoryUser user) throws Exception{
//		//1.验证操作合法性
//		Factory factory = get(id);
//		Integer oldStatus = factory.getStatus();
//		if(factory == null || oldStatus != Factory.OFFLINE || user == null 
//				|| factory.getId().equals(user.getFactoryId())){
//			return false;
//		}
//		
//		//2.执行操作
//		factory.setStatus(Factory.ONLINE);
//		factoryDao.save(factory);
//		
////		//3.记日志了
////		draftService.saveLog(Factory.TABLE_NAME, id,  user, "上架",
////				"status", factory.getStatus().toString(), oldStatus.toString());
//		return true;
//	}
	
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
		factory.setStatus(Factory.STATUS_AUDITFAIL);
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
	
	/**
	 * @功能说明：上传商家的信息至百度图层（后续做做成定时器）
	 * 
	 * @版本说明：2014-11-5 pj
	 */
//	public void uploadLocation()  {
//		List<Factory> factorys = factoryDao.getAll();
//		
//		try {
//			for (Factory factory : factorys) {
//				
//				if(factory.getGpsX().equals("1")||factory.getGpsY().equals("1"))
//					continue;
//				if(factory.getStatus()==1){
//					MapUtils.saveFactory(factory);
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	/**
	 * myq add @2015-2-3，根据车主轮胎安装要求，获得对应的安装商家，最多查询50家商家
	 * @param isSpecialTyre
	 * @param countyId
	 * @param lng
	 * @param lat
	 * @param orderBy
	 * @return
	 *//*
	public QueryResult queryCandidateFactorys(boolean isSpecialTyre, String cityId, String countyId, 
			MapPoint point, String orderBy){
		final int meters = 10000 * 1000;
		Query query = new PagedQuery(PageSettings.of(1, 300));
		
		StringBuffer select = new StringBuffer(" f.id, f.name, f.grade, f.comment_count, f.gps_x, f.gps_y, f.addr, f.photo_ids,f.mobile, a.name areaname ");
		StringBuilder where = new StringBuilder(" f.status = 1 ");
		//a.商家所在区/县
		if(StrFuncs.notEmpty(countyId)){
			where.append(" and f.county_id = :countyId");
			query.put("countyId", countyId);
		}
		else if(StrFuncs.notEmpty(cityId)){
			where.append(" and f.city_id = :cityId");
			query.put("cityId", cityId);
		}
		else{
			//return null;
		}
		
		//b.轮胎安装能力限制
		if(isSpecialTyre){
			where.append(" and f.erectility = 1");
		}
		else{
			where.append(" and f.erectility in (1, 2)");
		}
		//c.坐标限制
		//boolean hasGps = lng != null && lat != null;

		if(point != null){
			//这里要检查point和cityId对不对的上啊，禁止跨城市的按距离查询 
			where.append(" and f.gps_x between :minLng and :maxLng");
			query.put("minLng", MapUtils.addLng(point.getLng(), -meters));
			query.put("maxLng", MapUtils.addLng(point.getLng(), meters));
			
			where.append(" and f.gps_y between :minLat and :maxLat");
			Double i = MapUtils.addLat(point.getLat(), meters);
			query.put("minLat", MapUtils.addLat(point.getLat(), -meters));
			query.put("maxLat", MapUtils.addLat(point.getLat(), meters));
		}
		
		//2.查询
		boolean orderByDistance = "distance".equals(orderBy);
		if(orderByDistance){
			//如果是按距离排序，则需要先无序查询出结果，再调用MapUtils计算距离，最后java重新排序
			query.select(select.toString())
				.from(" t_factory f left join t_area a on f.county_id=a.id ")
				.where(where.toString());
			generalDao.execute(query);
		}
		else{
			//如果是按星级、点评数等其他非距离因素查询，则按照orderBy 条件查出结果后，再依次计算结果集中的商家距离
			query.select(select.toString())
				.from(" t_factory f left join t_area a on f.county_id=a.id ")
				.where(where.toString())
				.orderBy(orderBy.toString());
			generalDao.execute(query);
		}
	
		//3.按距离在内存中排序

		if(orderByDistance && point != null){
			List<Map> rows = (List<Map>)query.getResult().getRows();
			for(Map map : rows){
				if(map.containsKey("")){
					
				}
				Object gpsX = map.get("GPS_X");
				Object gpsY = map.get("GPS_Y");
				if(gpsX != null && gpsY != null){
					Double facLng = ((BigDecimal)gpsX).doubleValue();
					Double facLat = ((BigDecimal)gpsY).doubleValue();
					Integer distance = MapUtils.getDistance(point.getLng(), point.getLat(), facLng, facLat);
					map.put("DISTANCE", distance);
				}
				
			}
			//使用java在内存中排序，而不是传统的sql语句排序模式
			if(orderByDistance){
				Collections.sort(rows, new Comparator<Map>(){
					public int compare(Map row1, Map row2) {
						Object d1 = row1.get("DISTANCE");
						Object d2 = row2.get("DISTANCE");
						//System.out.println(d1 + "\t" + d2);
						if(d1 != null && d2 != null){
							//System.out.println("c:" + ((Double)d1).compareTo((Double)d2));
						
							return ((Integer)d1).compareTo((Integer)d2);
						}
						else if(d1 == null && d2 == null){
							return 0;
						}
						else{
							return d1 == null ? 1 : -1;
						}
					}
				});
			}
			
		}

		return query.getResult();
	}
	
	
	
	//按照距离进行排序
	private void sortByDistance(List<Map> rows){
		//使用java在内存中排序，而不是传统的sql语句排序模式
		Collections.sort(rows, new Comparator<Map>(){
			public int compare(Map row1, Map row2) {
				Object d1 = row1.get("DISTANCE");
				Object d2 = row2.get("DISTANCE");
				if(d1 != null && d2 != null){
					return ((Integer)d1).compareTo((Integer)d2);
				}
				else if(d1 == null && d2 == null){
					return 0;
				}
				else{
					return d1 == null ? 1 : -1;
				}
			}
		});
	}
	
	private void sortByComment(List<Map> rows){
		//使用java在内存中排序，而不是传统的sql语句排序模式
		Collections.sort(rows, new Comparator<Map>(){
			public int compare(Map row1, Map row2) {
				Object d1 = row1.get("COMMENT_COUNT");
				Object d2 = row2.get("COMMENT_COUNT");
				if(d1 != null && d2 != null){
					return ((BigDecimal)d1).compareTo((BigDecimal)d2);
				}
				else if(d1 == null && d2 == null){
					return 0;
				}
				else{
					return d1 == null ? 1 : -1;
				}
			}
		});
	}
	
	
	//按照星级进行排序，之前的查询以及排过了，这里什么都不做
	private void sortByGrade(List<Map> rows){
		//使用java在内存中排序，而不是传统的sql语句排序模式
		
	}
	
	//按照星级进行排序
	private void sortByDefault(List<Map> rows){
		//使用java在内存中排序，而不是传统的sql语句排序模式
		Collections.sort(rows, new Comparator<Map>(){
			public int compare(Map row1, Map row2) {
				return - getDefaultGrade(row1).compareTo(getDefaultGrade(row2));
			}
		});
	}
	//计算某个商家与车主的匹配程度，目前级别、距离各占100分
	private Integer getDefaultGrade(Map row){
		
		int result = 0;
		BigDecimal grade = (BigDecimal)row.get("GRADE");
		if(grade != null){
			result += grade.intValue() * 100 /5;
		}
		Integer distance = (Integer)row.get("DISTANCE");
		if(distance != null){
			if(distance <= 1000){//一公里内，满分 
				result += 100;
			}
			else if(distance <= 10000){//1-10公里内，90-100分 
				result += 90 + (10000 - distance) * 10 / 9000;
			}
			else if(distance <= 20000){//10-20公里内，80-90分 
				result += 80 + (20000 - distance) * 10 / 10000;
			}
			else if(distance <= 30000){//20-30公里内，60-80分 
				result += 60 + (30000 - distance) * 20 / 10000;
			}
			else{//超过30公里了，随便扣吧
				result += 30000 * 60 / distance;
			}
		}
		//row.put("default_grade", result);
		return result;
	}
	
	
	
	//无具体的坐标，只按整个区来搜索商家。此方法不支持order by distance
	public QueryResult queryByTyreInstall(boolean isSpecialTyre, String countyId, String orderBy){
		Query query = new PagedQuery(PageSettings.of(1, 100));
		
		StringBuffer select = new StringBuffer(" f.*, a.full_name as areaname ");
		StringBuilder where = new StringBuilder(" f.status = 1 ");
		//a.商家所在区/县
		where.append(" and f.county_id = :countyId");
		query.put("countyId", countyId);
		//b.轮胎安装能力限制
		where.append(" and f.erectility = :erectility");
		query.put("erectility", isSpecialTyre ? 1 : 2);
		
		//2.查询
		query.select(select.toString())
			.from(" t_factory f left join t_area a on f.county_id=a.id ")
			.where(where.toString())
			.orderBy(orderBy.toString());
		generalDao.execute(query);

		return query.getResult();
	}
	
	public HibernateDao<Factory> getBaseDao(){
		return factoryDao;
	} 
	

	public List<String> toList(String[] brandIds) {
		List <String> list = new ArrayList<String>();
		for(int i=0;i<brandIds.length;i++){
			list.add(brandIds[i]);
		}
		return list;
	}
	*/
	
	/*
	 * 统计某一员工的开店数量
	 */
	public int countFactoryBySysUser(String sysUserId){
		return factoryDao.countFactoryBySysUser(sysUserId);
	}
	

	@Autowired
	private FactoryDao factoryDao;
	@Autowired
	private GeneralDao generalDao;
	@Autowired
	private FactoryUserService factoryUserService;
	
}
