package pub.spring;

import org.aopalliance.intercept.MethodInvocation;
import org.springframework.remoting.rmi.RmiProxyFactoryBean;
import org.springframework.remoting.support.RemoteInvocation;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2009-2-9
 * Time: 7:03:25
 */
public class StatefulRmiProxyFactoryBean extends RmiProxyFactoryBean {

	public Object invoke(MethodInvocation invocation) throws Throwable {
		System.out.println("!");
		return super.invoke(invocation);
	}

	protected RemoteInvocation createRemoteInvocation(MethodInvocation methodInvocation) {
		RemoteInvocation result = super.createRemoteInvocation(methodInvocation);
//		Object[] args = result.getArguments();
//		Object[] modifiedArgs = Arrays.copyOf(args, args.length + 1);
//		modifiedArgs[modifiedArgs.length - 1] = "HAHAHA??";
//		result.setArguments(modifiedArgs);
		result.setMethodName(result.getMethodName() + '|' + "HAHAHA!");
		return result;
	}
}
