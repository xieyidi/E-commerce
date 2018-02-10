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
    <!-- WEB-INF 加jar包才能连接数据库 -->
    <title>My JSP 'many.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/index.css">	
	<link rel="stylesheet" type="text/css" href="css/many.css">	
	<script type="text/javascript" src='js/jquery-3.2.1.js'></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" src='js/jQueryRotate.js'></script>

  </head>
  
  <body>
   <!-- 引入头部js文件 -->
   <script type="text/javascript" src="js/head.js"></script>
     <div class='cs_head'>
       <dl class='type cb'>
        <dt >口味：</dt>
        <dd><a  data-type='慕斯' data-on='false' class='fliter type' href='search.jsp?type=慕斯'>慕斯</a></dd>
        <dd><a  data-type='奶油' data-on='false' class='fliter type' href='search.jsp?type=奶油'>奶油</a></dd>
        <dd><a  data-type='巧克力' data-on='false' class='fliter type' href='search.jsp?type=巧克力'>巧克力</a></dd>
        </dl>
        <dl class='num cb'>
        <dt >人数：</dt>
        <dd><a  data-p='1' data-on='false' class='fliter p' href='search.jsp?p=1'>2-4人</a></dd>
        <dd><a  data-p='2' data-on='false' class='fliter p' href='search.jsp?p=2'>5-8人</a></dd>
        <dd><a  data-p='3' data-on='false' class='fliter p' href='search.jsp?p=3'>10-12人</a></dd>
        <dd><a  data-p='4' data-on='false' class='fliter p' href='search.jsp?p=4'>15-20人</a></dd>
       </dl>
     </div>
     <div class='cs_body'>
        <ul class='cb cs_ul'>
        </ul>
     </div>
      <script type="text/javascript" src='js/swindow.js'></script>
      <div class='fotwrap'>
       <script type="text/javascript" src='js/foot.js'></script>
      </div>
       <script type="text/javascript" src='js/search.js'></script>
       <script type="text/javascript" src='js/many.js'></script>
       <script type="text/javascript" src='js/page.js'></script>
       <script type="text/javascript" src='js/buywindow.js'></script>
       
  
   </body>
</html>

