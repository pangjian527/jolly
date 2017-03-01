package com.web.timer;

import pub.spring.BeanUtils;

import com.sys.service.BookformService;




public class FinishOrder {
	public void execute(){
		System.out.println("更新订单状态开始...");
		try {
			System.out.println("任务进行中...");
			BookformService bookFormService = BeanUtils.getBean(BookformService.class);
			bookFormService.autoFinishOrder();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("更新订单状态结束...");
	}
}
