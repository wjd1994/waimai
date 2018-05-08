<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>仿美团</title>
<style>
html,body,div,p,form,label,ul,li,dl,dt,dd,ol,img,button,b,em,strong,small,h1,h2,h3,h4,h5,h6{margin:0;padding:0;border:0;list-style:none;font-style:normal;}
body{font-family:SimHei,'Helvetica Neue',Arial,'Droid Sans',sans-serif;font-size:14px;color:#333;background:#f2f2f2;padding: 0;min-width: 300px; max-width: 640px; margin: 0 auto;}
a, a.link{color:#666;text-decoration:none;font-weight:500;}
a, a.link:hover{color:#666;}
h1,h2,h3,h4,h5,h6{font-weight: normal;}
.left-menu::-webkit-scrollbar {width: 0px;}
.main{overflow:hidden;}
.left-menu{width:25%;float:left;background-color:#eee;position:relative;overflow-y:scroll;height: 500px;}
.left-menu ul li{line-height:60px;width:100%;text-align:center;font-size:14px;padding:3px 0;color:#333;border-bottom:1px dashed #ddd;}  
.left-menu ul li.active{color:#f34b3f !important;background-color:#fff;}  
.right-con{display:none;width:75%;float:left;overflow-y:scroll;background:#fff;position:relative;height:500px;}
.con .con-active{display:block;}
.right-con li{position:relative;height:75px;border-bottom:1px solid #e7eaeb;border-top:1px solid #fff;padding-bottom:8px;margin-bottom:2px;}  
.right-con li .menu-img{position:absolute;margin-left:10px;top:15px;border-radius:3px;cursor:pointer;}  
.right-con li .menu-img img{height:55px;width:55px;vertical-align:middle;border:0;}  
.right-con li .menu-txt{margin:15px 15px 15px 75px;}
.right-con li .menu-txt h3{font-size:14px;margin-bottom:10px;margin-top:8px;} 
.right-con li .menu-txt p{font-style:normal;line-height:20px;font-size:12px;vertical-align:bottom;}  
.right-con li .menu-txt p.list2 b{font-size:14px;color:#f00;}  
.right-con li .btn{background-color:transparent;position:absolute;right:0px;top:45%;cursor:pointer;padding:3px;height:38px;}  
.right-con li .btn button.minus{margin-right:-10px;display:none;}  
.right-con li .btn button{width:40px;height:40px;border:0;background:transparent;padding:0;}  
.right-con li .btn button strong{padding:5px 10px;font-size:15px;display:inline-block;text-indent:-100px;padding:5px 11px;height:12px;}  
.right-con li .btn button.minus strong{background:url(img/down.png) no-repeat;background-size:22px 22px;}  
.right-con li .btn i{display:none;width:22px;text-align:center;font-style:normal;vertical-align:top;margin-top:11px;line-height:18px;}
.right-con li .btn button.add{margin-left:-10px;}  
.right-con li .btn button.add strong{background:url(img/up.png) no-repeat;background-size:22px 22px;}  
.right-con li .btn .price{display:none;} 
.right-con li .btn .shangpinming{display:none;} 
.footer{display:block;position:fixed;width:100%;z-index:3;bottom:0px;color:#f03c03;background:#fff;line-height:35px;font-size:15px;border-top:1px solid #e2e2e2;}  
.footer .left{float:left;margin:5px 10px;}  
.footer .right{float:right;}  
.footer .right .disable{background:#dbdbdb;}  
.footer .xhlbtn{display:block;text-align:center;line-height:45px;background-color:#F03C03;padding:0 15px;color:#fff;font-weight:bold;}  
.footer .spname{display:none;}
</style>
<%@ include file="JSP/sqlread.jsp" %>
<%String id = request.getParameter("param");//用request得到  shouye传来参数用于访问指定数据库

%>
<script>
var shangpin_id = 0;
function finishselect(){
	var username = "<%=session.getAttribute("username").toString()%>";
	var idname = "<%=id%>";
	var sp = $(".spname").html();
	alert(username+" 购买"+idname+":"+sp);
}
</script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
$(function () {  
	//加的效果  
	$(".add").click(function () {  
		$(this).prevAll().css("display", "inline-block");  
		var n = $(this).prev().text();  
		var num = parseInt(n) + 1;  
		if (num == 0) { return; }  
		$(this).prev().text(num);  
		var danjia = $(this).next().text();//获取单价  
		var a = $("#totalpriceshow").html();//获取当前所选总价  
		$("#totalpriceshow").html((a * 1 + danjia * 1).toFixed(2));//计算当前所选总价  
		var nm = $("#totalcountshow").html();//获取数量  
		$("#totalcountshow").html(nm*1+1);  
		var sp1 = $(".spname").html();
		$(".spname").html(sp1+$(this).next().next().text()+" ");
		jss();//<span style='font-family: Arial, Helvetica, sans-serif;'></span>   改变按钮样式
	});  
	//减的效果  
	$(".minus").click(function () {  
		var n = $(this).next().text();  
		var num = parseInt(n) - 1;  
		$(this).next().text(num);//减1  
		var danjia = $(this).next().next().next().text();//获取单价  
		var a = $("#totalpriceshow").html();//获取当前所选总价  
		$("#totalpriceshow").html((a * 1 - danjia * 1).toFixed(2));//计算当前所选总价  
		var nm = $("#totalcountshow").html();//获取数量  
		$("#totalcountshow").html(nm * 1 - 1);  
		//alert($(this).nextAll(".price").next().text());
		var sp1 = $(".spname").html();
		var sp2 = $(this).nextAll(".price").next().text()
		var index = sp1.indexOf(sp2);
		var sp3 = "";
		for(var j = 0; j < index; j++){
			sp3 += sp1[j];
		}
		for(var j = index+sp2.length; j < sp1.length;j++){
			sp3 += sp1[j];
		}
		$(".spname").html(sp3);
		//如果数量小于或等于0则隐藏减号和数量  
		if (num <= 0) {  
			$(this).next().css("display", "none");  
			$(this).css("display", "none");  
			jss();//改变按钮样式  
			 return  
		}  
	});  
	function jss() {  
		var m = $("#totalcountshow").html();  
		if (m > 0) {  
			$(".right").find("a").removeClass("disable");  
		} else {  
		   $(".right").find("a").addClass("disable");  
		}  
	};
	//选项卡
	$(".con>div").hide();
	$(".con>div:eq(0)").show();	
	$(".left-menu li").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		var n = $(".left-menu li").index(this);
		$(".left-menu li").index(this);
		$(".con>div").hide();
		$(".con>div:eq("+n+")").show();	
	});
});  
</script>
</head>
<body>
<div class="main">
	<div class="left-menu">
		<ul id="test">  
        </ul> 
	</div>
	<div class="con">
		
		

	</div>
	<div class="footer">  
		<div class="left">已选：
		<span id="cartN">
			<span id="totalcountshow">0</span>份　总计：￥<span id="totalpriceshow">0</span></span>元  
		</div>  
		<div class="right">  
			<a id="btnselect" class="xhlbtn  disable" href="javascript:void(0)" onclick="finishselect()">去结算</a>  
		</div>  
		<div class="spname"></div> 
	</div>
</div>

<%
//显示左边的元素
ResultSet rs1 = stmt.executeQuery("select MAX(id) from shangpin_left_"+id);
rs1.next();
int id_len = rs1.getInt("MAX(id)");
int len = id_len;
String []name = new String[len];
rs=stmt.executeQuery("select * from shangpin_left_"+id); 
len = 0;
while(rs.next()){
	name[len++] = rs.getString("name");
}

%>
<script>
var name1 = [];
var len = <%=len%>;
var i = 0;
<%for(int i = 0; i < len; i++){%>
	name1[i++] = "<%=name[i]%>";
<%}%>
var elem = document.getElementsByClassName("left-menu");
var ul = document.getElementById("test");
//var ul = document.createElement("ul");
var li = document.createElement("li");
li.className="active";
li.innerHTML=name1[0];
ul.appendChild(li);
elem[0].appendChild(ul);
for(i = 1; i < len; i++){
	var li1 = document.createElement("li");
	li1.innerHTML=name1[i];
	ul.appendChild(li1);
	elem[0].appendChild(ul);
}
</script>
<%ResultSet rs2 = null; 
String []name1 = new String[10];
String []leixin = new String[10];
int []price1 = new int[10];
String []img = new String[10];%>



<script>

<%
//显示右边的元素
for(int x=1;x<=id_len;x++){
int flag = x;
rs2 = stmt.executeQuery("select count(id1) from shangpin_right_"+id+" where id1="+x);
rs2.next();
len = rs2.getInt("count(id1)");
rs2 = stmt.executeQuery("select * from shangpin_right_"+id+" where id1="+x);

len = 0;
while(rs2.next()){
	name1[len] = rs2.getString("name");
	leixin[len] = rs2.getString("leixin");
	img[len] = rs2.getString("img");
	price1[len++] = rs2.getInt("price");
}

%>

var name11 = [];
var leixin1 = [];
var img1 = [];
var price1 = [];
i = 0;
var len = <%=len%>;

<%for(int i = 0; i < len; i++){%>
	name11[i] = "<%=name1[i]%>";
	leixin1[i] = "<%=leixin[i]%>";
	img1[i] = "<%=img[i]%>";
	price1[i++] = <%=price1[i]%>;
<%}%>

var elem = document.getElementsByClassName("con");
var div = document.createElement("div");
var flag = <%=x%>;
if(flag == 1)
	div.className="right-con con-active";
else
	div.className="right-con";

for(var i1 = 0; i1 < len; i1++){
	var ul = document.createElement("ul");
	
	var li = document.createElement("li");
	var div1 = document.createElement("div");
	div1.className = "menu-img";
	var img = document.createElement("img");
	img.src = img1[i1];
	var div2 = document.createElement("div");
	div2.className = "menu-txt";
	var h4 = document.createElement("h4");
	h4.innerHTML = name11[i1];
	var list1 = document.createElement("p");
	var list2 = document.createElement("p");
	var b = document.createElement("b");
	list1.className = "list1";
	list2.className = "list2";
	list1.innerHTML = leixin1[i1];
	b.innerHTML = "￥"+price1[i1];
	var btn = document.createElement("div");
	btn.className = "btn";
	var minus = document.createElement("button");
	minus.className = "minus";
	var add = document.createElement("button");
	add.className = "add";
	var strong1 = document.createElement("strong");
	var strong2 = document.createElement("strong");
	var i = document.createElement("i");
	i.innerHTML = 0;
	var price = document.createElement("i");
	price.className = "price";
	price.innerHTML = price1[i1];
	var shangpinming = document.createElement("i");
	shangpinming.className = "price";
	shangpinming.innerHTML = name11[i1];
	minus.appendChild(strong1);
	add.appendChild(strong2);
	btn.appendChild(minus);
	btn.appendChild(i);
	btn.appendChild(add);
	btn.appendChild(price);
	btn.appendChild(shangpinming);
	list2.appendChild(b);
	list2.appendChild(btn);
	div1.appendChild(img);
	div2.appendChild(h4);
	div2.appendChild(list1);
	div2.appendChild(list2);
	li.appendChild(div1);
	li.appendChild(div2);
	ul.appendChild(li);
	div.appendChild(ul);
}
elem[0].appendChild(div);
<%}%>
</script>


</body>
</html>
