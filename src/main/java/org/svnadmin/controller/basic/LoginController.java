package org.svnadmin.controller.basic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.svnadmin.common.annotation.AuthPassport;
import org.svnadmin.constant.SessionConstant;
import org.svnadmin.common.web.BaseController;
import org.svnadmin.entity.Usr;
import org.svnadmin.service.UsrService;
import org.svnadmin.util.I18N;

import javax.servlet.http.HttpServletRequest;

/**
 * @描述: 登录登出控制器.
 * @作者: Zoro.
 * @创建时间: 2016-05-08 12:52.
 * @版本: 1.0.0.
 */
@Controller
@RequestMapping("/")
public class LoginController extends BaseController{

    @Autowired
    private UsrService usrService;

    /**
     * SVN后台管理员登录页面
     */
    @AuthPassport
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(HttpServletRequest request, ModelMap map){
        map.put("lbe_usr_txt", I18N.getLbl(request, "usr.usr", "帐号"));
        map.put("lbe_psw_txt", I18N.getLbl(request,"usr.psw","密码"));
        map.put("btn_login_txt", I18N.getLbl(request,"login.btn.login","登录"));
        return "basic/login";
    }

    /**
     * 登录处理
     */
    @AuthPassport
    @RequestMapping(value = "loginHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object loginHandler(HttpServletRequest request,
                               @RequestParam("usr")String usr,
                               @RequestParam("psw")String psw){
        Usr loginUser = null;
        //登录
        try {
            loginUser = usrService.login(usr, psw);
            if (null == loginUser) {
                return pushMsg("用户名或密码错误！", false);
            }
        }catch (Exception ex){
            return pushMsg(ex.getMessage(), false);
        }
        request.getSession().setAttribute(SessionConstant.USER_SESSION_KEY, loginUser);
        return pushMsg("认证通过", true , "url" , "console");
    }

    /**
     * 登录退出处理
     */
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, ModelMap map){
        request.getSession().removeAttribute(SessionConstant.USER_SESSION_KEY);
        return redirect("login");
    }



}
