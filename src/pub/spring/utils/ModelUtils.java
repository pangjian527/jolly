package pub.spring.utils;

import org.springframework.ui.Model;
import org.springframework.util.ClassUtils;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: Jun 24, 2009
 */
@SuppressWarnings("unchecked")
public class ModelUtils {

	private static final long serialVersionUID = 1L;

	public static <T> T get(Model model, Class<T> clazz) {
		String attributeName = ClassUtils.getShortNameAsProperty(clazz);
		return (T) model.asMap().get(attributeName);
	}

	public static  <T> T[] get(Model model, Class<T[]> arrayClazz) {
		Class valueClass = arrayClazz.getComponentType();
		String attributeName = ClassUtils.getShortNameAsProperty(valueClass) + "List";
		return (T[]) model.asMap().get(attributeName);
	}

	public static <T> List<T> getList(Model model, Class<T> clazz) {
		String attributeName = ClassUtils.getShortNameAsProperty(clazz) + "List";
		return (List<T>) model.asMap().get(attributeName);
	}

	public static void put(Model model, Object attributeValue) {
		model.addAttribute(attributeValue);
	}

}
