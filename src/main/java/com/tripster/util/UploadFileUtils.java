package com.tripster.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	// 파일 업로드 메소드
	public static String uploadFile(String uploadPath,String originalName,byte[] fileData) throws Exception{
		
		// 랜덤 이름 생성
		UUID uid = UUID.randomUUID();
		// 저장될 이름 생성
		String saveName = uid.toString() + "_" + originalName;
		// 저장될 경로 계산
		String savePath = calcPath(uploadPath);
		// 지정된 경로에 지정된 이름으로 파일 객체 생성
		File target = new File(uploadPath + savePath,saveName);
		// 원본 복사
		FileCopyUtils.copy(fileData, target);
		// 포맷이름
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		// 업로드될이름
		String uploadedFileName = null;
		// 이미지파일 검사
		if(MediaUtils.getMediaType(formatName) != null) {
			// 이미지파일일 경우 썸네일 생성, 썸네일 이름 저장
			uploadedFileName = makeThumbnail(uploadPath, savePath, saveName);
			logger.info("uploadedFile Name:"+uploadedFileName);
		}else {
			// 이미지파일이 아닐 경우 아이콘 생성, 원본 이름 저장
			uploadedFileName = makeIcon(uploadPath,savePath,saveName);
			logger.info("uploadedFile Name:"+uploadedFileName);
		}
		
		// 저장될 파일 이름 리턴
		return uploadedFileName;
	}
	
	// 아이콘 만드는 메소드
	private static String makeIcon(String uploadPath,String path,String fileName) {
		// 기본경로 생성경로 파일이름을 받아 파일이름 생성
		String iconName = uploadPath + path + File.separator + fileName;
		// 아이콘 이름 리턴
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	// 폴더의 경로 생성
	private static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();
		// 년도
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		// 월
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		// 날짜
		String datePath =monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)+1);
		
		// 각 날짜에 대한 경로를 생성 후 경로 이름으로 폴더 생성
		makeDir(uploadPath,yearPath,monthPath,datePath);
		
		logger.info(datePath);
		// 경로 이름 리턴
		return datePath;
		
	}
	
	// 업로드 경로에 년도 월 날을 받아 이름으로 폴더 생성
	private static void makeDir(String uploadPath,String ...paths) {
		
		// 폴더에 같은 파일이 있을 경우  return
		if(new File(uploadPath + paths[paths.length -1]).exists()) return ;
		
		// 없을경우 경로를 저장하여 폴더를 생성
		for(String path : paths) {
			
			File dirPath = new File(uploadPath + path);
			
			if(!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
		
	}
	
	// 썸네일 생성 ( 기본경로와 생성될 경로와 파일이름을 받아 생성 )
	private static String makeThumbnail(String uploadPath,String path,String fileName) throws Exception{
		
		// 원본 파일 리딩( 파일이름과 기본 경로를 받아 )
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path,fileName));
		// 원본파일을 높이가 100px로 고정하여 이미지파일에 원본이미지를 복사
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		// s_ 을 붙여 썸네일 이름 생성
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		// 만든 이름으로 썸네일 파일 생성
		File newFile = new File(thumbnailName);
		// 포멧 이름 (jpg,png, 등등 )
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		// 썸네일을 생성하는 부분
		ImageIO.write(destImg, formatName.toUpperCase(),newFile);
		// 경로에 \를 /로 치환하여 문자열 리턴
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	}

}
