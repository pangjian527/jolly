package pub.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-2-15
 * Time: 23:12:57
 */
public class BeanUtils {

	public static<T> T getBean(Class<T> clazz) {
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		return ac.getBean(clazz);
	}

}
