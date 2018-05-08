<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.Statement" import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="java.net.URL" %> 
<%@ include file="parameter.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="JSP/sqlread.jsp" %>

 <link type="text/css" rel="styleSheet"  href="CSS/shouye1.css" />

<title>外卖</title>

</head>

<body>
<div class="top">
	<img src="1.jpg"alt=""/> 
	
	
	
</div>
<div class="center">

				
</div>
<div class="bottom">
<ul>
	<li ><a href="shouye.jsp" class="active">首页</a></li>
	<li ><a href="">发现</a></li>
	<li ><a href="dingdan.jsp">订单</a></li>
	<li ><a href="usercenter.jsp">我的</a></li>
	</ul>
</div>

<%String s = request.getParameter("code"); 
String s1 = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&secret="+appsecret+"&code="+s+"&grant_type=authorization_code";
//通过code请求access_token的网址


%>
<%
//读取s1网址的内容存入字符串sTotalString中
String sCurrentLine = "";
String sTotalString = "";


java.io.InputStream l_urlStream;
URL l_url = new URL(s1);

java.net.HttpURLConnection l_connection = (java.net.HttpURLConnection) l_url.openConnection();
l_connection.connect();
l_urlStream = l_connection.getInputStream();

java.io.BufferedReader l_reader = new java.io.BufferedReader(new java.io.InputStreamReader(l_urlStream));


while ((sCurrentLine = l_reader.readLine()) != null)
{
 sTotalString+=sCurrentLine;
}
//out.println(sTotalString);
//out.println("<br>");
//将读取的字符串按键存入一个hashmap中
String stotal = sTotalString;
sTotalString = "";
for(int i = 1; i < stotal.length()-1; i++){
	char c = stotal.charAt(i);
	if(c != '"'){
		sTotalString += c;
	}
}
String s2[] = sTotalString.split(",");
Map<String,String> json = new HashMap<String,String>();
for(int i = 0; i < s2.length;i++){
	String s3[] = s2[i].split(":");
	json.put(s3[0],s3[1]);
}

//获取openid
String openid = json.get("openid");
//当通过其他页面转到当前页面时,openid为null，此时将session中的值赋给
if(session.getAttribute("openid") != null){
	openid = session.getAttribute("openid").toString();
}
String access_token = json.get("access_token");
session.setAttribute("access_token",access_token);
String userinfo = "https://api.weixin.qq.com/sns/userinfo?access_token="+json.get("access_token")+"&openid="+json.get("openid")+"&lang=zh_CN";
//查询openid处个人信息
ResultSet user_rs = stmt.executeQuery("select * from userinfo where openid='"+openid+"'");
//if(session.getAttribute("username") == null){
//查到就将信息加入到session中
if(user_rs.next()){
	session.setAttribute("userid",user_rs.getInt("id"));
	session.setAttribute("username",user_rs.getString("name"));
	session.setAttribute("usersex",user_rs.getString("sex"));
	session.setAttribute("useraddr",user_rs.getString("addr"));
	session.setAttribute("usertel",user_rs.getString("tel"));
	session.setAttribute("openid",openid);
}
//没找到就向数据库中写入相关信息
else{
	session.setAttribute("openid",openid);
	
	//openid += "11";
	stmt.executeUpdate("insert into userinfo(openid) values('"+openid+"')");
	user_rs = stmt.executeQuery("select * from userinfo where openid='"+openid+"'");
	user_rs.next();
	session.setAttribute("userid",user_rs.getInt("id"));
	String sCurrentLine1 = "";
	String sTotalString1 = "";
	
	//进一步根据access_tokenk和openid读取更详细信息
	java.io.InputStream l_urlStream1;
	URL l_url1 = new URL(userinfo);
	java.net.HttpURLConnection l_connection1 = (java.net.HttpURLConnection) l_url1.openConnection();
	l_connection1.connect();
	l_urlStream1 = l_connection1.getInputStream();
	java.io.BufferedReader l_reader1 = new java.io.BufferedReader(new java.io.InputStreamReader(l_urlStream1,"utf-8"));
	while ((sCurrentLine1 = l_reader1.readLine()) != null)
	{
	 sTotalString1+=sCurrentLine1;
	}
	stotal = sTotalString1;
	System.out.println(stotal);
	sTotalString1 = "";
	for(int i = 1; i < stotal.length()-1; i++){
		char c = stotal.charAt(i);
		if(c != '"'){
			sTotalString1 += c;
		}
	}
	String []s21 = sTotalString1.split(",");
	Map<String,String> json1 = new HashMap<String,String>();
	for(int i = 0; i < s21.length;i++){
		String s3[] = s21[i].split(":");
		json1.put(s3[0],s3[1]);
		if(s3[0].indexOf("sex") != -1) break;
		System.out.println("1");
	}
	String sex = json1.get("sex");
	switch(sex.charAt(0)){
	case '1':sex = "男";break;
	case '2':sex = "女";break;
	default:sex = "未知";
	}
	System.out.println(json1.get("nickname"));
	//stmt.executeUpdate("insert into userinfo(sex,name) values('"+sex+"','"+json1.get("nickname")+"') where openid='"+openid+"'");	
	//stmt.executeUpdate("insert into userinfo(name) values('"+json1.get("nickname")+"') where id = 109");
	stmt.executeUpdate("update userinfo set name='"+json1.get("nickname")+"' where openid='"+openid+"'");
	stmt.executeUpdate("update userinfo set sex='"+sex+"' where openid='"+openid+"'");
	stmt.executeUpdate("update userinfo set addr='未知' where openid='"+openid+"'");
	stmt.executeUpdate("update userinfo set tel='未知' where openid='"+openid+"'");
	session.setAttribute("username",json1.get("nickname"));
	session.setAttribute("usersex",sex);
	session.setAttribute("useraddr","未知");
	session.setAttribute("usertel","未知");
}
//}
%>  

