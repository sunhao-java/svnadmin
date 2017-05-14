package org.svnadmin.servlet;
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
        context.setAttribute("assetsPath", "/" + sysPath + "/assets");
        context.setAttribute("framePath", "/" + sysPath + "/assets/hui");
        context.setAttribute("appPath", "/" + sysPath + "/assets/admin");
        logger.info("load setting finish，the servletContextName is " + context.getServletContextName());
    }
}
