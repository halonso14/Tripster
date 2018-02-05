package com.tripster.controller;

import java.io.File;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tripster.domain.MemberVO;
import com.tripster.service.ContentsReviewService;
import com.tripster.service.MemberService;
import com.tripster.util.MediaUtils;
import com.tripster.util.S3Util;
import com.tripster.util.UploadFileUtils;

@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

//	@Resource(name = "uploadPath")
//	private String uploadPath;
	
	S3Util s3 = new S3Util();
	String bucketName = "tripsterimgserver";
	
	@Inject
	private MemberService service;
	
	@Inject
	ContentsReviewService reviewservice;

//	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
//	public void uploadForm() {
//
//	}
//
//	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
//	public String uploadForm(MultipartFile file, Model model) throws Exception {
//		logger.info("originalName: " + file.getOriginalFilename());
//		logger.info("siz : " + file.getSize());
//		logger.info("contentType : " + file.getContentType());
//
//		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
//
//		model.addAttribute("savedName", savedName);
//		return "uploadResult";
//	}
//
//	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
//	public void uploadAjax() {
//
//	}

	//Plan - memoPicture 업로드
	@ResponseBody
	@RequestMapping(value = "/uploadAjaxPlan", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjaxPlan(MultipartFile file) throws Exception {
		logger.info("originalName:" + file.getOriginalFilename());
		
		String uploadPath = "tripster/plan";

		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjaxReview", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjaxReiew(MultipartFile file) throws Exception {
		logger.info("originalName:" + file.getOriginalFilename());
		System.out.println("name: " + file );
		String uploadPath = "tripster/review";

		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}
	
	//회원 프로필 사진 업로드
	@ResponseBody
	@RequestMapping(value = "/uploadProfile", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public void uploadProfile(MultipartFile file, String str, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		
		String uploadPath = "tripster/profile";
		
		ResponseEntity<String> imgPath = new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, 
											file.getOriginalFilename(), file.getBytes()),HttpStatus.CREATED);
		
		String memberPicture = (String)imgPath.getBody();
		
		logger.info(memberPicture);
		
		Object obj = session.getAttribute("login");
		MemberVO memVO = (MemberVO) obj;
		memVO.setMemberPicture(memberPicture);
		try {
			service.uploadPicture(memVO);
		} catch (Exception e){
			
		}
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName, String directory)throws Exception{
		logger.info("디렉토리명"+directory);
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection con = null;
		
		logger.info("FILE NAME :"+fileName);
		
		String inputDirectory = null;
		if(directory.equals("plan")) {
			inputDirectory = "tripster/plan";
		} else if(directory.equals("review")) {
			inputDirectory = "tripster/review";
		} else {
			inputDirectory = "tripster/profile";
		}
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			URL url;
			
			try {
				url = new URL(s3.getFileURL(bucketName, inputDirectory+fileName));
				con = (HttpURLConnection)url.openConnection();
				in = con.getInputStream();
			} catch(Exception e) {
				
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
	
	// 디비에서 파일 가져오기
	@RequestMapping(value="/getFileName",method=RequestMethod.POST)
	public ResponseEntity<String> getAttach(Integer reviewID){
		
		logger.info("reviewID:"+reviewID);
		
		ResponseEntity<String> entity = null;
		
		try {
			String fileNames = reviewservice.getFileNames(reviewID);
			logger.info("fileNames:"+fileNames.toString());
			entity = new ResponseEntity<String>(fileNames,HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			//오류 발생 시, BAR_REQUEST 상태 입력
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}

	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, String directory){
		logger.info("delete file: "+fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		String inputDirectory = null;
		
		if(directory.equals("plan")) {
			inputDirectory = "tripster/plan";
		} else if(directory.equals("review")) {
			inputDirectory = "tripster/review";
			try {
				reviewservice.deleteFileName(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			inputDirectory = "tripster/profile";
		}
		
//		HttpHeaders headers = new HttpHeaders();
//		URL url;
		
		try {
			s3.fileDelete(bucketName, inputDirectory+fileName);
		} catch(Exception e) {
			
		}
		
		if(mType!=null) {
//			String front = fileName.substring(0, 12);
			String file = fileName.substring(12);
			new File(inputDirectory+(file).replace('/', File.separatorChar)).delete();
		}
		new File(inputDirectory+fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files, String directory){
		logger.info("delete all files:" +files);
		
		if(files == null || files.length ==0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		String inputDirectory = null;
		if(directory.equals("plan")) {
			inputDirectory = "tripster/plan";
		} else if(directory.equals("review")) {
			inputDirectory = "tripster/review";
		} else {
			inputDirectory = "tripster/profile";
		}
		
		for(String fileName: files) {
			String formatName= fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(inputDirectory+(front+end).replace('/', File.separatorChar)).delete();
			}
			new File(inputDirectory+fileName.replace('/', File.separatorChar)).delete();
			
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
//	private String uploadFile(String originalName, byte[] fileData) throws Exception {
//		UUID uid = UUID.randomUUID();
//		String savedName = uid.toString() + "_" + originalName;
//		File target = new File(uploadPath, savedName);
//		FileCopyUtils.copy(fileData, target);
//		return savedName;
//	}
}