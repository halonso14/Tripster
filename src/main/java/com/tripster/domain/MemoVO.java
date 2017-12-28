package com.tripster.domain;

import java.util.*;
import lombok.*;

@Data
public class MemoVO {
	private int planDetailID;
	private String memoContents;
	
	private List<String> memoPictureName;

}
