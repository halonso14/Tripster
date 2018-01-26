function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}

function getFileInfo(fullName){
	var fileName, imgsrc, getLink/*,originalName*/;
	
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc = "/displayFile?fileName="+fullName+"&directory=plan";
		fileLink = fullName.substr(12);

//		var front = fullName.substr(0,12);
//		var end = fullName.substr(14);
//		
//		originalName = front+end;
		getLink = "/displayFile?fileName="+fileLink+"&directory=plan";
	}else{
		imgsrc ="/resources/plan/apple.png";
		fileLink = fullName.substr(12);
		getLink = "/displayFile?fileName="+fullName+"&directory=plan";
	}
	
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName: fullName/*,originalName:originalName*/};
	
}