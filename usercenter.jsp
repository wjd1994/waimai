<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.Statement" import="java.sql.*"%>
    <%@page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="JSP/sqlread.jsp" %>
<%@ include file="getsignature.jsp" %>

<style>
.bottom{
	display:block;
	position:fixed;
	width:100%;
	z-index:3;
	bottom:0px;
	line-height:55px;
	font-size:15px;
	border-top:1px solid #e2e2e2;
	overflow:hidden;
	}
.bottom ul
{
list-style-type:none;
margin:0;
padding:0;

}
.bottom li{
float:left;
width:25%;
}
.bottom li a{
display:block;
color:#0F0F0F;
text-align:center;
background-color:#fff;
padding:0px;
text-decoration:none;
text-transform:uppercase;
}
.bottom li a.active {
color: #fff;background-color:#09DFEC;
}
.top{
position:relative;
width:100%;
height:100px;
background-color:#00A3FF;
}
.top img{
	width:60px;
	height:60px;
	position:absolute;
	left:10px;
	top:20px;
}
.top p{
position:absolute;
top:20px;
left:80px;
width:25%;
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
}

.center{
	list-style-type:none;
	width:100%;
	height:300px;
	}
	.center li{
	position:relative;
	height:75px;
	border-bottom:1px solid #e7eaeb;
	border-top:1px solid #fff;
	padding-bottom:0px;
	margin-bottom:0px;
	}  
</style>

<title>个人中心</title>

</head>
<body>
<div class="top">
<img src="img/head.png">
<p id="openid"></p>
</div>
<div class="center">
<li class="name_class">
<p>我的姓名</p>
<p id="name"></p>
</li>
<li class="addr_class">
<p>我的地址</p>
<p id="addr" ></p>
</li>
<li class="tel_class">
<p>我的电话</p>
<p id="tel"></p>
</li>
<li>
</li>

<!--  <h3 id="menu-device">设备信息接口</h3>
      <span class="desc">获取网络状态接口</span>
      <button class="btn btn_primary" id="getNetworkType">getNetworkType</button>
      <h3 id="menu-location">地理位置接口</h3>
      <span class="desc">使用微信内置地图查看位置接口</span>
      <button class="btn btn_primary" id="openLocation">openLocation</button>
      <span class="desc">获取地理位置接口</span>
      <button class="btn btn_primary" id="getLocation">getLocation</button>
      <h3 id="menu-pay">微信支付接口</h3>
      <span class="desc">发起一个微信支付请求</span>
      <button class="btn btn_primary" id="chooseWXPay">chooseWXPay</button>
<li>lllllllll</li>
<li>lllllllll</li>
<li>lllllllll</li>
<li>lllllllll</li>-->

</div>

<div class="bottom">
<ul>
	<li ><a href="shouye.jsp">首页</a></li>
	<li ><a href="">发现</a></li>
	<li ><a href="dingdan.jsp">订单</a></li>
	<li ><a href="usercenter.jsp" class="active">我的</a></li>
	</ul>
</div>
</body>
<%
//request.setCharacterEncoding("GB2312");
//获取addinfo传来的post参数
String s0 = request.getParameter("username");
String s00 = request.getParameter("usersex");
String s1 = request.getParameter("useraddr");
String s2 = request.getParameter("usertel");
System.out.println(s00);
if(s1 != null){
	String s = new String(s1.getBytes("ISO8859-1"),"utf-8");
	session.setAttribute("useraddr",s);
}
if(s2 != null){
	String s = new String(s2.getBytes("ISO8859-1"),"utf-8");
	session.setAttribute("usertel",s);
}
if(s0 != null){
	String s = new String(s0.getBytes("ISO8859-1"),"utf-8");
	session.setAttribute("username",s);
}
if(s00 != null){
	String s = new String(s00.getBytes("ISO8859-1"),"utf-8");
	session.setAttribute("usersex",s);
}

stmt.executeUpdate("update userinfo set name='"+session.getAttribute("username").toString()+"' where openid='"+session.getAttribute("openid").toString()+"'");
stmt.executeUpdate("update userinfo set sex='"+session.getAttribute("usersex").toString()+"' where openid='"+session.getAttribute("openid").toString()+"'");
stmt.executeUpdate("update userinfo set addr='"+session.getAttribute("useraddr").toString()+"' where openid='"+session.getAttribute("openid").toString()+"'");
stmt.executeUpdate("update userinfo set tel='"+session.getAttribute("usertel").toString()+"' where openid='"+session.getAttribute("openid").toString()+"'");
%>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
$(".addr_class").click(function () { 
	window.location="addinfo.jsp?param=1";
	//alert("jjj");
});
$(".name_class").click(function () { 
	window.location="addinfo.jsp?param=0";
});
$(".tel_class").click(function () { 
	window.location="addinfo.jsp?param=2";
});
</script>
<script>
var openid = document.getElementById("openid");
openid.innerHTML = "<%=session.getAttribute("openid").toString()%>";
var name1 = document.getElementById("name");
name1.innerHTML = "<%=session.getAttribute("username").toString()%>";
var addr = document.getElementById("addr");
addr.innerHTML = "<%=session.getAttribute("useraddr").toString()%>";
var tel = document.getElementById("tel");
tel.innerHTML = "<%=session.getAttribute("usertel").toString()%>";
</script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

</html>