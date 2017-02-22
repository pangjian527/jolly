package com.web.mmall;

import com.sys.entity.FactoryUser;
import com.web.common.action.BaseAction;
import com.web.mmall.consts.Consts;

public class MMallActon extends BaseAction{
	protected FactoryUser getUser(){
		return (FactoryUser)request().getSession().getAttribute( Consts.FACTORY_USER_SESSION_KEY);
		
	}
}
