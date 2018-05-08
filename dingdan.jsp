<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>外卖</title>
<style>
	.top{
	width:100%;
	height:150px;
	}
	.top img{
	width:100%;
	height:100%;
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
.center li .menu-img{position:absolute;margin-left:10px;top:15px;border-radius:3px;cursor:pointer;}  
.center li .menu-img img{height:100%;width:15%;vertical-align:middle;border:0;} 
.center li .menu-txt{}
.center li .menu-txt h3{
position:absolute;
top:0px;
left:20%;
font-size:14px;
width:50%;
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
} 
.center li .menu-txt p.list1{font-size:14px;position:absolute;left:80%;top:0px;}  
.center li .menu-txt p.list2{font-size:12px;position:absolute;left:20%;top:20px;} 
.center li .control-label{font-size:15px;position:absolute;left:75%;top:40px;}
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

</style>
</head>

<body>
<div class="top">
	<img src="1.jpg"alt=""/> 
</div>
<div class="center">
			<li>
					<div class="menu-img"><img src="1.jpg" /></div>
					<div class="menu-txt">
						<h3>店铺名称例如阿堡仔炸鸡汉堡（欢乐食光处美味炸鸡）</h3>
						<p class="list1">状态</p>
						<p class="list2">用价</p>
					</div>
					<div class="control-label">
					<a href="">再来一单</a>
					</div>
				</li>
				
				<li>
					
				</li>
</div>
<div class="bottom">
<ul>
	<li ><a href="shouye.jsp">首页</a></li>
	<li ><a href="">发现</a></li>
	<li ><a href="dingdan.jsp" class="active">订单</a></li>
	<li ><a href="usercenter.jsp">我的</a></li>
	</ul>
</div>
</body>
</html>