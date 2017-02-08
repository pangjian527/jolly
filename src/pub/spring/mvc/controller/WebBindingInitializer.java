package pub.spring.mvc.controller;

import java.util.Date;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

import pub.spring.BindingErrorProcessor;
import pub.spring.DateEditor;
import pub.spring.Validator;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-2-11
 * Time: 23:31:37
 */
public class WebBindingInitializer extends ConfigurableWebBindingInitializer {

	@Override
	public void initBinder(WebDataBinder binder, WebRequest request) {
		binder.setBindingErrorProcessor(new BindingErrorProcessor());
		super.initBinder(binder, request);

		binder.registerCustomEditor(Date.class, new DateEditor());

		Validator.staticValidator = getValidator();
	}
}
