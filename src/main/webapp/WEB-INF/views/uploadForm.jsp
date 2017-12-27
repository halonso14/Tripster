<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>upload</title>
</head>
<style>
iframe{
	width: 0px;
	height: 0px;
	border: 0px;
}
</style>
<body>

<form id="form1" action="uploadForm" method="post" enctype="multipart/form-data" target="zeroFrame">
<input type="file" name="file" />
<input type="submit" />	
</form>

<!-- 결과 페이지  -->
<iframe name="zeroFrame"></iframe>
<script>

	function addFilePath(msg){
		alert(msg);
		document.getElementById("form1").reset();
	}

</script>
</body>
</html>