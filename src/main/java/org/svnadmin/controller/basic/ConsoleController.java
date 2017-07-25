package org.svnadmin.controller.basic;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.svnadmin.common.entity.PageBean;
import org.svnadmin.common.web.BaseController;
import org.svnadmin.entity.Pj;
import org.svnadmin.entity.PjAuth;
import org.svnadmin.entity.Usr;
import org.svnadmin.service.PjService;
import org.svnadmin.service.UsrService;
import org.svnadmin.util.SessionUtils;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 控制台控制器
 * @author Zoro
 * @datetime 2016/1/20 19:48
 * @since 1.0.0
 */
@Controller
@RequestMapping("/")
public class ConsoleController extends BaseController {

    @Autowired
    private UsrService usrService;
    @Autowired
    private PjService pjService;

    /**
     * 控制台主页
     * @param session
     * @return
     */
    @RequestMapping(value = "console", method = RequestMethod.GET)
    public String console(HttpSession session, ModelMap map) {
        boolean hasAdminRight = SessionUtils.hasAdminRight(session);
        if(hasAdminRight){
            //管理员登录可查看
            return redirect("pjList");
        }else{
            //普通登录可查看
            return redirect("usrRightListView");
        }
    }

}
