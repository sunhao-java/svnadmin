package org.svnadmin.util;

import org.svnadmin.common.util.SpringUtils;
import org.svnadmin.constant.SessionConstant;
import org.svnadmin.entity.Usr;
import org.svnadmin.service.UsrService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @描述: Session操作工具类.
 * @作者: Zoro.
 * @创建时间: 2016-04-19 17:58.
 * @版本: 1.0.0.
 */
public class SessionUtils {

    /**
     * 得到当前登录用户
     * @param session
     * @return
     */
    public static Usr getLogedUser(HttpSession session){
        Object object = session.getAttribute(SessionConstant.USER_SESSION_KEY);
        if(object!=null){
            if(object instanceof Usr){
                return (Usr)object;
            }
        }
        return null;
    }

    /**
     * 是否已登录
     */
    public static boolean isLogin(HttpServletRequest request) {
        Usr adminUser = SessionUtils.getLogedUser(request.getSession());
        return null != adminUser;
    }

    /**
     * @param session 请求
     * @return 当前登录的用户是否有管理员角色
     * @see org.svnadmin.constant.Constants#USR_ROLE_ADMIN
     * @see Usr#getRole()
     */
    public static boolean hasAdminRight(HttpSession session) {
        UsrService usrService = SpringUtils.getBean(UsrService.BEAN_NAME);
        return usrService.hasAdminRight(getLogedUser(session));
    }
}
