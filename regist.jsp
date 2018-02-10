<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/regist.css">
	
	<!-- 由于引入的是html转的js头部尾部文件 要引入jquery文件 -->
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src='js/slid.js'></script>

  </head>
  
  <body>
    <!-- 引入头部js文件 -->
   <script type="text/javascript" src="js/head.js"></script>
   <div class='main'>
	    <div class='form_wrap'>
	        <p class='input_wrap name_wrap'>
	            <input type='text' class='inp input_name' id='iname' placeholder='昵称'>
	            <span id='pname' class='att'></span>
	        </p> 
	        <p class='input_wrap phone_wrap'>
	            <input type='text' class='inp input_phone' maxlength='11' id='iphone' placeholder='手机号码'>
	            <span id='pphone' class='att'></span>
	        </p> 
	        <p class='input_wrap pw_wrap'>
	            <input type='password' class='inp input_pass' maxlength='20' id='ipw' placeholder='设置8-20位密码'>
	            <span id='ppw' class='att'></span>
	        </p>  
	        <p class='input_wrap conf_wrap cb'>
	            <input type='password' class='inp input_conf' maxlength='20' id='iconf' placeholder='确认密码'>
	            <span id='pconf' class='att'></span>
	        </p>  

	        <div class='slid_wrap'>
	        </div>
	        <script type="text/javascript">
	            console.log('txt'+$('.slid_wrap').slider());
	        </script>
	        
	         <p class='input_wrap yan_wrap cb'>
	            <input type='text' class='inp input_yan' maxlength='4' id='iyan' placeholder='验证码'>
	            <span id='pyan' class='att'></span>
	            <button class='yan_btn'>发送验证码</button>
	        </p>  
	        <button class='reg_btn'>立即注册</button>
	        <p class='input_wrap agr_wrap cb'>
	            
	            <span id='pagr'>我已阅读并同意《诺心用户守则》</span>
	            <input type='checkbox' class='inp input_agr' id='iagr' checked>
	            <span id='pdisagr' class='att hid'>*未勾选《诺心用户守则》</span>
	        </p>  
	    </div><!-- form wrap -->
	    
    </div><!-- main -->
    <div class='jump hid'>
           <span class='j_txt'><span class='j_time'>5</span>秒钟后，页面自动跳转到首页</span>
        </div>
     <div class='fotwrap'>
       <script type="text/javascript" src='js/foot.js'></script>
     </div>
    
     <script type="text/javascript" src='js/regist.js'></script>
  </body>
</html>
