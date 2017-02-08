package pub.types;

import org.springframework.ui.ExtendedModelMap;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-5-18
 * Time: 0:15:59
 */
public class RefData extends ExtendedModelMap {
 
	private static final long serialVersionUID = 5559759597342857249L;

	public RefData put(Object attributeValue) {
		addAttribute(attributeValue);
		return this;
	}
	
}
