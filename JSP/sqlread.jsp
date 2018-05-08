<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.Statement" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>
<body>
<%int num = 0; 
Connection connect = null;
Statement stmt = null;
ResultSet rs = null;
%>


<%
 try{
 //Class.forName("org.gjt.mm.mysql.Driver");
 Class.forName("com.mysql.jdbc.Driver");
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 
 try{
connect=DriverManager.getConnection("jdbc:mysql://localhost/test1?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8");
 //jdbc:mysql://localhost/testdb?user=root&password=mysql&useUnicode=true&characterEncoding=8859_1
 //jdbc:mysql://localhost/数据库名user=数据库登陆用户名&password=数据库登陆密码&useUnicode=是否允许设置字符编码&characterEncoding=允许设置编码时，要设置的编码;
 
   stmt = connect.createStatement();
   //rs=stmt.executeQuery("select * from dianpu");
   

 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 try{

 }catch(Exception e){}

%>
</body>
</html>