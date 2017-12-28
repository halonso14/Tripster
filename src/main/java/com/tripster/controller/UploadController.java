package com.tripster.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tripster.service.ContentsReviewService;
import com.tripster.service.MemberService;
import com.tripster.util.MediaUtils;
import com.tripster.util.UploadFileUtils;

@Controller
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	// 업로드 위치 경로
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private MemberService memberService;
	

	@RequestMapping(value="/uploadAjax",method=RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	// ajax로 파일 받기
	@ResponseBody
	@RequestMapping(value="/uploadAjax",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> upload(MultipartFile file) throws Exception{
		logger.info("get file in controller");
		logger.info(file.getOriginalFilename());
		logger.info("size:"+file.getSize());
		logger.info(file.getContentType());
		
		// uploadFile 메소드에서 파일 생성후 파일 이름 리턴
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),HttpStatus.OK);
		
	}
	
	// 업로드한 파일 보여주기
	@ResponseBody
	@RequestMapping(value="displayFile",method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("File name : " + fileName);
		
		try {
			// 확장자 추출 
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			// 확장자 타입 저장 ( 이미지 파일인지 검사 )
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			// 업로드 경로와 파일이름을 찾아서 저장
			in = new FileInputStream(uploadPath + fileName);
			// 확장자 검사
			if(mType != null) {
				// 썸네일 이름일 경우 적절한 MIME 타입 지정
				headers.setContentType(mType);
			}else {
				// 썸네일 이름이 아닐경우 자동 다운로드
				fileName = fileName.substring(fileName.indexOf("_")+1);
				// 한글 인코딩
				headers.add("Content-Disposition", "attachment;filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			}
			
			// IOUtils.toByteArray(in):대상파일에서 데이터를 읽음,header에서 데이터 타입결정  
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
			
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			
		}finally {
			in.close();
		}
		
		return entity;
	}
	
	@Inject
	ContentsReviewService service;
	
	// 디비에서 파일 가져오기
	@RequestMapping(value="/getFileName",method=RequestMethod.POST)
	public ResponseEntity<List<String>> getAttach(Integer reviewID){
		
		logger.info("reviewID:"+reviewID);
		
		ResponseEntity<List<String>> entity = null;
		
		try {
			List<String> fileNames = service.getFileNames(reviewID);
			logger.info("fileNames:"+fileNames.toString());
			entity = new ResponseEntity<List<String>>(fileNames,HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			//오류 발생 시, BAR_REQUEST 상태 입력
			entity = new ResponseEntity<List<String>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	// 업로드 삭제
	@RequestMapping(value="/contents/restaurantDetail/deleteFile",method=RequestMethod.POST)
	public ResponseEntity<String> delete(String fileName){
		
		logger.info("delete fileName:"+fileName);
		
		// 파일 형식 저장
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			
			// 이미지 파일일 경우 s_ 삭제
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			// 파일의 전체 경로를 받아 삭제
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
	
		}else {
			
			// 일반 파일일 경우 uploadPath(업로드 경로)를 받아 삭제
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
			
		}
		
		return new ResponseEntity<String> ("result",HttpStatus.OK);
		
	}
}

