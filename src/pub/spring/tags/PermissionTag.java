package pub.spring.tags;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.sys.entity.SysModule;

import pub.functions.StrFuncs;
import pub.web.ServletUtils;

public class PermissionTag extends BodyTagSupport {
	private String m;
	public String getM() {
		return m;
	}
	public void setM(String m) {
		this.m = m;
	}
	
	public int doStartTag() throws JspException {
		if(StrFuncs.isEmpty(m)){
			return EVAL_BODY_INCLUDE;
		}

		Set<String> moduleCodes = (Set<String>)ServletUtils.getSession().getAttribute("MODULE_CODES");
		for(String code : m.split(" ")){
			if(StrFuncs.notEmpty(code) && !moduleCodes.contains(code)){
				return SKIP_BODY;
			}
		}
		return EVAL_BODY_INCLUDE;
	}
	public int doEndTag() throws JspException {
		//System.out.println("doEndTag");  
        try {  
            if (bodyContent != null) {  
                bodyContent.writeOut(bodyContent.getEnclosingWriter());  
            }else{  
            }  
        } catch (IOException e) {  
            throw new JspTagException("IO ERROR:" + e.getMessage());  
        }  
        return EVAL_PAGE; 
	}
	 public void setBodyContent(BodyContent bodyContent) {   
        this.bodyContent = bodyContent;   
    } 
}
