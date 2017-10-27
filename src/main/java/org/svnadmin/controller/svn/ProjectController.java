package org.svnadmin.controller.svn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.svnadmin.common.annotation.AdminAuthPassport;
import org.svnadmin.common.entity.PageBean;
import org.svnadmin.common.web.BaseController;
import org.svnadmin.entity.Pj;
import org.svnadmin.entity.Usr;
import org.svnadmin.service.PjService;
import org.svnadmin.service.UsrService;
import org.svnadmin.util.SessionUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * SVN项目管理控制器
 * @author Zoro
 * @datetime 2016/1/20 19:48
 * @since 1.0.0
 */
@Controller
@RequestMapping("/")
public class ProjectController extends BaseController {

    @Autowired
    private UsrService usrService;
    @Autowired
    private PjService pjService;

    /**
     * 项目列表
     * @param session
     * @return
     */
    @RequestMapping(value = "pjList", method = RequestMethod.GET)
    public String pjList(HttpSession session, ModelMap map) {
        boolean hasAdminRight = SessionUtils.hasAdminRight(session);
        List<Pj> list = null;
        if (hasAdminRight) {
            list = pjService.list();// 所有项目
        }
        else {
            list = pjService.list(SessionUtils.getLogedUser(session).getUsr());// 登录用户可以看到的项目
        }
        PageBean<Pj> pageBean = new PageBean<Pj>();
        pageBean.setRecordCount(list.size());
        pageBean.setDataList(list);
        map.put("pageBean", pageBean);
        return "svn/pj_list";
    }

    /**
     * 项目列表数据
     * @param session
     * @return
     */
    @RequestMapping(value = "pjList", method = RequestMethod.GET ,params = "action=data")
    @ResponseBody
    public Object pjListDataSet(HttpSession session,@RequestParam("pageNumber")int pageNumber) {
        PageBean<Usr> pageBean = new PageBean<Usr>(pageNumber,10);
//        usrService.queryForPageBean(pageBean);
        return pageBean;
    }

    /**
     * 创建项目
     * @param request
     * @return
     */
    @AdminAuthPassport
    @RequestMapping(value = "pjCreate", method = RequestMethod.GET)
    public String pjCreate(HttpServletRequest request, ModelMap map,
                           @RequestParam(defaultValue = "new") String type) {
        map.put("type", type);
        return "svn/pj_create";
    }

    /**
     * 创建项目处理
     * @param session
     * @return
     */
    @AdminAuthPassport
    @RequestMapping(value = "pjCreateHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object pjCreateHandler(HttpSession session,Pj entity,
                                  @RequestParam(defaultValue = "new") String addType) {

        String typeMsg = addType.equals("new")? "创建": "导入现有";

        try {
            pjService.save(entity, addType);
            return pushMsg(typeMsg + "项目成功", true , "url" , "pjList");
        }catch (Exception e){
            logger.error(typeMsg + "项目提交失败",e);
            return pushMsg(typeMsg + "项目失败，"+e.getMessage(), true);
        }
    }


}
