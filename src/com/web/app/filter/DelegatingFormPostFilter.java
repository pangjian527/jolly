package com.web.app.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 2010-2-12
 * Time: 3:50:02
 */
public class DelegatingFormPostFilter implements Filter {

	public void init(FilterConfig config) throws ServletException {
		// do nothing
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
						 FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) servletRequest;
		String op = request.getParameter("op");
		if (op != null && op.length() > 0 && "POST".equals(request.getMethod())) {
			String path = request.getServletPath();
			int pos = path.lastIndexOf('/');
			path = path.substring(0, pos + 1) + "operate.do";
			request.getRequestDispatcher(path).forward(request, servletResponse);
		}
		else {
			chain.doFilter(servletRequest, servletResponse);
		}
	}

	public void destroy() {
		// do nothing
	}
}
