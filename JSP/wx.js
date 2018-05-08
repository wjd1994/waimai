/*<%String appid1 = appid;
//if(session.getAttribute("ticket") == null){
System.out.println(getAccessToken()); 
System.out.println(session.getAttribute("access_token"));
System.out.println(getTicket(getAccessToken()));
String ticket = getTicket(getAccessToken());
//session.setAttribute("ticket",ticket);
//}
//String ticket = session.getAttribute("ticket").toString();
//session.removeAttribute("ticket");
//System.out.println(ticket);
//String url = request.getScheme()+"://"+ request.getServerName()+request.getRequestURI()+"?"+request.getQueryString(); 
String url = request.getScheme()+"://"+ request.getServerName()+request.getRequestURI();
System.out.println(url);
String noncestr = UUID.randomUUID().toString().replace("-", "").substring(0, 16);//随机字符串
long times = System.currentTimeMillis()/1000;
String timestamp = String.valueOf(times);//时间戳
System.out.println(noncestr);
System.out.println(times);
String signature = SHA1(ticket,url,noncestr,timestamp);
System.out.println(signature);
System.out.println(session.getAttribute("username").toString());
%>*/
<script>
wx.config({
	debug:false,
	appId:"wxee8409f6b1b72561",
	timestamp:<%=times%>,
	nonceStr:"<%=noncestr%>",
	signature:"<%=signature%>",
	jsApiList:[
        'getNetworkType',
        'openLocation',
        'getLocation',
        'chooseWXPay'
		]
});
</script>
<script src="js/zepto.min.js"></script>

<script>
wx.ready(function () {



	  // 6 设备信息接口
	  // 6.1 获取当前网络状态
	  document.querySelector('#getNetworkType').onclick = function () {
	    wx.getNetworkType({
	      success: function (res) {
	        alert(res.networkType);
	      },
	      fail: function (res) {
	        alert(JSON.stringify(res));
	      }
	    });
	  };

	  // 7 地理位置接口
	  // 7.1 查看地理位置
	  document.querySelector('#openLocation').onclick = function () {
	    wx.openLocation({
	      latitude: 29.56981,
	      longitude: 106.459755,
	      name: "",
	      address: "",
	      scale: 14,
	      infoUrl: 'http://weixin.qq.com'
	    });
	  };

	  // 7.2 获取当前地理位置
	  document.querySelector('#getLocation').onclick = function () {
	    wx.getLocation({
	      success: function (res) {
	        alert(JSON.stringify(res));
	      },
	      cancel: function (res) {
	        alert('用户拒绝授权获取地理位置');
	      }
	    });
	  };

	 
	  // 10 微信支付接口
	  // 10.1 发起一个支付请求
	  document.querySelector('#chooseWXPay').onclick = function () {
		    // 注意：此 Demo 使用 2.7 版本支付接口实现，建议使用此接口时参考微信支付相关最新文档。
		    wx.chooseWXPay({
		      timestamp: <%=times%>,
		      nonceStr: 'noncestr',
		      package: "addition=action_id%3dgaby1234%26limit_pay%3d&bank_type=WX&body=innertest&fee_type=1&input_charset=GBK&notify_url=http%3A%2F%2F120.204.206.246%2Fcgi-bin%2Fmmsupport-bin%2Fnotifypay&out_trade_no=1414723227818375338&partner=1900000109&spbill_create_ip=127.0.0.1&total_fee=1&sign=432B647FE95C7BF73BCD177CEECBEF8D",
		      signType: 'SHA1', // 注意：新版支付接口使用 MD5 加密
		      paySign: 'bd5b1933cda6e9548862944836a9b52e8c9a2b69'
		    });
		  };
});



</script>