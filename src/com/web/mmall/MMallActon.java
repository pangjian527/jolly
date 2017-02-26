package com.web.mmall;

import com.sys.entity.FactoryUser;
import com.web.common.action.BaseAction;
import com.web.mmall.consts.Consts;

public class MMallActon extends BaseAction{
	protected void setUser(FactoryUser user){
		request().getSession().setAttribute(Consts.FACTORY_USER_SESSION_KEY, user);
		
	}
	protected FactoryUser getUser(){
		return (FactoryUser)request().getSession().getAttribute( Consts.FACTORY_USER_SESSION_KEY);
		
	}
	protected void removeUser(){
		request().getSession().removeAttribute(Consts.FACTORY_USER_SESSION_KEY);
		
	}
}
