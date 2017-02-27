package pub.functions;

import java.io.BufferedReader;
import java.io.StringReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

public class XmlFuncs {
	/*
	 * xml转map
	 * 都是一级
	 * */
	public static Map<String,String> xml2map(String xml){
		BufferedReader buff = new BufferedReader(new StringReader(xml));
		SAXBuilder builder = new SAXBuilder(); 
		Map<String, String> map = new HashMap<String, String>();  
		try {
			Document doc = builder.build(buff);
			Element root = doc.getRootElement(); 
			List<Element> childrens = root.getChildren();
			for(Element e : childrens){
				//System.out.println("key="+e.getName());
				//System.out.println("value="+e.getValue());
				map.put(e.getName(), e.getValue());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public static void main(String[] args) {
		String xml = "<xml><appid><![CDATA[wx19dc6d01a3adbccf]]></appid><attach><![CDATA[毛氏精品洗车（7座车）]]></attach><bank_type><![CDATA[CFT]]></bank_type><cash_fee><![CDATA[1]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[N]]></is_subscribe><mch_id><![CDATA[1247588301]]></mch_id><nonce_str><![CDATA[5jbvhsa1fp3w7mfu4d2vqw77k1l16g0g]]></nonce_str><openid><![CDATA[o8MvNs0yfCLB2cn2WY__80iZGTR0]]></openid><out_trade_no><![CDATA[2c90d8b94e20348f014e203882870006]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[2C9FC263564BFD1A8352F392B9D3A0B4]]></sign><time_end><![CDATA[20150623194104]]></time_end><total_fee>1</total_fee><trade_type><![CDATA[APP]]></trade_type><transaction_id><![CDATA[1005960342201506230292412057]]></transaction_id></xml>";
		xml2map(xml);
	}
	
}
