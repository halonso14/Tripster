PUT test
{ 
  "mappings": {
  	"contents": {
  		"properties": {
  			"contentsID": { "type": "integer" },
  			"categoryID": { "type": "integer" },
  			"title": { "type": "text" },	
  			"location": { "type": "text" },
  			"rating": { "type": "integer" },	 			
  			"contents": { "type": "text" },	
  			"tumb": { "type": "text" },
  			"contentsViewCnt": { "type": "integer" },
  			"contentsReviewCnt": { "type": "integer" },
  			"contentsScrapCnt": { "type": "integer" },
  			"contentsDetail": {
  				"properties": {
  					"time": { "type": "text" },
  					"tel": { "type": "text" },
  				}
  			},
  			"ContentsReviewVO" : { 
  				"properties": {
  					"memberID": { "type": "integer" },
  					"contentsID": { "type": "integer" },
  					"contentsReviewID": { "type": "integer" },
  					"contentsReview": { "type": "text" },
		  			"contentsReviewTime": { 
		  				"type": "date" ,
		  				"format": "yyyy-MM-dd"
  					 }	
  				}
  			}					
  		}
  	},
  	"plan": {
  		"properties": {
  			"planID": { "type": "integer" },
  			"memberID": { "type": "integer" },
  			"planTitle": { "type": "text" },
  			"planStartDate": { 
  				"type": "date" ,
  				"format": "yyyy-MM-dd"
  			 },
  			"planEndDate": { 
  				"type": "date" ,
  				"format": "yyyy-MM-dd"
  			 },			 
  			"planEndChk": { "type": "integer" },
  			"PlanDetailVO" : { 
  				"properties": {
	  				"planDetailID": { "type": "integer" },
					"planID": { "type": "integer" },
					"contentsID": { "type": "integer" },
					"title": { "type": "text" },
					"planDetailStartTime": { "type": "text" },
					"planDetailEndTime": { "type": "text" },
					"planDetailDate": { "type": "text" },
					"categoryID": { "type": "integer" },
					"MemoVO": {
						"properties": {
							"planDetailDate": { "type": "integer" },
							"memoContents": { "type": "text" },
							"memoPictureName": { "type": "text" }
						}
					}
				}	
  			},	
  			"PlanReplyVO" : { 
	  			"properties": {
	  				"planReplyID": { "type": "integer" },
	  				"planID": { "type": "integer" },
	  				"memberID": { "type": "integer" },
	  				"planReplyContents": { "type": "text" },
	  				"planReplyTime": { 
	  	  				"type": "date" ,
	  	  				"format": "yyyy-MM-dd"
	    			 }		
	  			}
  			}
  		}
  	},
  	"member": {
  		"properties": {
  			"memberID": { "type": "integer" },
  			"memberEmail": { "type": "text" },
  			"memberPassword": { "type": "text" },
  			"memberName": { "type": "text" },
  			"memberSex": { "type": "text" },
  			"memberBirthday": { 
  				"type": "date" ,
  				"format": "yyyy-MM-dd"
  			},
  			"memberPicture": { "type": "text" },
  			"sessionKey": { "type": "text" },
  			"memberAuthKey": { "type": "text" }
  		}
  	}
  }
}
	

	
	
    
