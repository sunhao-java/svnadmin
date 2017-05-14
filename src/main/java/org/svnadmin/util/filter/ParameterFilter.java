package org.svnadmin.util.filter;

import org.apache.log4j.Logger;
import org.svnadmin.common.util.PrintUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @ClassName: ParameterFilter
 * @Description: 特殊字符拦截过滤器
 * @author 
 * @date 2015年7月7日 下午8:24:59
 * @version V1.0
 */
@WebFilter(filterName="ParameterFilter",urlPatterns="/*")
public class ParameterFilter implements Filter {
	
	private static Logger logger = Logger.getLogger(ParameterFilter.class);

	public void doFilter(ServletRequest request, ServletResponse response,
						 FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest rq = (HttpServletRequest)request;
		HttpServletResponse rp = (HttpServletResponse)response;
		if(!rq.getRequestURI().contains(".")){
			PrintUtils.print(rq);
			if(rq.getRequestURI().endsWith("/")){
				rp.sendRedirect("login");
				return;
			}
		}
		filterChain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {}

	public void destroy() {}
}

