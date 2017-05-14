package org.svnadmin.common.web;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.svnadmin.common.entity.PushMsg;
import org.svnadmin.common.util.HttpUtils;
import org.svnadmin.common.util.PrintUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 基础控制器
 * @author Zoro
 * @datetime 2016/2/24 20:53
 * @since 1.0.0
 */
public class BaseController {

    protected Logger logger = Logger.getLogger(BaseController.class);

    /**
     * 全局异常控制,记录日志
     * @param ex
     * @param request
     * @return
     */
    @ExceptionHandler(Throwable.class)
    public String operateException(RuntimeException ex,HttpServletRequest request,HttpServletResponse rp) throws Exception{
        PrintUtils.print(request);
        logger.error(ex.getMessage(),ex);
        logger.info("************* ------ 异常信息已记录 ------- ***********");
        if(HttpUtils.isAjaxRequest(request)){
            rp.getWriter().print("{\"info\":\"抱歉，操作失败，请稍后重试！\",\"status\":false}");
            return "";
        }else{
            request.setAttribute("errorTips", ex.getMessage());
            return "common/exception";//需各端添加此文件
        }
    }

    /**
     * 推送消息到客户端
     * @param status
     * @return
     */
    public static PushMsg pushMsg(Boolean status){
        PushMsg pushMsg = new PushMsg();
        pushMsg.setArg1(0);//默认值
        pushMsg.setInfo(status? "恭喜，操作成功":"抱歉，操作失败！");
        pushMsg.setStatus(status);
        return pushMsg;
    }

    /**
     * 推送消息到客户端
     * @param info
     * @param status
     * @return
     */
    public static PushMsg pushMsg(Object info,Boolean status){
        PushMsg pushMsg = new PushMsg();
        pushMsg.setArg1(0);//默认值
        pushMsg.setInfo(info);
        pushMsg.setStatus(status);
        return pushMsg;
    }

    /**
     * 推送消息到客户端
     * @param info
     * @param status
     * @param entrys 附加属性值，Key：Value
     * @return
     */
    public static PushMsg pushMsg(Object info,Boolean status,Object... entrys){
        PushMsg pushMsg = new PushMsg();
        pushMsg.setArg1(0);//默认值
        pushMsg.setInfo(info);
        pushMsg.setStatus(status);
        for (int i = 0; i < entrys.length; i+=2) {
            pushMsg.getAttr().put(String.valueOf(entrys[i]), entrys[i+1]);
        }
        return pushMsg;
    }

    /**
     * 推送消息到客户端
     * @param info
     * @param status
     * @return
     */
    public static PushMsg pushMsg(Object info,Boolean status,int arg1){
        PushMsg pushMsg = new PushMsg();
        pushMsg.setArg1(arg1);//自定义值
        pushMsg.setInfo(info);
        pushMsg.setStatus(status);
        return pushMsg;
    }

    /**
     * 向指定Url进行重定向
     * @param url
     * @return
     */
    public String redirect(String url){
        return "redirect:"+url;
    }


}