<%
//查询所有店铺信息写入数组中
ResultSet rs1 = stmt.executeQuery("select MAX(id) from dianpu");
rs1.next();
int len = rs1.getInt("MAX(id)");
int []id = new int[len];
String []name = new String[len];
String []huodong = new String[len];
int []yueshou = new int[len];
String []img = new String[len];
ResultSet rs2 = stmt.executeQuery("select * from dianpu");
len = 0;
while(rs2.next()){
	id[len] = rs2.getInt("id");
	name[len] = rs2.getString("name");
	huodong[len] = rs2.getString("huodong");
	yueshou[len] = rs2.getInt("yueshou");
	img[len++] = rs2.getString("img");
}
%>

<script>  
//将上面查询到的信息赋给js数组中，并创造元素显示在前端界面
var name1 = [];
var id1 = [];
var huodong1 = [];
var yueshou1 = [];
var img1 = [];
var i = 0;  
<%for(int i = 0;i < 3; i++){%>  
    name1[i] = "<%=name[i]%>"; 
    id1[i] = "<%=id[i]%>";
    huodong1[i] = "<%=huodong[i]%>";
    yueshou1[i] = <%=yueshou[i]%>;
    img1[i++] = "<%=img[i]%>";
    <%}%>  



var elem = document.getElementsByClassName("center");
var n = 0;
var len = <%=len%>;

var li = [];
for(i = 0; i < len; i++){
	li[i] = document.createElement("li");
	li[i].id = i;
	var menu_img = document.createElement("div");
	menu_img.className = "menu-img";
	var menu_txt = document.createElement("div");
	menu_txt.className = "menu-txt";
	var img = document.createElement("img");
	img.src = img1[i];
	var h4 = document.createElement("h4");
	var list1 = document.createElement("p");
	var list2 = document.createElement("p");
	var b = document.createElement("b");
	list1.className = "list1";
	list2.className = "list2";
	h4.innerHTML = name1[i];
	list1.innerHTML = huodong1[i];
	b.innerHTML = "月售："+yueshou1[i]; 
	list2.appendChild(b);
	menu_img.appendChild(img);
	menu_txt.appendChild(h4);
	menu_txt.appendChild(list1);
	menu_txt.appendChild(list2);
	li[i].appendChild(menu_img);
	li[i].appendChild(menu_txt);
	elem[0].appendChild(li[i]);
}
i = 0;
//给每个li添加一个带参数的链接用于下个界面根据参数读取指定的数据库
<%for(int i = 0; i < len; i++){%>
li[i++].onclick=function(){window.location="shangpin.jsp?param="+<%=i+1%>;}
<%}%>
var li1 = document.createElement("li");
elem[0].appendChild(li1);

</script>

</body>
</html>