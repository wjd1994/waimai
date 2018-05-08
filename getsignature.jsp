<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.Statement" import="java.sql.*"%>
    <%@page import="java.net.URL" %> 
    <%@page import="java.net.HttpURLConnection" %> 
    <%@page import="java.io.*" %> 
    <%@page import="java.util.*" %> 
    <%@page import="java.security.*" %>
<%@ include file="parameter.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
</body>

<%!

public static String getAccessToken() {  
    String access_token = "";  
    String grant_type = "client_credential";//获取access_token填写client_credential   
    String AppId="wxee8409f6b1b72561";//第三方用户唯一凭证  
    String secret=appsecret;//第三方用户唯一凭证密钥，即appsecret   
    //这个url链接地址和参数皆不能变  
    String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type="+grant_type+"&appid="+appid+"&secret="+secret;  
       
    try {  
        URL urlGet = new URL(url);  
        HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();  
        http.setRequestMethod("GET"); // 必须是get方式请求  
        http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");  
        http.setDoOutput(true);  
        http.setDoInput(true);  
        System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒  
        System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒  
        http.connect();  
        InputStream is = http.getInputStream();  
        int size = is.available();  
        byte[] jsonBytes = new byte[size];  
        is.read(jsonBytes);  
        String message = new String(jsonBytes, "UTF-8");  
        is.close();  
        //return message;
        String stotal = message;
        message = "";
        for(int i = 1; i < stotal.length()-1; i++){
        	char c = stotal.charAt(i);
        	if(c != '"'){
        		message += c;
        	}
        }
        String s2[] = message.split(",");
        Map<String,String> json = new HashMap<String,String>();
        for(int i = 0; i < s2.length;i++){
        	String s3[] = s2[i].split(":");
        	json.put(s3[0],s3[1]);
        }
        return json.get("access_token");
    } catch (Exception e) {  
            e.printStackTrace();  
    }  
    return access_token;  
}  

public static String getTicket(String access_token) {  
    String ticket = null;  
    String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+ access_token +"&type=jsapi";//这个url链接和参数不能变  
    try {  
        URL urlGet = new URL(url);  
        HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();  
        http.setRequestMethod("GET"); // 必须是get方式请求  
        http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");  
        http.setDoOutput(true);  
        http.setDoInput(true);  
        System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒  
        System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒  
        http.connect();  
        InputStream is = http.getInputStream();  
        int size = is.available();  
        byte[] jsonBytes = new byte[size];  
        is.read(jsonBytes);  
        String message = new String(jsonBytes, "UTF-8");  
		
        is.close(); 
        String stotal = message;
        message = "";
        for(int i = 1; i < stotal.length()-1; i++){
        	char c = stotal.charAt(i);
        	if(c != '"'){
        		message += c;
        	}
        }
        String s2[] = message.split(",");
        Map<String,String> json = new HashMap<String,String>();
        for(int i = 0; i < s2.length;i++){
        	String s3[] = s2[i].split(":");
        	json.put(s3[0],s3[1]);
        }
        return json.get("ticket");
    } catch (Exception e) {  
            e.printStackTrace();  
    }  
    return ticket;  
}  

public static String SHA1(String jsapi_ticket,String url,String noncestr,String timestamp) {  
    try {  
    	//String noncestr = UUID.randomUUID().toString().replace("-", "").substring(0, 16);//随机字符串  
        //String timestamp = String.valueOf(System.currentTimeMillis() / 1000);//时间戳
    	String decript = "jsapi_ticket="+jsapi_ticket+"&noncestr="+noncestr+"&timestamp="+timestamp+"&url="+url;;
        MessageDigest digest = java.security.MessageDigest.getInstance("SHA-1");  
        digest.update(decript.getBytes());  
        byte messageDigest[] = digest.digest();  
        // Create Hex String  
        StringBuffer hexString = new StringBuffer();  
        // 字节数组转换为 十六进制 数  
            for (int i = 0; i < messageDigest.length; i++) {  
                String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);  
                if (shaHex.length() < 2) {  
                    hexString.append(0);  
                }  
                hexString.append(shaHex);  
            }  
            return hexString.toString();  
   
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
        return "";  
}  


public static String fun(String s1){
	return s1+"123";
}
%>
<%

%>
</html>