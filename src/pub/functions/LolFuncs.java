package pub.functions;

import java.util.Date;

/**
 * 
 */
@SuppressWarnings("unchecked")
public class LolFuncs {

	
	//订单状态(0 待确认、1 已确认、2 已完成、3 撤销)
	public static String parseBookstatus(Integer status) {	
		String statusstr = "";
		if(status == 0){
			statusstr = "已提交，等待客服确认";
		}else if(status == 1){
			statusstr = "已确认";
		}else if(status == 2){
			statusstr = "已完成";
		}else if(status == 3){
			statusstr = "撤销";
		}else{
			statusstr = "错误状态";
		}
		return statusstr;
	}
	
	public static int dayDiff(Date startDate, Date endDate){
		int leftDay = 0;
		try {
			if(startDate!=null && endDate!=null && endDate.getTime()>startDate.getTime()){
				leftDay = DateFuncs.dateSeparateDate(startDate, endDate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return leftDay;
	}
	
	public static String dateDiff(Date startDate, Date endDate){
		String leftDayTime = "";
		try {
			if(startDate!=null && endDate!=null && endDate.getTime()>startDate.getTime()){
				leftDayTime = DateFuncs.dateDiff(startDate, endDate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return leftDayTime;
	}
}
