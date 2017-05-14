package org.svnadmin.common.entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class PushMsg  implements Serializable {
	private Object info;// 主信息
	private Boolean status;// 状态
	private String code;//CODE状态
	private int arg1;//附加值
	private Map<String, Object> attr = new HashMap<String, Object>();

	public PushMsg() {}
	
	public PushMsg(Boolean status) {
		this.status = status;
	}

	public PushMsg(String info, Boolean status) {
		this.info = info;
		this.status = status;
	}
	
	public PushMsg(Object info, Boolean status) {
		this.info = info;
		this.status = status;
	}
	
	public PushMsg(String info, String code) {
		this.info = info;
		this.code = code;
	}

	public PushMsg(String info, Boolean status, String code) {
		this.info = info;
		this.status = status;
		this.code = code;
	}
	
	public PushMsg(Object info, String code) {
		this.info = info;
		this.code = code;
	}
	
	public PushMsg(Object info,Boolean status,Object... entrys){
		this.arg1 = 0;
		this.info = info;
		this.status = status;
		for (int i = 0; i < entrys.length; i+=2) {
			this.getAttr().put(String.valueOf(entrys[i]), entrys[i+1]);
		}
	}

	public Object getInfo() {
		return info;
	}

	public void setInfo(Object info) {
		this.info = info;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public int getArg1() {
		return arg1;
	}

	public void setArg1(int arg1) {
		this.arg1 = arg1;
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	/** 
	 * 加入反馈属性
	 * @return
	 */
	public Map<String, Object> getAttr() {
		return attr;
	}

	public void setAttr(Map<String, Object> attr) {
		this.attr = attr;
	}

	/**
	 * 得到消息对象
	 * @param info
	 * @param status
	 * @return
	 */
	public static PushMsg getPushMsg(String info, Boolean status) {
		PushMsg msg = new PushMsg();
		msg.setInfo(info);
		msg.setStatus(status);
		return msg;
	}

}
