package pub.spring;

import java.lang.reflect.InvocationTargetException;

import org.springframework.remoting.rmi.RmiServiceExporter;
import org.springframework.remoting.support.RemoteInvocation;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2009-2-9
 * Time: 7:01:56
 */
public class StatefulRmiServiceExporter extends RmiServiceExporter {

	protected Object invoke(RemoteInvocation invocation, Object targetObject) throws
																			  NoSuchMethodException,
																			  IllegalAccessException,
																			  InvocationTargetException {
		System.out.println("?");
//		Object[] modifiedArgs = invocation.getArguments();
//		Object[] args = Arrays.copyOf(modifiedArgs, modifiedArgs.length - 1);
//		invocation.setArguments(args);
		String methodName = invocation.getMethodName();
		int pos = methodName.indexOf('|');
		String cookie = methodName.substring(pos + 1);
		methodName = methodName.substring(0, pos);
		invocation.setMethodName(methodName);
		return super.invoke(invocation, targetObject);
	}
}
