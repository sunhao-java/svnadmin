package org.svnadmin.servlet;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.svnadmin.common.util.HttpUtils;
import org.svnadmin.common.util.PropUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * @author hpboys
 * @version V1.0
 * @ClassName: StartupLoddingServlet
 * @Description: 系统启动时加载数据
 * @date 2015年6月8日 下午10:19:30
 */
@WebServlet(urlPatterns = "/init", loadOnStartup = 2)
public class StartupLoddingServlet extends HttpServlet {

    private Logger logger = Logger.getLogger(StartupLoddingServlet.class);

    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        ServletContext context = getServletContext();
        String sysPath = PropUtils.get("setting.sys_path");
        String sysName = HttpUtils.urlDecode(PropUtils.get("setting.sys_name"), "utf-8");
        context.setAttribute("sysName", sysName);
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

        context.setAttribute("assetsPath", prefix + "assets");
        context.setAttribute("framePath", prefix + "assets/hui");
        context.setAttribute("appPath", prefix + "assets/admin");
        logger.info("load setting finish，the servletContextName is " + context.getServletContextName());
    }
}
