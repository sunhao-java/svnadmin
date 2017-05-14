package org.svnadmin.common.util;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @author hpboys
 * @version V1.0
 * @ClassName: PrintUtils
 * @Description: 打印信息工具类
 * @date 2015年6月13日 下午2:04:43
 */
public class PrintUtils {

    public static Logger logger = Logger.getLogger(PrintUtils.class);

    /**
     * 打印请求情况 print(request, handler);
     *
     * @param request
     */
    public static String print (HttpServletRequest request, HandlerMethod handler) {
        // 打印请求情况
        String reqInfo = printForHandler(handler);
        reqInfo += printForRequest(request);
        logger.info("\n" + reqInfo);
        return reqInfo;
    }

    /**
     * 打印请求情况 print(request);
     *
     * @param request
     */
    public static String print (HttpServletRequest request) {
        // 打印请求情况
        String reqInfo = printForRequest(request);
        logger.info("\n" + reqInfo);
        return reqInfo;
    }

    private static String printForHandler (HandlerMethod handler) {
        if (handler == null) {
            return "";
        }
        StringBuilder handlerInfo = new StringBuilder("\n控制器类：" + handler.getBeanType().getName() + "." + handler.getMethod().getName() + "(" + handler.getBeanType().getSimpleName() + ".java:1)");
        handlerInfo.append("\n页面URL类方法名：" + handler.getMethod().getName());
        return handlerInfo.toString();
    }


    private static String printForRequest (HttpServletRequest request) {
        StringBuilder reqInfo = new StringBuilder("\n完整请求：" + getFullUrl(request));
        reqInfo.append("\n请求 方式：" + request.getMethod() + "  " + (isAjaxRequest(request) ? "Ajax请求" : "常规请求"));
        reqInfo.append("\n请求 URL：" + request.getRequestURI());
        String paramsTxt = "\n请求参数：[ ";
        int i = 0;
        for (String key : request.getParameterMap().keySet()) {
            String value = reqGetParam(request, key);
            if (i++ == 0) {
                paramsTxt += key + "=" + value;
            } else {
                paramsTxt += " | " + key + "=" + value;
            }
        }
        reqInfo.append(paramsTxt + "  ]");
        reqInfo.append("\n\n ================  请求参数信息结束  ================ ");
        return reqInfo.toString();
    }

    /**
     * @return String 返回类型
     * @throws
     * @Description: 超过指定长度，自动省略
     */
    private static String reqGetParam (HttpServletRequest req, String key) {
        String val = req.getParameter(key);
        int maxLength = 128;//允许显示最大长度
        if (val != null && val.length() > maxLength) {
            return val.substring(0, maxLength) + "...";
        }
        return val;
    }

    /**
     * 得到一个完整URL（包含参数）
     *
     * @param request
     * @return
     */
    public static String getFullUrl (HttpServletRequest request) {
        StringBuilder url = new StringBuilder();
        int i = 0;
        url.append(request.getRequestURL());
        for (String key : request.getParameterMap().keySet()) {
            if (i++ == 0) {
                url.append("?" + key + "=" + reqGetParam(request, key));
            } else {
                url.append("&" + key + "=" + reqGetParam(request, key));
            }
        }
        return url.toString();
    }

    /**
     * 得到一个请求的所有参数信息，参数值长度超过200则截断
     *
     * @param request
     * @return
     */
    public static String getUrlAllparams (HttpServletRequest request) {
        StringBuilder url = new StringBuilder();
        String value;
        for (String key : request.getParameterMap().keySet()) {
            value = request.getParameter(key);
            if (StringUtils.isNotEmpty(value) && value.length() > 200) {
                value = value.substring(0, 200) + "...";
            }
            url.append(key + "=" + value + "&");
        }
        return url.toString();
    }

    /**
     * isAjaxRequest:判断请求是否为Ajax请求. <br/>
     *
     * @param request 请求对象
     * @return boolean
     */
    private static boolean isAjaxRequest (HttpServletRequest request) {
        String header = request.getHeader("X-Requested-With");
        boolean isAjax = "XMLHttpRequest".equals(header) ? true : false;
        return isAjax;
    }

}
