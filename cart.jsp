<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.cake "%>
<%@ page import="util.DBHelp "%>
<%@ page import="operate.ope "%>
<%@ page import="net.sf.json.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/cart.css">	
    <script type="text/javascript" src='js/jquery-3.2.1.js'></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
  </head>
  
  <body>
    <!-- 引入头部js文件 -->
   <script type="text/javascript" src="js/head.js"></script>
	    <div class='main'>
	      <section class='logsta fl'>
	        <p>您还没有登录,登录后购物车内的商品将保存到您的账号中！</p>
	        <a href='login.jsp'><button class='c_log'>立即登录</button></a>
	      </section>
	      <section class='comp fl'>
	        <a href='many.jsp' class='ctn'>继续购物</a>
	        <p>您的购物车</p>
	      </section>
	      <section class='c_list'>
		      <ul class='c_ul'>
		      <!--  
			        <li class='c_li fl'>
			        
				          <span class='c_check'></span>
				          <div class='c_img'></div>
				          <div class='c_info'>
					            <a href='detail.jsp?' class='c_a'>
					              <h2>蛋糕中文名</h2>
					              <h3>蛋糕英文名</h3>
					              <h4>几人食 价格</h4>
					            </a>
					            <div class='c_wish'>
					              <input type='text' class='c_input' placeholder='输入生日祝福'>
					            </div>
				          </div>
				          <div class='c_price'>
				            <p class='li_price'>小计：￥ 328</p>
				            <div class='li_num fl'>
					              <a href='javascript:void(0)' class='li_cut'></a>
					              <input placeholder='1'>
					              <a href='javascript:void(0)' class='li_add'></a>
				            </div>
				          </div>
				          
			        </li>
			  -->
		      </ul>
	      </section>
	      <section class='c_sum fl'>
	        <span class='getall'></span>
	        <span>全选</span>
	        <p>|</p>
	        <span class='getnum'>共0件商品，已选择0件</span>
	        <div class='blank'></div>
	        <span class='getsum'>合计（不含运费）：</span>
	        <span class='getprice'></span>
	        <button class='getfinal'>结算</button>
	      </section>
	    </div>
    <div class='fotwrap'>
       <script type="text/javascript" src='js/foot.js'></script>
     </div>
       <script type="text/javascript" src='js/cart.js'></script>
  </body>
</html>
