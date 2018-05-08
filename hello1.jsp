<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="parameter.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>欢迎</h1>

<script>
window.location="https://open.weixin.qq.com/connect/oauth2/authorize?appid="+"<%=appid%>"+"&redirect_uri=http://wjd.ngrok.xiaomiqiu.cn/test1/meituan/shouye.jsp&response_type=code&scope=snsapi_userinfo&state=ok#wechat_redirect";
</script>
</body>
</html>