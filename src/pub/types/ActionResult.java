package pub.types;

import java.io.Serializable;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 11-6-27
 */
public class ActionResult implements Serializable {
 
	private static final long serialVersionUID = -1496227779004770791L;
	private boolean success = true;
	private String msg;
	private Object data;

	public ActionResult() {
		//
	}

	public ActionResult(Object data) {
		this.data = data;
	}

	public void setResult(boolean success, String msg) {
		this.success = success;
		this.msg = msg;
	}

	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}

	public void fail(String msg) {
		setSuccess(false);
		setMsg(msg);
	}

	public void fail(Exception e) {
		fail("发生异常：" + e.getMessage());
	}
	
	public static ActionResult decode(String jsonText) {
		ActionResult result = new ActionResult();
		try {
			JSONObject json = JSONObject.fromObject(jsonText);
			result.setSuccess(json.getBoolean("success"));
			result.setData(json.get("data"));
			result.setMsg(json.getString("msg"));
		}
		catch (JSONException e) {
			e.printStackTrace();
			result.fail("解析异常: " + e.getMessage());
		}
		return result;
	}
}
