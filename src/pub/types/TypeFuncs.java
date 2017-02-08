package pub.types;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author zhuangzhonglong
 * @since 2008-12-19
 * @time 17:29:51
 */
@SuppressWarnings("unchecked")
public class TypeFuncs {

	public static boolean isList(Class cls) {
		for (Class itf : cls.getInterfaces()) {
			if (itf.equals(List.class)) {
				return true;
			}
		}
		return false;
	}

	public static boolean isJavaType(Class cls) {
		return cls.getName().startsWith("java");
	}

}
