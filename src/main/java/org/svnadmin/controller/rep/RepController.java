package org.svnadmin.controller.rep;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.svnadmin.common.entity.PageBean;
import org.svnadmin.common.util.HttpUtils;
import org.svnadmin.common.web.BaseController;
import org.svnadmin.entity.Ajax;
import org.svnadmin.entity.Pj;
import org.svnadmin.entity.PjAuth;
import org.svnadmin.entity.Usr;
import org.svnadmin.service.*;
import org.svnadmin.util.SessionUtils;
import org.svnadmin.util.UsrProvider;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

/**
 * SVN项目资源权限控制器
 * @author Zoro
 * @datetime 2016/5/20 19:48
 * @since 1.0.0
 */
@Controller
@RequestMapping("/")
public class RepController extends BaseController {

    @Autowired
    private UsrService usrService;
    @Autowired
    private PjService pjService;
    @Autowired
    private PjGrService pjGrService;
    @Autowired
    private PjAuthService pjAuthService;
    /**
     * 仓库服务层
     */
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private DefaultTreeService treeService;

    /**
     * 资源
     * @param session
     * @return
     */
    @RequestMapping(value = "repository", method = RequestMethod.GET)
    public String repository(HttpSession session,
                             @RequestParam("pj")String _pj,ModelMap map) {
        Pj pj = pjService.get(_pj);
        map.put("pj",pj);
        map.put("usrList", usrService.list());
        map.put("pjgrlist", pjGrService.list(_pj));
        map.put("pjreslist", pjAuthService.getResList(_pj));
        return "rep/repository";
    }

    /**
     * 项目资源树数据
     * @param request
     * @return
     */
    @RequestMapping(value = "repTree", method = RequestMethod.POST ,params = "action=data")
    @ResponseBody
    public Object repTree(HttpServletRequest request) {
        //treeId treeParentId pj path
        UsrProvider.setUsr(SessionUtils.getLogedUser(request.getSession()));
        Map<String, Object> params = HttpUtils.getParamters(request);
        Ajax ajax = treeService.execute(params);
        return ajax.getResult();
    }

    /**
     * 项目列表
     * @param request
     * @return
     */
    @RequestMapping(value = "repPathAuth", method = RequestMethod.GET ,params = "action=data")
    @ResponseBody
    public Object repPathAuth(HttpServletRequest request) {
        Map<String, String> params = HttpUtils.getParams(request);
        String pj = params.get("pj");
        String res = params.get("res");
        if(StringUtils.isBlank(res)){
            String path = params.get("path");//从rep 树点击进来，传递的是path
            if(StringUtils.isNotBlank(path)){
                res = this.pjAuthService.formatRes(pj, path);
            }
        }else{
//            res = entity.getRes();
        }
//        entity.setRes(res);
        List<PjAuth> list = pjAuthService.list(pj,res);
        PageBean<PjAuth> pageBean = new PageBean<>();
        pageBean.setDataList(list);
        pageBean.setRecordCount(list.size());
        return pageBean;
    }

    /**
     * 处理资源权限(添加)
     * @param request
     * @return
     */
    @RequestMapping(value = "repPathAuthAddHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object pjCreateHandler(HttpServletRequest request) {
        Map<String, String> params = HttpUtils.getParams(request);
        String pj = params.get("pj");
        String res = params.get("res");

        String[] grs = StringUtils.isEmpty(params.get("grs"))? null:params.get("grs").split(",");
        String[] usrs = StringUtils.isEmpty(params.get("usrs"))? null:params.get("usrs").split(",");

        String rw = params.get("rw");
        PjAuth entity = new PjAuth();
        entity.setPj(pj);
        entity.setRes(res);
        request.setAttribute("entity", entity);
        pjAuthService.save(pj, res, rw, grs, usrs);
        return pushMsg("操作资源权限成功", true);
    }

    /**
     * 处理资源权限(移除)
     * @param request
     * @return
     */
    @RequestMapping(value = "repPathAuthRemoveHandler", method = RequestMethod.POST)
    @ResponseBody
    public Object repPathAuthRemoveHandler(HttpServletRequest request) {
        Map<String, String> params = HttpUtils.getParams(request);
        String pj = params.get("pj");
        String gr = params.get("gr");
        String usr = params.get("usr");
        String res = params.get("res");

        if (StringUtils.isNotBlank(gr)) {
            pjAuthService.deleteByGr(pj, gr, res);
        } else if (StringUtils.isNotBlank(usr)) {
            pjAuthService.deleteByUsr(pj, usr, res);
        }
        return pushMsg("操作资源权限成功", true);
    }

}
