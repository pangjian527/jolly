package pub.types;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.commontemplate.util.BeanUtils;

/*
 *
 * 修改内容：添加serialVersionUID，以避免因为版本不同引起错误
 */
public class IdText implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = -286766548785891716L;
	public String id;
	public String text;

	public IdText() {

	}

	public IdText(String id, String text) {
		this.id = id;
		this.text = text;
	}

	public <T1, T2> IdText(T1 id, T2 text) {
		this(id == null? null: id.toString(), text == null ? "" : text.toString());
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getId() {
		return id;
	}

	public String getText() {
		return text;
	}

	public static List<IdText> valueOf(List beans, String idProName, String textProName){
		List<IdText> result = new ArrayList<IdText>();
		for(Object bean : beans){
			Object id;
			Object text;
			if(bean == null){
				continue;
			}
			else if(bean instanceof Map){
				Map map =(Map)bean;
				id = map.get(idProName);
				text = map.get(textProName);
			}
			else if(bean instanceof String){
				id = bean.toString();
				text = bean.toString();
			}
			else{
				id = BeanUtils.getProperty(bean, idProName);
				text = BeanUtils.getProperty(bean, textProName);
			}
			
			IdText idText = new IdText();
			if(id != null){
				idText.setId(id.toString());
			}
			if(text != null){
				idText.setText(text.toString());
			}
			result.add(idText);
		}
		return result;
	}
	
	public static List<IdText> valueOf(List<String> beans){
		List<IdText> result = new ArrayList<IdText>();
		for(String bean : beans){
			IdText idText = new IdText();
			idText.setId(bean);
			idText.setText(bean);
			result.add(idText);
		}
		return result;
	}
}
