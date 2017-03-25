package com.web.mmall.factory.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.dao.query.PageSettings;
import pub.dao.query.QueryResult;
import pub.functions.StrFuncs;

import com.sys.entity.Factory;
import com.sys.entity.FactoryUser;
import com.sys.service.FactoryService;
import com.sys.service.ScoreService;
import com.web.mmall.MMallActon;
import com.wxpay.util.WXConfigUtil;

@Controller
public class FactoryAction extends MMallActon{
	@RequestMapping
	public String execute(HttpServletRequest request,HttpServletResponse response,String factoryId){
		
		FactoryUser user = this.getUser();
		if(user==null){
			return "redirect:/mmall/factoryuser/login.do";
		}
		Factory factory = factoryService.get(user.getFactoryId());
		request.setAttribute("factory", factory);
		request.setAttribute("factoryImgIds", this.SplitToList(factory.getPhotoIds()));
		request.setAttribute("licenseImgIds", this.SplitToList(factory.getLicenseFileIds()));
		request.setAttribute("bankNameList", this.getBankNameList());
		return "mmall/factory/detail";
	}
	
	private List<String> getBankNameList() {
		List<String> bankNameList = new ArrayList<String>();

		bankNameList.add("中国工商银行");
		bankNameList.add("中国农业银行");
		bankNameList.add("中国银行");
		bankNameList.add("中国建设银行");
		bankNameList.add("交通银行");
		bankNameList.add("招商银行");
		bankNameList.add("威海市商业银行");
		bankNameList.add("德州银行");
		bankNameList.add("临商银行");
		bankNameList.add("日照银行");
		bankNameList.add("郑州银行");
		bankNameList.add("开封市商业银行");
		bankNameList.add("洛阳银行");
		bankNameList.add("漯河市商业银行");
		bankNameList.add("韩亚银行");
		bankNameList.add("德阳银行");
		bankNameList.add("绵阳市商业银行");
		bankNameList.add("荷兰合作银行中国公司");
		bankNameList.add("玉山银行");
		bankNameList.add("重庆富民银行股份有限公司");
		bankNameList.add("汉口银行");
		bankNameList.add("长沙银行");
		bankNameList.add("广州银行");
		bankNameList.add("东莞银行");
		bankNameList.add("广西北部湾银行");
		bankNameList.add("柳州银行");
		bankNameList.add("重庆银行");
		bankNameList.add("攀枝花市商业银行");
		bankNameList.add("瑞典商业银行");
		bankNameList.add("国泰世华商业银行");
		bankNameList.add("厦门银行");
		bankNameList.add("江西银行");
		bankNameList.add("厦门国际银行");
		bankNameList.add("农村商业银行");
		bankNameList.add("温州银行");
		bankNameList.add("湖州银行");
		bankNameList.add("绍兴银行");
		bankNameList.add("浙江稠州商业银行");
		bankNameList.add("台州银行");
		bankNameList.add("浙江泰隆商业银行");
		bankNameList.add("浙江民泰商业银行");
		bankNameList.add("福建海峡银行");
		bankNameList.add("韩国企业银行");
		bankNameList.add("浙江网商银行");
		bankNameList.add("华商银行");
		bankNameList.add("韩国外换银行");
		bankNameList.add("陕西省农村信用社联合社");
		bankNameList.add("蒙特利尔银行");
		bankNameList.add("新疆奎屯国民村镇银行");
		bankNameList.add("星展银行");
		bankNameList.add("海南农村信用社");
		bankNameList.add("广西农村信用社");
		bankNameList.add("深圳农商行");
		bankNameList.add("湖北农村信用社");
		bankNameList.add("福建农村信用社");
		bankNameList.add("安徽农村信用社");
		bankNameList.add("鄞州银行");
		bankNameList.add("江苏农村信用社");
		bankNameList.add("北京农村商业银行");
		bankNameList.add("永隆银行");
		bankNameList.add("瑞典北欧斯安银行");
		bankNameList.add("南洋商业银行");
		bankNameList.add("花旗银行");
		bankNameList.add("泰安市商业银行");
		bankNameList.add("莱商银行");
		bankNameList.add("朝兴银行");
		bankNameList.add("亚洲商业银行");
		bankNameList.add("创兴银行");
		bankNameList.add("赣州银行");
		bankNameList.add("上饶银行");
		bankNameList.add("青岛银行");
		bankNameList.add("齐商银行");
		bankNameList.add("东营市商业银行");
		bankNameList.add("烟台银行");
		bankNameList.add("潍坊银行");
		bankNameList.add("济宁银行");
		bankNameList.add("中银香港");
		bankNameList.add("包商银行");
		bankNameList.add("鄂尔多斯银行");
		bankNameList.add("珠海南通银行");
		bankNameList.add("上海农村商业银行");
		bankNameList.add("丰业银行");
		bankNameList.add("邯郸市商业银行");
		bankNameList.add("邢台银行");
		bankNameList.add("张家口市商业银行");
		bankNameList.add("承德银行");
		bankNameList.add("沧州银行");
		bankNameList.add("晋商银行");
		bankNameList.add("晋城市商业银行");
		bankNameList.add("内蒙古银行");
		bankNameList.add("富邦华一银行");
		bankNameList.add("龙江银行");
		bankNameList.add("苏州银行");
		bankNameList.add("中德住房储蓄银行");
		bankNameList.add("农村信用合作社");
		bankNameList.add("大连银行");
		bankNameList.add("鞍山市商业银行");
		bankNameList.add("锦州银行");
		bankNameList.add("葫芦岛银行");
		bankNameList.add("营口银行");
		bankNameList.add("阜新银行");
		bankNameList.add("吉林银行");
		bankNameList.add("哈尔滨银行");
		bankNameList.add("山东农村信用社");
		bankNameList.add("哈密红星国民村镇银行");
		bankNameList.add("浙江商业银行");
		bankNameList.add("法国兴业银行");
		bankNameList.add("德富泰银行");
		bankNameList.add("瑞士信贷第一波士顿");
		bankNameList.add("广发银行");
		bankNameList.add("曲靖市商业银行");
		bankNameList.add("乌海银行");
		bankNameList.add("纽约银行");
		bankNameList.add("金华银行");
		bankNameList.add("泉州银行");
		bankNameList.add("平顶山银行");
		bankNameList.add("焦作市商业银行");
		bankNameList.add("湖北银行");
		bankNameList.add("南充市商业银行");
		bankNameList.add("晋中银行");
		bankNameList.add("华融湘江银行");
		bankNameList.add("云南农村信用社");
		bankNameList.add("新韩银行");
		bankNameList.add("新联商业银行");
		bankNameList.add("上海商业银行");
		bankNameList.add("恒生银行");
		bankNameList.add("东亚银行");
		bankNameList.add("盘古银行");
		bankNameList.add("中信嘉华银行");
		bankNameList.add("苏格兰皇家银行");
		bankNameList.add("代收付清算组织");
		bankNameList.add("法国里昂信贷银行");
		bankNameList.add("法国外贸银行");
		bankNameList.add("比利时富通银行");
		bankNameList.add("法国巴黎银行");
		bankNameList.add("河北银行");
		bankNameList.add("宁夏银行");
		bankNameList.add("成都农商银行");
		bankNameList.add("海口联合农村商业银行");
		bankNameList.add("天津滨海农村商业银行");
		bankNameList.add("无锡农村商业银行");
		bankNameList.add("美国银行");
		bankNameList.add("江苏江南农村商业银行");
		bankNameList.add("乌鲁木齐市商业银行");
		bankNameList.add("昆仑银行");
		bankNameList.add("自贡市商业银行");
		bankNameList.add("珠海华润银行");
		bankNameList.add("广东南粤银行");
		bankNameList.add("长安银行");
		bankNameList.add("天津银行");
		bankNameList.add("徽商银行");
		bankNameList.add("渤海银行");
		bankNameList.add("韩国国民银行");
		bankNameList.add("上海浦东发展银行");
		bankNameList.add("城市商业银行");
		bankNameList.add("瑞穗实业银行");
		bankNameList.add("恒丰银行");
		bankNameList.add("农村合作银行");
		bankNameList.add("浙商银行");
		bankNameList.add("集友银行");
		bankNameList.add("吉林农村信用社");
		bankNameList.add("三峡银行");
		bankNameList.add("村镇银行");
		bankNameList.add("民营银行");
		bankNameList.add("光大银行");
		bankNameList.add("三井住友银行");
		bankNameList.add("葡国储蓄信贷银行");
		bankNameList.add("澳新银行");
		bankNameList.add("罗马银行");
		bankNameList.add("中原银行");
		bankNameList.add("贵州省农村信用社联合社");
		bankNameList.add("比利时联合银行");
		bankNameList.add("宁波东海银行");
		bankNameList.add("国泰君安证券");
		bankNameList.add("成都银行");
		bankNameList.add("西安银行");
		bankNameList.add("江苏长江银行");
		bankNameList.add("枣庄银行");
		bankNameList.add("意大利联合商业银行");
		bankNameList.add("黄河农村商业银行");
		bankNameList.add("德意志银行");
		bankNameList.add("永亨银行");
		bankNameList.add("汇丰银行");
		bankNameList.add("泰京银行");
		bankNameList.add("华侨银行");
		bankNameList.add("荷兰商业银行");
		bankNameList.add("城市信用合作社");
		bankNameList.add("新疆伊犁国民村镇银行");
		bankNameList.add("太仓农村商业银行");
		bankNameList.add("江苏江阴农村商业银行");
		bankNameList.add("广西浦北国民村镇银行");
		bankNameList.add("广西上林国民村镇银行");
		bankNameList.add("防城港国民村镇银行");
		bankNameList.add("广西钦州市钦南国民村镇银行");
		bankNameList.add("新疆绿洲国民村镇银行有限责任公司");
		bankNameList.add("东兴国民村镇银行");
		bankNameList.add("昆山农村商业银行");
		bankNameList.add("石河子国民村镇银行");
		bankNameList.add("常熟农村商业银行");
		bankNameList.add("吴江农村商业银行");
		bankNameList.add("广州农村商业银行");
		bankNameList.add("张家港农村商业银行");
		bankNameList.add("重庆农村商业银行");
		bankNameList.add("顺德农村商业银行");
		bankNameList.add("大华银行");
		bankNameList.add("中国邮政储蓄银行");
		bankNameList.add("山口银行");
		bankNameList.add("深圳前海微众银行");
		bankNameList.add("兴业银行");
		bankNameList.add("日联银行");
		bankNameList.add("三菱东京日联银行");
		bankNameList.add("东方汇理银行");
		bankNameList.add("摩根大通银行");
		bankNameList.add("衡水银行");
		bankNameList.add("宁波通商银行");
		bankNameList.add("广东省农村信用社联合社");
		bankNameList.add("中信银行");
		bankNameList.add("民生银行");
		bankNameList.add("华夏银行");
		bankNameList.add("平安银行");
		bankNameList.add("贵阳银行");
		bankNameList.add("富滇银行");
		bankNameList.add("兰州银行");
		bankNameList.add("青海银行");
		bankNameList.add("齐鲁银行");
		bankNameList.add("九江银行");
		bankNameList.add("廊坊银行");
		bankNameList.add("瑞士银行");
		bankNameList.add("巴伐利亚州银行");
		bankNameList.add("玉溪市商业银行");
		bankNameList.add("嘉兴银行");
		bankNameList.add("盛京银行");
		bankNameList.add("贵州银行");
		bankNameList.add("海南银行股份有限公司");
		bankNameList.add("石嘴山银行股份有限公司");
		bankNameList.add("云南红塔银行股份有限公司");
		bankNameList.add("西德意志银行");
		bankNameList.add("建东银行");
		bankNameList.add("德国北德意志州银行");
		bankNameList.add("德累斯顿银行");
		bankNameList.add("美一银行");
		bankNameList.add("德国商业银行");
		bankNameList.add("国家开发银行");
		bankNameList.add("中国进出口银行");
		bankNameList.add("中国农业发展银行");
		bankNameList.add("广东华兴银行");
		bankNameList.add("东莞农村商业银行");
		bankNameList.add("上海华瑞银行");
		bankNameList.add("南京银行");
		bankNameList.add("北京银行");
		bankNameList.add("奥地利中央合作银行");
		bankNameList.add("杭州银行");
		bankNameList.add("上海银行");
		bankNameList.add("宁波银行");
		bankNameList.add("江苏银行");
		bankNameList.add("协和银行");
		bankNameList.add("荷兰万贝银行");
		bankNameList.add("首都银行及信托公司");
		bankNameList.add("泰华农民银行");
		bankNameList.add("大新银行");
		bankNameList.add("马来亚银行");
		bankNameList.add("武汉农村商业银行");
		bankNameList.add("友利银行");
		bankNameList.add("江西省农村信用社联合社");
		bankNameList.add("四川农村信用社");
		bankNameList.add("桂林银行");
		bankNameList.add("浙江农村信用社");
		bankNameList.add("重庆渝北银座村镇银行");
		bankNameList.add("重庆黔江银座村镇银行");
		bankNameList.add("江西赣州银座村镇银行");
		bankNameList.add("东营莱商村镇银行");
		bankNameList.add("浙江景宁银座村镇银行");
		bankNameList.add("浙江三门银座村镇银行");
		bankNameList.add("深圳福田银座村镇银行");
		bankNameList.add("北京顺义银座村镇银行");
		bankNameList.add("荷兰银行");
		bankNameList.add("天津农商银行");
		bankNameList.add("日本住友信托银行");
		bankNameList.add("商丘市商业银行");
		bankNameList.add("南阳市商业银行");
		bankNameList.add("渣打银行");
		bankNameList.add("福建亚洲银行");
		bankNameList.add("上海 - 巴黎国际银行");
		bankNameList.add("韩国产业银行");

		return bankNameList;
	}

