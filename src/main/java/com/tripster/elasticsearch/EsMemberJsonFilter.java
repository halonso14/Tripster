package com.tripster.elasticsearch;

import com.fasterxml.jackson.core.JsonGenerator; 
import com.fasterxml.jackson.databind.SerializerProvider; 
import com.fasterxml.jackson.databind.ser.PropertyWriter; 
import com.fasterxml.jackson.databind.ser.impl.SimpleBeanPropertyFilter;

import com.tripster.domain.MemberVO;

public class EsMemberJsonFilter extends SimpleBeanPropertyFilter{

//	@Override 
//	public void serializeAsField(Object pojo, JsonGenerator jgen, SerializerProvider provider, PropertyWriter writer) throws Exception { 
//		
//		if (pojo instanceof MemberVO) { 
//			if (canSerializeAsField((MemberVO) pojo, writer.getName())) {
//				super.serializeAsField(pojo, jgen, provider, writer); 
//			} 
//		} else { 
//			super.serializeAsField(pojo, jgen, provider, writer); 
//		} 
//	} 
//
//	private boolean canSerializeAsField(MemberVO user, String fieldName) { 
//		
//		if (fieldName.equals("memberPassword")) { 
//			return false; 
//		}
//		if (fieldName.equals("sessionKey")) { 
//			return false; 
//		}
//		if (fieldName.equals("memberAuthKey")) { 
//			return false; 
//		}
////		if (fieldName.equals("memberPicture") && !user.isHasMemberPicture()) { 
////			return false; 	
////		} 
//		return true; 
//	} 

}
