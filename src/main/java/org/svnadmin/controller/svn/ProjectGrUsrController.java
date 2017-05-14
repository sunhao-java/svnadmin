package org.svnadmin.controller.svn;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.svnadmin.common.annotation.AdminAuthPassport;
import org.svnadmin.common.entity.PageBean;
import org.svnadmin.common.util.HttpUtils;
import org.svnadmin.common.web.BaseController;
import org.svnadmin.entity.PjGrUsr;
import org.svnadmin.entity.PjUsr;
import org.svnadmin.entity.Usr;
import org.svnadmin.service.PjGrUsrService;
import org.svnadmin.service.PjService;
import org.svnadmin.service.PjUsrService;
import org.svnadmin.service.UsrService;
import org.svnadmin.util.EncryptUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * SVN项目用户组管理控制器
 * @author Zoro
 * @datetime 2016/1/20 19:48
 * @since 1.0.0
 */
@Controller
@RequestMapping("/")
public class ProjectGrUsrController extends BaseController {

    @Autowired
    private UsrService usrService;
    @Autowired
    private PjService pjService;
    @Autowired
    private PjUsrService pjUsrService;
    @Autowired
    private PjGrUsrService pjGrUsrService;

    /**
     * 项目组用户列表
     * @param session
     * @return
     */
    @RequestMapping(value = "pjGrUsrList", method = RequestMethod.GET)
    public String pjGrUsrList(HttpSession session,
                              @RequestParam("pj")String pj,
                              @RequestParam("gr")String gr,ModelMap map) {
        // 账户
        map.put("pj", pj);
        map.put("gr", gr);
        map.put("usrList", usrService.listUnSelected(pj, gr));
        return "svn/pj_gr_usr_list";
    }

    /**
     * 项目组用户列表（数据集）
     * @param session
     * @return
     */
    @RequestMapping(value = "pjGrUsrList", method = RequestMethod.GET, params = "action=data")
    @ResponseBody
    public Object pjGrUsrList(HttpSession session,
                              @RequestParam("pj")String pj,
                              @RequestParam("gr")String gr) {
        //组用户账户
        List<PjGrUsr> list = pjGrUsrService.list(pj, gr);
        PageBean<PjGrUsr> pageBean = new PageBean<PjGrUsr>();
        pageBean.setRecordCount(list.size());
        pageBean.setDataList(list);
        return pageBean;
    }

    /**
     * 添加项目组用户处理
     * @param request
     * @return
     */
    @AdminAuthPassport
    @RequestMapping(value = "pjGrUsrAddHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object pjGrUsrAddHandler(HttpServletRequest request) {
        Map<String, String> params = HttpUtils.getParams(request);
        String pj = params.get("pj");
        String gr = params.get("gr");
        String[] usrs = StringUtils.isEmpty(params.get("usrs"))? null:params.get("usrs").split(",");
        this.pjGrUsrService.save(pj, gr, usrs);
        return pushMsg("添加项目组用户成功", true);
    }

    /**
     * 删除项目组用户处理
     * @param request
     * @return
     */
    @AdminAuthPassport
    @RequestMapping(value = "pjGrUsrRemoveHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object pjGrUsrRemoveHandler(HttpServletRequest request) {
        Map<String, String> params = HttpUtils.getParams(request);
        String pj = params.get("pj");
        String gr = params.get("gr");
        String usr = params.get("usr");
        this.pjGrUsrService.delete(pj, gr, usr);
        return pushMsg("删除项目组用户成功", true);
    }
}
