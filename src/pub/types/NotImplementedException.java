package pub.types;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-5-1
 * Time: 0:28:38
 */
public class NotImplementedException  extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public NotImplementedException() {
		//
	}

	public NotImplementedException(String message) {
		super(message);
	}

}
