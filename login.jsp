<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	
	<!-- 由于引入的是html转的js头部尾部文件 要引入jquery文件 -->
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" src='js/jquery.session.js'></script>

  </head>
  
  <body>
    <header>
     <section class='hed'>
	       <a href='#' class='al'><img alt="can not load" src="img/logo.png"></a>
	    
     </section>
    </header>
    <div class='bg'>
      <img alt="" src="img/loginbg.jpg">
    </div>
    <div class='fwrap'>
      <h2>
        <a href="javascript:void(0)" class='aname'>账户密码登录</a>
        <a href="javascript:void(0)" class='aphone'>手机验证登录</a>
      </h2>
	      <div class='divn'>
	        <p class='np1 inp'>
	          <input type="text" placeholder='请输入帐号'>
	          <span class='att'>*请输入帐号</span>
	        </p>
	        <p class='np2 inp'>
	          <input type="text" placeholder='请输入密码'>
	          <span class='att'>*请输入密码</span>
	        </p>
	      </div>
	      
	      <div class='divp hid'>
	        <p class='pp1 inp'>
	          <input type="text" placeholder='手机号码'>
	          <span class='att'>*请输入手机号码</span>
	        </p>
	        <p class='pp2 inp'>
	          <input type="text" placeholder='请输入验证码'>
	          <div class='cap'><img alt="" src=""></div>
	          <span class='yan'>*请输入验证码</span>
	        </p>
	        <p class='pp3 inp'>
	          <input type="text" placeholder='短信验证码'>
	          <button>发送验证码</button>
	          <span class='att'>*请输入验证码</span>
	        </p>
	      </div>
	      <span id='lastatt' class='att hid'></span>
	      <button class='logetr'>立即登录</button>
	      <div class='logmor'>
	        <a href='#' class='logfgt'>忘记密码</a>
	        <a href='regist.jsp' class='logreg'>立即注册</a>
	        <span class='logregtxt'>还没有帐号？</span>
	      </div>
	      
	      <h3 class='logoth'></h3>
	      <a href='#' class='otha'>
	        <img alt="" src="img/logwei.png" class='othimg'>
	      </a>
    </div>
    <script type="text/javascript" src='js/foot.js'></script>
    <script type="text/javascript" src='js/page.js'></script>
    <script type="text/javascript" src='js/login.js'></script>
  </body>
</html>
