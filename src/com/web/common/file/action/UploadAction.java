package com.web.common.file.action;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;




import pub.functions.StrFuncs;

import com.sys.entity.File;
import com.sys.service.FileService;
import com.web.common.action.BaseAction;

/**
 * 附件上传
 * @author zhangz
 *
 */
@Controller
public class UploadAction extends BaseAction{

	@RequestMapping
	public String upload(HttpServletRequest request,HttpServletResponse response,
			@RequestParam MultipartFile fileUpload) throws Exception{
		try {
			InputStream is = fileUpload.getInputStream();
			
			File files = new File();
			
			files.setFileName(fileUpload.getOriginalFilename());
			files.setFileSize( ((Long)fileUpload.getSize()).intValue());
			files.setContent(fileUpload.getBytes());
			files.setUploadTime(new Date());
			files.setContentType(fileUpload.getContentType());
			String fileId = baseInfo.save(files);
			File fileWithoutContent = baseInfo.getWithoutContent(fileId);
			this.writeJson(fileWithoutContent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	
	@RequestMapping
	public String get(HttpServletRequest request,HttpServletResponse response,String ids) throws Exception{
		try {
			if(StrFuncs.isEmpty(ids)){
				this.writeJson(new File[0]);
				return null;
			}
			String[] fileIds = ids.split(",");
			
			List<File> infos = new ArrayList<File>();
			
			for (int i = 0; i < fileIds.length; i++) {
				File file = baseInfo.getWithoutContent(fileIds[i]);
				infos.add( file);
			}
			
			this.writeJson(infos);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	/**
	 * 文件上传组件发起
	 * @param request
	 * @param response
	 * @param fileId
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping
	public String delete(HttpServletRequest request,HttpServletResponse response,String fileId) throws Exception{
		try {
			File file = baseInfo.get(fileId);
			if(file!=null){
				baseInfo.deleteFileData(fileId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Autowired
	private FileService baseInfo;
	
}
