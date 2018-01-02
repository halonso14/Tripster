package com.tripster.util;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;

import com.tripster.controller.UploadController;

// 이미지 타입인지 판단하는 메소드
public class MediaUtils {

	private static Map<String,MediaType> mediaMap;
	
	private static final Logger logger = LoggerFactory.getLogger(MediaUtils.class);

	
	static {
		
		mediaMap = new HashMap<String,MediaType>();
		mediaMap.put("JPEG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type) {

		return mediaMap.get(type.toUpperCase());
	}
}
