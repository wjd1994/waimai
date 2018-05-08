<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  

  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <title>My JSP 'login.jsp' starting page</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <meta http-equiv="description" content="This is my page">  
    <style>
 
    .text_input{
   position:absolute;
  
	width:80%;
	left:10%;
	top:60px;
	border-bottom:#666 1px solid;
	border-left-width:0px;
	border-right-width:0px;
	border-top-width:0px;
    }
   .dizhi ul{
   position:absolute;
   right:10%;
   }

 
    .submit input{
    position:absolute;
    width:80%;
    left:10%;
    top:90px;
    }

    </style>
    </head>
  <body>  
    <form action = "usercenter.jsp" method="post">  
       <div class="dizhi"><ul id="ul_radio">
</ul>
       </div>
       <div class="submit"><input type="submit" name="submit" value="提 交"></div>

    </form>  
  
  </body> 
  <%String param = request.getParameter("param"); %>
  <script>
  var param = "<%=param%>";
  var dizhi = document.getElementsByClassName("dizhi");
  var input_elem = document.createElement("input");
  var ul = document.getElementById("ul_radio");
  input_elem.type = "text";
  if(param == "0"){
	  input_elem.name = "username";
	  input_elem.className = "text_input";
	  input_elem.autocapitalize="on";
	  input_elem.placeholder="请输入姓名"
	  input_elem.value = "<%=session.getAttribute("username")%>";
	  var input_radio0 = document.createElement("input");
	  input_radio0.type = "radio";
	  input_radio0.name = "usersex";
	  input_radio0.value = "男";
	  input_radio0.id = "1";
	  input_radio0.innerHTML = "MAN";
	  ul.appendChild(input_radio0);
	  var label1 = document.createElement("label");
	  label1.for = "1";
	  label1.innerHTML = "男";
	  ul.appendChild(label1);
	  
	  var input_radio1 = document.createElement("input");
	  input_radio1.type = "radio";
	  input_radio1.name = "usersex";
	  input_radio1.value = "女";
	  input_radio1.id = "2";
	 // input_radio1.checked="checked";
	  ul.appendChild(input_radio1);
	  var label2 = document.createElement("label");
	  label2.for = "2";
	  label2.innerHTML = "女";
	  ul.appendChild(label2);
	  dizhi[0].appendChild(ul);
	  dizhi[0].appendChild(input_elem);
	  var check_sex = "<%=session.getAttribute("usersex").toString()%>";
	  if(check_sex == "男")
		  input_radio0.checked = "checked";
	  if(check_sex == "女")
		  input_radio1.checked = "checked";
	  
  }
  if(param == "1"){
	  input_elem.name = "useraddr";
	  input_elem.className = "text_input";
	  input_elem.autocapitalize="on";
	  input_elem.placeholder="请输入地址"
	  input_elem.value = "<%=session.getAttribute("useraddr")%>";
	  dizhi[0].appendChild(input_elem);
  }
  if(param == "2"){
	  input_elem.name = "usertel";
	  input_elem.className = "text_input";
	  input_elem.autocapitalize="on";
	  input_elem.placeholder="请输入电话"
	  input_elem.value = "<%=session.getAttribute("usertel")%>";
	  dizhi[0].appendChild(input_elem);
  }
	 

 
  
  </script> 
</html>  