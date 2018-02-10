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
	
	<link rel="stylesheet" type="text/css" href="css/many.css">	
	<link rel="stylesheet" type="text/css" href="css/index.css">	
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
        <dd><a  data-type='慕斯' data-on='false' class='fliter' href='search.jsp?type=慕斯'>慕斯</a></dd>
        <dd><a  data-type='奶油' data-on='false' class='fliter' href='search.jsp?type=奶油'>奶油</a></dd>
        <dd><a  data-type='巧克力' data-on='false' class='fliter' href='search.jsp?type=巧克力'>巧克力</a></dd>
        </dl>
        <dl class='num cb'>
        <dt >人数：</dt>
        <dd><a  data-p='1' data-on='false' class='fliter' href='search.jsp?p=1'>2-4人</a></dd>
        <dd><a  data-p='2' data-on='false' class='fliter' href='search.jsp?p=2'>5-8人</a></dd>
        <dd><a  data-p='3' data-on='false' class='fliter' href='search.jsp?p=3'>10-12人</a></dd>
        <dd><a  data-p='4' data-on='false' class='fliter' href='search.jsp?p=4'>15-20人</a></dd>
       </dl>
     </div>
     <div class='cs_body'>
      <ul class='cb cs_ul'>
     <% 
     try 
		  {
               ope items = new ope(); 
               ArrayList<cake> list = items.getcakes();
               System.out.println("list"+items);
               if(list!=null&&list.size()>0)
               {
	               for(int i=0;i<list.size();i++)
	               {
	                  cake item = list.get(i);
	                  JSONObject strpipo = JSONObject.fromObject(item.getPipo().split("#")[1]);
	                  //此处使用fromObject not parseObject
	                  System.out.println("pipo"+strpipo);
	                  //String strprice = strpipo.get("price");
	                   System.out.println("price"+strpipo.get("price"));
	                   if((i+1)%4==0){
	                  %>
	                   <li class='sdiv side' id='com<%=(i+1)%>'>
	                   <%}else{ %>
	                   <li class='sdiv noside' id='com<%=(i+1)%>'>
	                   <%} %>
			           <a href='detail.jsp?id=com<%=(i+1)%>' class='sa' id='acom<%=(i+1)%>'>
			            <img alt="" src="img/s<%=(i+1)%>.png" class='simg'>
			            
			           </a>
			           <div class='spwrap' id='sild<%=(i+1)%>'>
				           <div class='sp'>
				              <h2 class='ph2'><%=item.getName() %></h2>
				              <h3 class='ph3'><%=strpipo.get("price")%></h3>
				              <h3 class='ph4'>建议2~3人一起食用</h3>
				              <a href='#' class='abuy'>
				                <span class='sbuy' id='btn<%=(i+1)%>'>加入购物车</span>
				              </a>
				            </div>
			            </div>
		           </li>
           <%}} 
            }
		  catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
           %>
           </ul>
      </div>
      <script type="text/javascript" src='js/swindow.js'></script>
      <div class='fotwrap'>
       <script type="text/javascript" src='js/foot.js'></script>
     </div>
       <script type="text/javascript" src='js/page.js'></script>
       <script type="text/javascript" src='js/many.js'></script>
       <script type="text/javascript" src='js/buywindow.js'></script>
  </body>
</html>
