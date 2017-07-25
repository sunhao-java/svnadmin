package org.svnadmin.controller.usr;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.svnadmin.common.annotation.AdminAuthPassport;
import org.svnadmin.common.entity.PageBean;
import org.svnadmin.common.util.HttpUtils;
import org.svnadmin.common.web.BaseController;
import org.svnadmin.entity.Pj;
import org.svnadmin.entity.PjAuth;
import org.svnadmin.entity.PjUsr;
import org.svnadmin.service.PjService;
import org.svnadmin.service.PjUsrService;
import org.svnadmin.service.UsrService;
import org.svnadmin.entity.Usr;
import org.svnadmin.util.EncryptUtil;
import org.svnadmin.util.I18N;
import org.svnadmin.util.SessionUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * SVN用户管理控制器
 * @author Zoro
 * @datetime 2016/1/20 19:48
 * @since 1.0.0
 */
@Controller
@RequestMapping("/")
public class UsrController extends BaseController {

    @Autowired
    private UsrService usrService;
    @Autowired
    private PjService pjService;
    @Autowired
    private PjUsrService pjUsrService;

    /**
     * 用户列表
     * @param session
     * @return
     */
    @RequestMapping(value = "usrList", method = RequestMethod.GET)
    public String usrList(HttpSession session, ModelMap map) {
        return "usr/usr_list";
    }

    /**
     * 用户列表数据
     * @param session
     * @return
     */
    @RequestMapping(value = "usrList", method = RequestMethod.GET ,params = "action=data")
    @ResponseBody
    public Object usrListDataSet(HttpSession session) {
        List<Usr> list = usrService.list();
        PageBean<Usr> pageBean = new PageBean<Usr>();
        pageBean.setRecordCount(list.size());
        pageBean.setDataList(list);
        return pageBean;
    }

    /**
     * 创建用户处理
     * @param session
     * @return
     */
    @AdminAuthPassport
    @RequestMapping(value = "usrCreateHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object usrCreateHandler(HttpSession session,Usr entity) {
        try {
            entity.setPsw(EncryptUtil.encrypt(entity.getPsw()));
            usrService.save(entity);
            return pushMsg("创建用户成功", true , "url" , "usrList");
        }catch (Exception e){
            logger.error("创建用户提交失败",e);
            return pushMsg("创建用户失败，"+e.getMessage(), true);
        }
    }

    /**
     * 删除用户处理
     * @param session
     * @return
     */
    @AdminAuthPassport
    @RequestMapping(value = "usrRemoveHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object usrRemoveHandler(HttpSession session,String usr) {
        if(!SessionUtils.hasAdminRight(session)){
            return pushMsg("你没有权限删除用户!", false);
        }
        if (SessionUtils.getLogedUser(session).getUsr().equals(usr)) {// 当前用户
            return pushMsg("不能删除自己!", false);
        }
        usrService.delete(usr);
        return pushMsg(true);
    }

    /**
     * 查看用户权限
     * @param session
     * @return
     */
    @RequestMapping(value = "usrRightList", method = RequestMethod.GET, params = "action=data")
    @ResponseBody
    public Object usrRightListDataSet(HttpSession session,String usr) {
        //查看用户权限
        if(StringUtils.isBlank(usr)){
            usr = SessionUtils.getLogedUser(session).getUsr();
        }
        List<PjAuth> auths = this.usrService.getAuths(usr);
        PageBean<PjAuth> pageBean = new PageBean<PjAuth>();
        pageBean.setRecordCount(auths.size());
        pageBean.setDataList(auths);
        return pageBean;
    }


    /**
     * 查看用户权限
     * @param session
     * @return
     */
    @RequestMapping(value = "usrRightListView", method = RequestMethod.GET)
    public String usrRightListDataSet(HttpSession session) {
        //查看用户权限
        return "usr/usr_auth";
    }

    /**
     * 用户更改密码
     * @param session
     * @return
     */
    @RequestMapping(value = "updatePswd", method = RequestMethod.GET)
    public String updatePswd(HttpSession session, ModelMap map) {
        return "usr/usr_update_pswd";
    }

    /**
     * 用户更改密码处理
     * @param request
     * @return
     */
    @RequestMapping(value = "usrUpdatePswdHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object pjUsrAddHandler(HttpServletRequest request) {
        Usr usr = SessionUtils.getLogedUser(request.getSession());
        Map<String, String> params = HttpUtils.getParams(request);
        //验证老密码和新密码
        String oldPsw = params.get("oldPsw");
        if(usr.getPsw().equals(EncryptUtil.encrypt(oldPsw))){
            //验证老密码通过
            //验证老密码和新密码是否一致
            String newPsw = params.get("newPsw");
            if(usr.getPsw().equals(EncryptUtil.encrypt(newPsw))){
                return pushMsg("新密码不能和老密码保持一致", false);
            }
            //更新用户登录密码
            usr.setPsw(EncryptUtil.encrypt(newPsw));
            usrService.save(usr);
            //更新用户项目认证密码
            List<Pj> pjList = usrService.getPjList(usr.getUsr());
            for (Pj pj : pjList) {
                PjUsr pjUsr = new PjUsr();
                pjUsr.setUsr(usr.getUsr());
                pjUsr.setPj(pj.getPj());
                pjUsr.setPsw(EncryptUtil.encrypt(newPsw));
                pjUsrService.save(pjUsr);
            }
            return pushMsg("用户项目认证密码修改成功", true);
        }else{
            return pushMsg("您输入的老密码有误", false);
        }
    }

}
