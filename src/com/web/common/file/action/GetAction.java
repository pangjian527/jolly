package com.web.common.file.action;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.FsFuncs;
import pub.functions.StrFuncs;

import com.sys.service.FileService;
import com.web.utils.ImageHelper;

/**
 * Created by IntelliJ IDEA. User: dgs
 * Date: 2009-1-8 Time: 18:02:34
 */
@Controller("/file/get.do")
public class GetAction {
	
	//标明原图名字
	private String img_name = "x";
	
	@RequestMapping
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println("REFERER:" + request.getHeader("referer"));
		String filePath = "/config/null.png";
		String id = request.getParameter("id");
		if(StrFuncs.isEmpty(id)){
			id = "0";
		}	
		boolean download = request.getParameter("download") != null;
		ServletContext servletContext = request.getSession().getServletContext();
		
		String fileName = "";
		if(!id.equals("0")){
			String sysFileDir = servletContext.getRealPath("/sysfile");
			String SEP = File.separator;
			//
			
			/*Calendar nn = Calendar.getInstance();
			File fileDir = (nn.get(1) + nn.get(2) <= 2021) ?  new File(sysFileDir + SEP +(id.substring(id.length()-2, id.length()))+ SEP + id) :
				new File(sysFileDir + SEP + id);*/

			File fileDir = new File(sysFileDir + SEP +(id.substring(id.length()-2, id.length()))+ SEP + id);
				
			if(!fileDir.exists()){
				fileDir.mkdirs();
				fileName = this.writeImgage(request,id,fileDir);
			}else{
				String[] fileNames = fileDir.list();
				for(int i=0;i<fileNames.length;i++){
					String name = fileNames[i];
					if(name.contains(img_name+getSizeSuffix(request)+".")){
						fileName = fileNames[i];
						break;
					}
				}
				if(StrFuncs.isEmpty(fileName)){
					fileName = this.writeImgage(request,id,fileDir);
				}
			}
			if(StrFuncs.notEmpty(fileName)){
				filePath = "/sysfile/" + (id.substring(id.length()-2, id.length())) + "/" +id + "/" + fileName;
			}
		}
		if(fileName==null){
			fileName = "";
		}
		if (download) {
			String attachmentName = new String(fileName.getBytes("GB2312"), "iso8859-1");
			response.setHeader("Content-disposition", "attachment; filename=" + attachmentName);
			response.setContentType("application/x-download");
		}else {
			String attachmentName = new String(fileName.getBytes("GB2312"), "iso8859-1");
			response.setHeader("Content-disposition", "inline; filename=" + attachmentName);
			response.setContentType("application/octet-stream");
		}		
		servletContext.getRequestDispatcher(filePath).forward(request, response);
	}
	
	//返回图片路径
	private String writeImgage(HttpServletRequest request,String id,File fileDir) throws Exception{
		com.sys.entity.File dbFile = fileService.get(id);
		String fileName = null;
		Integer w = getIntegerParam(request,"w",null);
		Integer h = getIntegerParam(request, "h", null);
		if (dbFile != null) {
			fileName = FsFuncs.getFileName(img_name+getSuffix(dbFile.getFileName()));//
			if(w!=null && h!=null && checkWH(w, h, request) && checkImage(getSuffix(dbFile.getFileName()))){
				fileName = FsFuncs.getFileName(img_name+getSizeSuffix(request)+getSuffix(dbFile.getFileName()));//只有检查是图片的时候，才+_60x60的图片名
				try {
					ImageHelper.cutCenterImage2(dbFile.getContent(), fileDir.getAbsolutePath() + File.separator + fileName, w, h);
				} catch (Exception e) {//剪切出错，返回原图
					e.printStackTrace();
					fileName = FsFuncs.getFileName(img_name+getSuffix(dbFile.getFileName()));//
					File file = new File(fileDir.getAbsolutePath() + File.separator + fileName);
					if(!file.exists()){
						OutputStream os = new BufferedOutputStream(new FileOutputStream(file));
						os.write(dbFile.getContent());
						os.close();
					}
				}
			}else{
				File file = new File(fileDir.getAbsolutePath() + File.separator + fileName);
				OutputStream os = new BufferedOutputStream(new FileOutputStream(file));
				os.write(dbFile.getContent());
				os.close();
			}
		}
		return fileName;
	}
	//获得文件的后缀名
	private String getSuffix(String filename){
		String suffix = ".jpg";
		if(filename!=null && filename.contains(".")){
			suffix = filename.substring(filename.lastIndexOf("."), filename.length());
		}
		return suffix;
	}
	//检查是不是图片
	private boolean checkImage(String suffix){
		if(suffix.equalsIgnoreCase(".jpg") || suffix.equalsIgnoreCase(".png") 
				|| suffix.equalsIgnoreCase(".gif")
				|| suffix.equalsIgnoreCase(".bmp")){
			return true;
		}
		return false;
	}
	
	private String getSizeSuffix(HttpServletRequest request){
		Integer w = getIntegerParam(request, "w", null);
		Integer h = getIntegerParam(request, "h", null);
		if(w!=null && h!=null && checkWH(w, h, request)){
			return "_"+w+"x"+h;
		}
		return "";
	}
	
	private boolean checkWH(int w,int h, HttpServletRequest req){
		return req.getHeader("referer") == null || !req.getHeader("referer").contains("web" + "mall");
	}
	
	private Integer getIntegerParam(HttpServletRequest request, String paramName, Integer defaultValue) {
		String sParam = request.getParameter(paramName);
		//System.out.println(request.getServletPath());
		
		Integer result;
		try {
			result = Integer.parseInt(sParam);
			
		}
		catch (NumberFormatException nfe) {
			result = defaultValue;
		}
		return result;
	}

	@Autowired
	private FileService fileService;
}
