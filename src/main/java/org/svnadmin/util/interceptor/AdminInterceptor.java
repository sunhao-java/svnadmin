package org.svnadmin.util.interceptor;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.svnadmin.common.annotation.AdminAuthPassport;
import org.svnadmin.common.annotation.AuthPassport;
import org.svnadmin.common.entity.PushMsg;
import org.svnadmin.common.util.HttpUtils;
import org.svnadmin.common.util.PropUtils;
import org.svnadmin.util.JSONUtils;
import org.svnadmin.util.SessionUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;


/**
 * @author hpboys
 * @version V1.0
 * @ClassName: AdminInterceptor
 * @Description: 后台拦截器
 * @date 2016年4月17日 下午7:17:56
 */
public class AdminInterceptor extends HandlerInterceptorAdapter {

    private Logger logger = Logger.getLogger(AdminInterceptor.class);

    private final static String LOGIN_URL = "login";//登录页面
    private final static String CONSOLE_URL = "pjList";//控制台页面

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        HandlerMethod auth = (HandlerMethod) handler;
        AuthPassport authPassport = auth.getMethodAnnotation(AuthPassport.class);
        String prefix = getPrefix(PropUtils.get("setting.sys_path"));
        if (null != authPassport) {
            if (SessionUtils.isLogin(request)) {
                //去控制台页面
                response.sendRedirect(prefix + CONSOLE_URL);
                return false;
            }
        } else {
            //是否已经登录
            if (!SessionUtils.isLogin(request)) {
                //去登录页面
                response.sendRedirect(prefix + LOGIN_URL);
                return false;
            }
        }
        //鉴权
        AdminAuthPassport adminAuth = auth.getMethodAnnotation(AdminAuthPassport.class);
        if (null != adminAuth) {
            if (!SessionUtils.hasAdminRight(session)) {
                if (HttpUtils.isAjaxRequest(request)) {
                    PushMsg authMsg = new PushMsg("对不起，你无权访问该功能", false);
                    PrintWriter writer = response.getWriter();
                    writer.println(JSONUtils.toJson(authMsg));
                    writer.flush();
                    writer.close();
                } else {
                    //无权限页面
                    request.getRequestDispatcher("/WEB-INF/views/common/not_auth.jsp").forward(request, response);
                }
                return false;
            }
        }
        return true;
    }

    private String getPrefix(String sysPath) {
        //设置系统应用根目录
        String prefix = "";
        if (StringUtils.isBlank(sysPath) || StringUtils.equals("/", sysPath)) {
            // 空 或者 /
            prefix = "/";
        }
        if (!StringUtils.endsWith(sysPath, "/")) {
            // 不是/ 结尾的
            prefix = sysPath + "/";
        }
        if (!StringUtils.startsWith(sysPath, "/")) {
            // 不是/ 开头的
            prefix = "/" + sysPath;
        }

        return prefix;
    }

}
