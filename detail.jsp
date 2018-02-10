<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/detail.css">
	<script type="text/javascript" src='js/jquery-3.2.1.js'></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" src='js/detail.js'></script>

  </head>
  
  <body>
	  <script type="text/javascript" src='js/head.js' charset='utf-8'></script>
      <div class='container'></div>
<!--  
	  <div class='picwrap'>
	    <img alt="" src="img/b1.jpg">
	  </div>
	  <section class='chos cb'>
		    <div class='cleft fl'>
		      <div class='cwrap cb'>
			      <h1 class='cake_name'>雪域牛乳芝士蛋糕</h1>
			      <p class='cake_price red'>￥198</p>
		      </div>
		      <p class='atten'>提交订单或直接进入订单详情页即可上传语音</p>
		    </div>
		    <div class='cright fr'></div>
	  </section>
-->
      <script type="text/javascript" src='js/swindow.js'></script>
	  <script type="text/javascript" src='js/foot.js'></script>
	  <script type="text/javascript" src='js/page.js'></script>
	  <script type="text/javascript" src='js/buywindow.js'></script>
  </body>
  
</html>
