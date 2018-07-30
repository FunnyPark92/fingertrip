package com.ff.finger.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil.class); 
	
	@Resource(name="fileUploadProperties") //context-common에서 이름으로 찾아 객체 주입
	private Properties fileUploadProps;

	//업로드 폴더 구하는 메서드
	public String getUploadPath(HttpServletRequest request, int pathFlag) {
		String upPath = "";
		String type = fileUploadProps.getProperty("file.upload.type");

		if (type.equals("test")) { //테스트 경로
			if (pathFlag == CommonConstants.PATH_FLAG_PDS) {
				upPath = fileUploadProps.getProperty("file.upload.path.test");				
			} else if (pathFlag == CommonConstants.PATH_FLAG_IMAGE) {
				upPath = fileUploadProps.getProperty("imageFile.upload.path.test");				
			}
		} else if (type.equals("deploy")) { //실제 물리적인 경로 구하기
			if (pathFlag == CommonConstants.PATH_FLAG_PDS) {
				upPath = fileUploadProps.getProperty("file.upload.path");
			} else if (pathFlag == CommonConstants.PATH_FLAG_IMAGE) {
				upPath = fileUploadProps.getProperty("imageFile.upload.path");
			}
			upPath = request.getSession().getServletContext().getRealPath(upPath);
		}
		logger.info("업로드 경로: {}", upPath);
				
		return upPath;
	}

	//현재 시간을 밀리초까지 표현
	public String getCurrentTime() {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String today = sdf.format(d);
		logger.info("현재 시간(밀리초)-{}", today);
		
		return today;
	}
	
	//original 파일 이름을 unique한 파일 이름으로 변경하는 메서드
	//abc.txt => abc20180615112150123.txt
	public String getUniqueFileName(String originalFileName) {
		String fName = originalFileName.substring(0, originalFileName.lastIndexOf("."));
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String fileName = fName + getCurrentTime() + ext;
		logger.info("변경된 파일 이름: {}", fileName);
		
		return fileName;
	}
	
	//파일 업로드 처리하는 메서드
	public List<Map<String, Object>> fileUpload(HttpServletRequest request, int pathFlag) 
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
		
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		
		//파일 정보를 저장할 컬렉션
		List<Map<String, Object>> list = new ArrayList<>();
		
		Iterator<String> iter = fileMap.keySet().iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			MultipartFile tempFile = fileMap.get(key);
			
			//업로드된 파일이 있으면
			if (!tempFile.isEmpty()) {
				//업로드된 파일 정보 구하기
				String originalFileName = tempFile.getOriginalFilename();
				long fileSize = tempFile.getSize();
				String fileName = getUniqueFileName(originalFileName); //파일 이름 유니크하게 바꾸기
				
				//업로드 처리하기
				File file = new File(getUploadPath(request, pathFlag), fileName);
				tempFile.transferTo(file);
				
				//파일 정보를 map에 저장
				Map<String, Object> map = new HashMap<>();
				map.put("originalFileName", originalFileName);
				map.put("fileSize", fileSize);
				map.put("fileName", fileName);
				
				//map을 list에 저장
				list.add(map);
			}
		}
		
		return list;
	}
	
}
