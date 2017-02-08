package pub.functions;

import java.io.Closeable;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-8-9
 * Time: 12:12:05
 */
public class IoFuncs {

	public static void tryClose(Closeable closeable) {
		if (closeable == null) {
			return;
		}
		try {
			closeable.close();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}
}
