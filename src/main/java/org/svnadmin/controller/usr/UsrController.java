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
import org.svnadmin.common.web.BaseController;
import org.svnadmin.entity.Pj;
import org.svnadmin.entity.PjAuth;
import org.svnadmin.service.PjService;
import org.svnadmin.service.UsrService;
import org.svnadmin.entity.Usr;
import org.svnadmin.util.EncryptUtil;
import org.svnadmin.util.I18N;
import org.svnadmin.util.SessionUtils;

import javax.servlet.http.HttpSession;
import java.util.List;

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



}
