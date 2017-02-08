package pub.types;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-11-18
 */
public interface Action<T> {

	void execute(T param);

}
