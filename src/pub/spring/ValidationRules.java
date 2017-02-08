package pub.spring;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-2-15
 * Time: 2:52:38
 */
public interface ValidationRules {
	Object getBean();

	ValidationRules getNestedRules(String path);
	ValidationRules on(String field);
	ValidationRules required();
	ValidationRules required(String errorMsg);
	ValidationRules min(Object valueToCompare);
	ValidationRules min(Object valueToCompare, String errorMsg);
	ValidationRules max(Object valueToCompare);
	ValidationRules max(Object valueToCompare, String errorMsg);
	ValidationRules telno();
	ValidationRules telno(String errorMsg);
	ValidationRules minLength(int minLength);
	ValidationRules minLength(int minLength, String errorMsg);
	ValidationRules maxLength(int maxLength);
	ValidationRules maxLength(int maxLength, String errorMsg);
	//remote for js?
	ValidationRules custom(CustomValidationRule rule);
	ValidationRules number();
	ValidationRules number(String errorMsg);
	ValidationRules integer();
	ValidationRules integer(String errorMsg);
	//date
	//regex
	ValidationRules email();
	ValidationRules email(String errorMsg);
	ValidationRules digits();
	ValidationRules digits(String errorMsg);
	//???
	ValidationRules url();
	ValidationRules url(String errorMsg);
}
