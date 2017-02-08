package pub.spring.mvc.view;

import java.util.Enumeration;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.view.JstlView;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-2-15
 * Time: 4:44:31
 */
public class MultiModelJstlView extends JstlView {

	@Override
	protected void exposeModelAsRequestAttributes(Map<String, Object> model,
											   HttpServletRequest request) throws Exception {

		if(!"POST".equals(request.getMethod())) {
			super.exposeModelAsRequestAttributes(model, request);
			return;
		}

		Set<String> existingAttributeNames = new HashSet<String>();
		Enumeration attributeNames = request.getAttributeNames();
		while (attributeNames.hasMoreElements()) {
			existingAttributeNames.add((String) attributeNames.nextElement());
		}
		for (Map.Entry<String, Object> entry : model.entrySet()) {
			String modelName = entry.getKey();
			if (existingAttributeNames.contains(modelName)) {
				continue;
			}
			Object modelValue = entry.getValue();
			if (modelValue != null) {
				request.setAttribute(modelName, modelValue);
//				if (logger.isDebugEnabled()) {
//					logger.debug("Added model object '" + modelName + "' of type [" + modelValue.getClass().getName() +
//							"] to request in view with name '" + getBeanName() + "'");
//				}
			}
			else {
				request.removeAttribute(modelName);
//				if (logger.isDebugEnabled()) {
//					logger.debug("Removed model object '" + modelName +
//							"' from request in view with name '" + getBeanName() + "'");
//				}
			}
		}
	}
}
