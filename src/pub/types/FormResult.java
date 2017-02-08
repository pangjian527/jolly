package pub.types;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 11-6-26
 */
public class FormResult extends ActionResult {
 
	private static final long serialVersionUID = 376879813431303618L;
	private Map<String, String> errors;

	public FormResult() {
		errors = new HashMap<String, String>();
	}

	public Map<String, String> getErrors() {
		return errors;
	}
	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}
}
