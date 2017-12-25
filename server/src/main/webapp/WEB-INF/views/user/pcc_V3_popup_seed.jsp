<%@ page  contentType = "text/html;charset=ksc5601"%>
<%
	response.setHeader("Cache-Control","no-cache");     
	response.setHeader("Pragma","no-cache");
%>
<%
	String param = "";
	String enc_retInfo   = request.getParameter("retInfo").trim();

	param= "?retInfo="+enc_retInfo;
%>
<html>
<head>
<script language="JavaScript">
	function end() {
		window.opener.location.href = 'http://.../pcc_V3_result_seed.jsp<%=param%>';
		self.close();
	}
</script>
</head>
<body onload="javascript:end()">
</body>
</html>