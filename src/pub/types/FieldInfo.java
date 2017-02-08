package pub.types;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-2-14
 * Time: 2:40:10
 */
@Target({FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface FieldInfo {

    String desc();
	int order();

}