	@RequestMapping
	public String saveDetailInfo(HttpServletRequest request,HttpServletResponse response){
		
		FactoryUser user = this.getUser();
		if(user==null){
			return "redirect:/mmall/factoryuser/login.do";
		}
		Factory factory = factoryService.get(user.getFactoryId());
		if(factory.STATUS_INVALID==factory.getStatus()
				||factory.STATUS_OUT_OF_STOCK==factory.getStatus()){
			//商家已被删除或下架，不能进行认证
			return "redirect:/mmall/factoryuser/login.do";
		}
		
		updateFactoryInfo(factory);
		
		factoryService.save(factory);
		
		return "redirect:/mmall/home/index.do";
	}

	private void updateFactoryInfo(Factory factory) {
		String name = this.getParam("name");
		String man = this.getParam("man");
		String mobile = this.getParam("mobile");
		String provinceId = this.getParam("provinceId");
		String cityId = this.getParam("cityId");
		String countyId = this.getParam("countyId");
		String addr = this.getParam("addr");
		Double gpsX = this.getDoubleParam("gpsX");
		Double gpsY = this.getDoubleParam("gpsY");
		String licenseName = this.getParam("licenseName");
		String licenseFileIds = this.getParam("licenseFileIds");
		String photoIds = this.getParam("photoIds");
		String bankName = this.getParam("bankName");
		String moneyAccount = this.getParam("moneyAccount");
		String bankBranchName = this.getParam("bankBranchName");
		String bankOwnerName = this.getParam("bankOwnerName");
		
		factory.setName(name);
		factory.setMan(man);
		factory.setMobile(mobile);
		factory.setProvinceId(provinceId);
		factory.setCityId(cityId);
		factory.setCountyId(countyId);
		factory.setAddr(addr);
		factory.setGpsX(gpsX);
		factory.setGpsY(gpsY);
		factory.setLicenseName(licenseName);
		factory.setLicenseFileIds(licenseFileIds);
		factory.setPhotoIds(photoIds);
		factory.setAgreeProtocol(Factory.PROTOCOL_AGREE);
		factory.setStatus(Factory.STATUS_APPROVE);;
		factory.setMoneyAccount(moneyAccount);
		factory.setBankName(bankName);
		factory.setBankBranchName(bankBranchName);
		factory.setBankOwnerName(bankOwnerName);
	}
	
	public List<String> SplitToList(String imgIds){
		if(StrFuncs.notEmpty(imgIds)){
			return Arrays.asList(imgIds.split(","));
		}else{
			return new ArrayList<String>();
		}
	}
	
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private ScoreService scoreService;
}
