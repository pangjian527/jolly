package com.web.pmanager;

import javax.servlet.http.HttpServletRequest;

import com.sys.entity.SysUser;
import com.web.common.action.ManageAction;
import com.web.pmanager.consts.Consts;

public abstract class PManagerAction<T> extends ManageAction<T>{
	protected SysUser getUser(HttpServletRequest request) {
		return (SysUser)request.getSession().getAttribute(Consts.USER_SESSION_KEY);
	}
}
