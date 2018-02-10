<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.cake "%>
<%@ page import="util.DBHelp "%>
<%@ page import="operate.ope "%>
<%@ page import="serve.logcap "%>
<%@ page import="net.sf.json.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<script type="text/javascript" src='js/jquery-3.2.1.js'></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" src='js/jQueryRotate.js'></script>
	
	
  </head>
  
  <body>
  <!-- 引入头部js文件 -->
   <script type="text/javascript" src="js/head.js"></script>
   
    <div class='videowrap'>
      <video id='vid' src='img/video.mp4' autoplay='autoplay' muted loop></video>
    </div>
    <div class='middlewrap'>
      <div class='silder'>
          <img alt="" src="img/down.png">
       </div>
      
          <div class='turn'>
           <ul>
           <%for(int k=1;k<6;k++){ %>
             <li><img class='turnimg' alt="" src="img/turn<%=k %>.jpg"></li>
             <%} %>
           </ul>
          </div>
	      <div class='bigs'>
		      <%
		      String[] barr={"雪域牛乳芝士蛋糕 Le Cheesecake","美刀刀蛋糕 Ms. Golden","钻石雪域牛乳芝士蛋糕 Diamond Cheesecake"};
		       for(int j=1;j<4;j++){    
		       %>
		       <a href='#' class='ba' id='abig<%=j%>>'>
			       <img alt="" src="img/big<%=j%>.jpg" class='bimg'>
			       <div class='pwrap'>
			           <p class='bp'><%=barr[j-1]%></p>
			       </div>
		       </a>
		       <%} %>
	      </div>
	      <!-- 以上是bigs div -->
	      <div class='smalls'>
		      <div class='com'>
		       <span class='comtxt'>诺心推荐</span>
		       <span class='line'></span>
		       <span class='comtxt1'>lecake recommend</span>
		      </div>
		      <ul>
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
	      <!-- 以上是small -->
          
    </div>  
       <script type="text/javascript" src='js/swindow.js'></script>
    <div class='fotwrap'>
       <script type="text/javascript" src='js/foot.js'></script>
     </div>
       <script type="text/javascript" src='js/page.js'></script>
       <script type="text/javascript" src='js/buywindow.js'></script>
  </body>
</html>
