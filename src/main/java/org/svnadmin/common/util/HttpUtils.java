package org.svnadmin.common.util;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

/**
 * @ClassName: HttpUtils
 * @Description: Http网络操作
 * @author hpboys
 * @date 2015年6月10日 下午2:12:33
 * @version V1.0
 */
public class HttpUtils {
    private static Logger logger = Logger.getLogger(HttpUtils.class);

    /**
     * @Title: getDoGetFullUrl
     * @Description: 得到GET请求网站URL
     * @return String 返回类型
     */
    public static String getGetFullUrl(String url,String... postParams){
    	if(postParams!=null){
        	for (int i = 0; i < postParams.length; i=i+2) {
        		if(!url.contains("?") && i==0){
        			url += "?"+postParams[i]+"="+postParams[i+1];
        		}else{
        			url += "&"+postParams[i]+"="+postParams[i+1];
        		}
			}
        }
    	return url;
    }
    
    /**
     * @Title: getDoGetFullUrl
     * @Description: 得到GET请求网站URL
     * @return String 返回类型
     */
    public static String getGetFullUrl(String url,Map<String, ?> postParams){
    	if(postParams!=null){
    		int i = 0;
        	for (String key : postParams.keySet()) {
        		if(!url.contains("?") && i==0){
        			url += "?"+key+"="+String.valueOf(postParams.get(key));
        		}else{
        			url += "&"+key+"="+String.valueOf(postParams.get(key));
        		}
        		i++;
			}
        }
    	return url;
    }
    
    /**
     * 将请求中的参数封装成Map
     * @param request Http请求对象
     * @return 将所有请求参数封装为Map集合并返回
     */
    public static Map<String, String> getParams(HttpServletRequest request){
    	Map<String, String> params = new HashMap<String, String>();
    	for (String key : request.getParameterMap().keySet()) {
    		params.put(key, HttpUtils.urlDecode(request.getParameter(key), "UTF-8"));
		}
    	return params;
    }

    /**
     * 将请求中的参数封装成Map
     * @param request Http请求对象
     * @return 将所有请求参数封装为Map集合并返回
     */
    public static Map<String, Object> getParamters(HttpServletRequest request){
    	Map<String, Object> params = new HashMap<String, Object>();
    	for (String key : request.getParameterMap().keySet()) {
    		params.put(key, request.getParameter(key));
		}
    	return params;
    }
    
    /**
     * 将请求中的参数封装成Map
     * @param request Http请求对象
     * @return 将所有请求参数封装为Map集合并返回
     */
    public static Map<String, String> getParams(ServletRequest request){
    	Map<String, String> params = new HashMap<String, String>();
    	for (String key : request.getParameterMap().keySet()) {
    		params.put(key, HttpUtils.urlDecode(request.getParameter(key), "UTF-8"));
		}
    	return params;
    }
    
    /**
     * 将Session域中的参数封装成Map
     * @param session HttpSession请求对象
     * @return 
     */
    public static Map<String, Object> getParams(HttpSession session) {
    	Map<String, Object> params = new HashMap<String, Object>();
    	Enumeration<String> enumeration = session.getAttributeNames();
    	while(enumeration.hasMoreElements()){
    		String key = enumeration.nextElement();
    		params.put(key, session.getAttribute(key));
    	}
    	return params;
	}
    
	/**
	 * 得到客户端IP地址
	 * @param request
	 * @return
	 */
	public static String getRemoteIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
    
	/**
	 * isAjaxRequest:判断请求是否为Ajax请求. <br/>
	 * @param request 请求对象
	 * @return boolean
	 */
	public static boolean isAjaxRequest(HttpServletRequest request){
		String header = request.getHeader("X-Requested-With");
		boolean isAjax = "XMLHttpRequest".equals(header) ? true:false;
		return isAjax;
	}
	
	/**
	 * 进行UrlDecode解码
	 * @param text 字符串
	 * @param charset 编码
	 * @return
	 */
	public static String urlDecode(String text, String charset) {
		try {
			return URLDecoder.decode(text,charset);
		} catch (Exception e) {
			return text;
		}
	}
	
	/**
	 * 进行urlEncode加码
	 * @param text 字符串
	 * @param charset 编码
	 * @return
	 */
	public static String urlEncode(String text, String charset) {
		try {
			return URLEncoder.encode(text,charset);
		} catch (Exception e) {
			return text;
		}
	}
	
	/**
	 * @Title: inputStream2String
	 * @Description: 将InputStream转换为字符串
	 * @return String 返回类型
	 */
	public static String inputStream2String(InputStream is) {
		int i = -1;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			while ((i = is.read()) != -1) {
			    baos.write(i);
			}
			String content =  baos.toString();
			baos.flush();
			baos.close();
			return content;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @Description: 后台进行POST请求(请写在代码执行结尾)
	 * @return void  返回类型
	 */
	public static void doBgPostReq(HttpServletResponse response,String postUrl,Map<String, ?> paramMap) throws IOException {
		response.setContentType( "text/html;charset=utf-8");
	    PrintWriter out = response.getWriter();
	    out.println("<form name='postSubmit' method='post' action='"+postUrl+"' >"); 
	    for (String key : paramMap.keySet()) {
	    	out.println("<input type='hidden' name='"+key+"' value='" + paramMap.get(key)+ "'>");
		}
	    out.println("</form>");
	    out.println("<script>");
	    out.println("  document.postSubmit.submit()");
	    out.println("</script>");
	}

	/**
	 * 得到访问请求根域名
	 * @param request
	 * @return
	 */
	public static String getRootHost(HttpServletRequest request){
		return request.getRequestURL().toString().split(request.getRequestURI())[0];
	}

	/**
	 * 得到访问请求项目根域名
	 * @param request
	 * @return
	 */
	public static String getSysHost(HttpServletRequest request){
		return request.getRequestURL().toString().split(request.getRequestURI())[0] + request.getContextPath();
	}
	
	/**
     * 将请求中的参数封装成Map，并去掉前后空格
     * @param request Http请求对象
     * @return 将所有请求参数封装为Map集合并返回
     */
    public static Map<String, String> getTrimedParams(HttpServletRequest request){
    	Map<String, String> params = new HashMap<String, String>();
    	for (String key : request.getParameterMap().keySet()) {
    		params.put(key, HttpUtils.urlDecode(request.getParameter(key), "UTF-8").trim());
		}
    	return params;
    }
}
