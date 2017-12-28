package com.tripster.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tripster.domain.MemberVO;
import com.tripster.service.ContentsReviewService;
import com.tripster.service.MemberService;
import com.tripster.util.MediaUtils;
import com.tripster.util.UploadFileUtils;

@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private MemberService service;
	
	@Inject
	ContentsReviewService reviewservice;

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {

	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("siz : " + file.getSize());
		logger.info("contentType : " + file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedName", savedName);
		return "uploadResult";
	}

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {

	}

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		logger.info("originalName:" + file.getOriginalFilename());
		// logger.info("size: "+ file.getSize());
		// logger.info("contentType: "+file.getContentType());

		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}
	
	//회원 프로필 사진 업로드
	@ResponseBody
	@RequestMapping(value = "/uploadProfile", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public void uploadProfile(MultipartFile file, String str, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		
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
	public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("FILE NAME :"+fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");			
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

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
	public ResponseEntity<List<String>> getAttach(Integer reviewID){
		
		logger.info("reviewID:"+reviewID);
		
		ResponseEntity<List<String>> entity = null;
		
		try {
			List<String> fileNames = reviewservice.getFileNames(reviewID);
			logger.info("fileNames:"+fileNames.toString());
			entity = new ResponseEntity<List<String>>(fileNames,HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			//오류 발생 시, BAR_REQUEST 상태 입력
			entity = new ResponseEntity<List<String>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}

	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		logger.info("delete file: "+fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType!=null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
		}
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
		logger.info("delete all files:" +files);
		
		if(files == null || files.length ==0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName: files) {
			String formatName= fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
			}
			new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
			
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}