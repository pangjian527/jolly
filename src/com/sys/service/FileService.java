package com.sys.service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import pub.spring.MultipartFileHolder;

import com.sys.dao.FileDao;
import com.sys.entity.File;


/**
 * Created by IntelliJ IDEA. User: zzl Date: 2009-1-8 Time: 9:29:26
 */
@Service("fileService")
@Transactional(readOnly = true)
public class FileService  {

	public File get(String id) {
		return fileDao.get(id);
	}


	@Transactional
	public String save(File file) {

		fileDao.save(file);
		return file.getId();
	}
	
	public File getWithoutContent(String id) {
		return fileDao.getWithoutContent(id);
	}

	public MultipartFile getAsMultipartFile(String fileId) {
		File file = get(fileId);
		MultipartFileHolder mfile = new MultipartFileHolder();
		mfile.setBytes(file.getContent());
		mfile.setOriginalFilename(file.getFileName());
		mfile.setContentType(file.getContentType());
		return mfile;
	}

	@Transactional
	public void delete(String id) {
		fileDao.delete(id);
	}
	
	public List<String> getIds(String tableName,String referenceId){
		return fileDao.getFileIds(tableName, referenceId);
	}
	public String getId(String tableName,String referenceId){
		List<String> ids = fileDao.getFileIds(tableName, referenceId);
		return ids.size() == 0 ? null : ids.get(0);
	}
	//myq add 2014-12-17，根据tableName+refId，更新 t_file表中的唯一一份文件数据，并清除旧数据
	public void setFile(String tableName, String refId, String fileId){
	/*String oldFileId = getId(tableName, refId);
	if(oldFileId == null){
		//当前没有附件，说明是新增的附件
		if(StrFuncs.notEmpty(fileId)){
			File newFile = get(fileId);
			newFile.setTableName(tableName);
			newFile.setReferenceId(refId);
			save(newFile);
		}
	}
	else{
		//当前有，检查是不变、替换、删除
		if(StrFuncs.isEmpty(fileId)){
			//删除
			delete(oldFileId);
		}
		else if(fileId.equals(oldFileId)){
			//delete(oldFileId);
			File newFile = get(fileId);
			newFile.setTableName(tableName);
			newFile.setReferenceId(refId);
			save(newFile);
		}
	}*/
		setFiles(tableName, refId, new String[]{fileId});
	}
	//myq add 2014-12-17，根据tableName+refId，更新 t_file表中的N份文件数据，并清除旧数据
	public void setFiles(String tableName, String refId, String[] fileIds){
		//a.预处理
		List<String> oldFileIds = getIds(tableName, refId);
		List<String> newIdList = Arrays.asList(fileIds);
		Set<String> differenceIds = new HashSet<String>();
		
		//b.执行删除
		differenceIds.addAll(oldFileIds);
		differenceIds.removeAll(newIdList);
		for(String fileId : differenceIds){
			delete(fileId);
		}
		
		//c.处理新增的数据
		differenceIds.clear();
		differenceIds.addAll(newIdList);
		differenceIds.removeAll(oldFileIds);
		for(String fileId : differenceIds){
			File file = get(fileId);
			if(file==null)
				continue;
			file.setReferenceId(refId);
			file.setTableName(tableName);
			save(file);
		}
	}
	
	public void deleteFiles(String tableName, String refId){
		fileDao.deleteFiles(tableName, refId);
	}

	/**
	 * 同时删除附件主表和附表
	 * @param fileId
	 */
	@Transactional
	@Deprecated
	public void deleteFileData(String fileId){
		fileDao.delete(fileId);
	}
	
	public List<File> getFileIds(String tableName,String referenceId){
		return fileDao.getWithoutContent(tableName, referenceId);
	}
	
	@Autowired
	private FileDao fileDao;

}
