package pub.spring.mvc.view;

import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-2-16
 * Time: 5:09:25
 */
@SuppressWarnings("unchecked")
public class JsonView extends MappingJacksonJsonView {

	// when model contains this attribute, it's value will be the output,
	// 		otherwise, whole model would be output as a map
	public static final String directResult = "direct_result";

	private boolean singleValueAsDirectResult = false;

	public boolean isSingleValueAsDirectResult() {
		return singleValueAsDirectResult;
	}

	public void setSingleValueAsDirectResult(boolean singleValueAsDirectResult) {
		this.singleValueAsDirectResult = singleValueAsDirectResult;
	}

	@Override
	protected void prepareResponse(HttpServletRequest request, HttpServletResponse response) {
		// default no cache for json result
		if (!response.containsHeader("Cache-Control")) {
			response.setHeader("Cache-Control", "no-store");
		}
		super.prepareResponse(request, response);
	}

	@Override
	protected Object filterModel(Map<String, Object> model) {
		if (model.containsKey(directResult)) {
			return model.get(directResult);
		}
		//
		model = (Map<String, Object>) super.filterModel(model);

		if (model.containsKey("_fullModel")) {
			return model;
		}
		Object result = null;
		Iterator<Object> iter = model.values().iterator();
		while (iter.hasNext()) {
			result = iter.next();
		}
		return result;
	}
}
