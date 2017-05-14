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
import org.svnadmin.entity.Pj;
import org.svnadmin.entity.PjUsr;
import org.svnadmin.entity.Usr;
import org.svnadmin.service.PjService;
import org.svnadmin.service.PjUsrService;
import org.svnadmin.service.UsrService;
import org.svnadmin.util.EncryptUtil;
import org.svnadmin.util.SessionUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * SVN项目用户管理控制器
 * @author Zoro
 * @datetime 2016/1/20 19:48
 * @since 1.0.0
 */
@Controller
@RequestMapping("/")
public class ProjectUsrController extends BaseController {

    @Autowired
    private UsrService usrService;
    @Autowired
    private PjService pjService;
    @Autowired
    private PjUsrService pjUsrService;

    /**
     * 项目用户列表
     * @param session
     * @return
     */
    @RequestMapping(value = "pjUsrList", method = RequestMethod.GET)
    public String pjUsrList(HttpSession session,@RequestParam("pj")String pj, ModelMap map) {
        // 账户
        List<Usr> usrList = usrService.list(pj);
        map.put("pj", pjService.get(pj));
        map.put("usrList", usrList);
        return "svn/pj_usr_list";
    }

    /**
     * 项目用户列表
     * @param session
     * @return
     */
    @RequestMapping(value = "pjUsrList", method = RequestMethod.GET, params = "action=data")
    @ResponseBody
    public Object pjUsrList(HttpSession session,@RequestParam("pj")String pj) {
        // 项目账户
        List<PjUsr> list = pjUsrService.list(pj);
        PageBean<PjUsr> pageBean = new PageBean<PjUsr>();
        pageBean.setRecordCount(list.size());
        pageBean.setDataList(list);
        return pageBean;
    }

    /**
     * 添加项目用户处理
     * @param request
     * @return
     */
    @AdminAuthPassport
    @RequestMapping(value = "pjUsrAddHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object pjUsrAddHandler(HttpServletRequest request,PjUsr entity) {
        Map<String, String> params = HttpUtils.getParams(request);
        if ("1".equals(params.get("defaultPswd"))) {
            entity.setPsw(usrService.get(entity.getUsr()).getPsw());
        } else {
            entity.setPsw(EncryptUtil.encrypt(entity.getPsw()));
        }
        pjUsrService.save(entity);
        return pushMsg("添加项目用户成功", true);
    }

    /**
     * 删除项目用户处理
     * @param request
     * @return
     */
    @AdminAuthPassport
    @RequestMapping(value = "pjUsrRemoveHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object pjUsrRemoveHandler(HttpServletRequest request,PjUsr entity) {
        Map<String, String> params = HttpUtils.getParams(request);
        if ("1".equals(params.get("defaultPswd"))) {
            entity.setPsw(usrService.get(entity.getUsr()).getPsw());
        } else {
            entity.setPsw(EncryptUtil.encrypt(entity.getPsw()));
        }
        pjUsrService.save(entity);
        return pushMsg("添加项目用户成功", true);
    }
}
