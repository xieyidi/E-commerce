package serve;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Random;

import entity.cake;
import entity.user;
import util.DBHelp;
import net.sf.json.JSONObject;
import operate.ope;

import com.mysql.jdbc.*;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class logcap extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public logcap() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 告知浏览当作图片处理
	       response.setContentType("image/jpeg");
	       // 告诉浏览器不缓存
	       response.setHeader("pragma", "no-cache");
	       response.setHeader("cache-control", "no-cache");
	       response.setHeader("expires", "0");
	       // 产生由4位数字构成的验证码
	       int length = 4;
	       String valcode  = "";
	       Random rd =  new Random();
	       for(int i=0; i<length; i++)
	           valcode+=rd.nextInt(10);
	       // 把产生的验证码存入到Session中
	       HttpSession  session = request.getSession();
	       session.setAttribute("valcode", valcode);
	       // 产生图片
	       int width = 80;
	       int height = 30;
	       BufferedImage img = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
	       // 获取一个Graphics
	       Graphics g = img.getGraphics();
	       // 填充背景色
	       g.setColor(Color.WHITE);
	       g.fillRect(0, 0, width, height);
	       // 填充干扰线50
	       for(int i=0; i<50; i++){
	           g.setColor(new Color(rd.nextInt(100)+155,rd.nextInt(100)+155,rd.nextInt(100)+155));
	           g.drawLine(rd.nextInt(width), rd.nextInt(height),rd.nextInt(width), rd.nextInt(height));
	       }
	       // 绘制边框
	       g.setColor(Color.GRAY);
	       g.drawRect(0, 0, width-1, height-1);
	       // 绘制验证码
	       Font[] fonts = {new Font("隶书",Font.BOLD,18),new Font("楷体",Font.BOLD,18),new Font("宋体",Font.BOLD,18),new Font("幼圆",Font.BOLD,18)};
	       for(int i=0; i<length; i++){
	           g.setColor(new Color(rd.nextInt(150),rd.nextInt(150),rd.nextInt(150)));
	           g.setFont(fonts[rd.nextInt(fonts.length)]);
	           g.drawString(valcode.charAt(i)+"", width/valcode.length()*i+2, 18);
	       }
	       // 输出图像
	       g.dispose();
	       ImageIO.write(img, "jpeg", response.getOutputStream());
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String servletPath=request.getServletPath();
		//*.do url取前几位
		String methodName=servletPath.substring(1, servletPath.length()-3);
		if(methodName.equals("yan")){
			// 获取验证码
		       String valcode = request.getSession().getAttribute("valcode").toString();
		       // 获取用户填写的验证码
		       String vcode = request.getParameter("vcode");
		       // 进行验证       
		       if(!valcode.equals(vcode))
		           {
			    	   System.out.println(">>>验证码错误！");
			           response.setContentType( "text/html;charset=UTF-8");
			           response.getWriter().write("false");
		           }
		        else
		           {
			           System.out.println(">>>验证码正确！");
			           try {   
			               response.getWriter().write("true");  
			               response.getWriter().flush();  
			           } catch (IOException e) {  
			                
			           } finally {  
			               if (null != response.getWriter()) {  
			            	   response.getWriter().close();  
			               }  
			           } 
		           }
		 }//yan zhengma
		//else 
			if(methodName.equals("one"))
			{
			System.out.println("dao+");
			//传过来的参数名称是id
			  int cid=Integer.parseInt(request.getParameter("id"));
			  ope op=new ope();
			  try{
//				    private int id;	
//					private String name;
//					private String ename;
//					private int sweet;
//					private String p;//'2,3'代表5-8人 10-12人
//					private String pipo;
//					private String type;
//					private String sp1;
//					private String sp2;
				  
			    cake goal=op.getCake(cid);
			    JSONObject trans=new JSONObject();
			    trans.put("id", goal.getId());
			    trans.put("name", goal.getName());
			    trans.put("ename", goal.getEname());
			    trans.put("sweet", goal.getSweet());
			    trans.put("p",  goal.getP());
			    trans.put("pipo", goal.getPipo());
			    trans.put("type", goal.getType());
			    trans.put("sp1", goal.getSp1());
			    trans.put("sp2", goal.getSp2());
			    
			    String transtr=trans.toString();
//			    response.setCharacterEncoding("utf-8");
			    response.setContentType("text/html;charset=utf-8");
//			    response.setHeader("content-type","text/html;charset=UTF-8");
			    //加入以上第二个保证前台获取数据function(data)中文不乱码
			    response.getWriter().write(transtr);
			    System.out.println("goal+"+transtr);
			    //这一句要放在try里面 代码块作用域封闭
			  }
			  catch(Exception ex)
			  {
				  ex.printStackTrace();
			  }
		}//do one
		if(methodName.equals("search")){
			int len=request.getParameter("url").split("&").length;
			String arrp[]=request.getParameter("url").split("&");
			StringBuffer urlp=new StringBuffer();
			StringBuffer urlt=new StringBuffer();
			for(int i=0;i<len;i++){
				if(arrp[i].length()>4){
					if(arrp[i].substring(0, 4).equals("type")){
						System.out.println("arrp"+arrp[i].substring(5));
						arrp[i]=URLDecoder.decode(arrp[i].substring(5),"utf-8");
						urlt.append(",\'"+arrp[i]+"'");
						System.out.println("index"+i+arrp[i]);
					  }
				}else{
					if(arrp[i].substring(0, 1).equals("p")){
					    urlp.append(",\'%"+arrp[i].substring(2)+"%\'");
					}
				}				
			}//for 解码url里的中文
			System.out.println("join"+urlp);
			ope op=new ope();
			  try{
				  System.out.println("urlp:"+urlp+"\n"+"urlt"+urlt);
				  String urlsp=new String(urlp);
				  String urlst=new String(urlt);
					ArrayList<cake> goals=ope.getspe(urlsp,urlst);
				    System.out.println("goals+"+goals);
				    StringBuffer strs=new StringBuffer();
				    
				    for(int k=0;k<goals.size();k++){
				    	JSONObject trans=new JSONObject();
				    	cake goal=goals.get(k);
					    trans.put("id", goal.getId());
					    trans.put("name", goal.getName());
					    trans.put("ename", goal.getEname());
					    trans.put("sweet", goal.getSweet());
					    trans.put("p",  goal.getP());
					    trans.put("pipo", goal.getPipo());
					    trans.put("type", goal.getType());
					    trans.put("sp1", goal.getSp1());
					    trans.put("sp2", goal.getSp2());
					    
					    String transtr=trans.toString()+"@";
					    strs.append(transtr);
				    }
				    response.setContentType("text/html;charset=utf-8");
				    //加入以上第二个保证前台获取数据function(data)中文不乱码
				    response.getWriter().print(strs);
				    System.out.println("goal+"+strs);
				    //这一句要放在try里面 代码块作用域封闭
			  }
			  catch(Exception ex)
			  {
				  ex.printStackTrace();
			  }
		}//do search
		//用户注册行为 regist.do
		if(methodName.equals("regist")){
			String[] info=request.getParameter("info").split("&");
			System.out.println("info:"+request.getParameter("info"));
			boolean res;
			try{
				ope oper=new ope();			
			    int _id=ope.rows();
			    user xie= new user();
			    xie.setId(_id);
			    xie.setName(info[0]);
			    xie.setPhone(info[1]);
			    xie.setPassword(info[2]);
			    res=ope.newuser(xie);
			    response.getWriter().print(res);
			    
			  }
			catch(Exception ex)
			  {
				  ex.printStackTrace();
			  }
		}//do regist
		//检验用户名exname.do
			if(methodName.equals("exname")){
				String uname=request.getParameter("name");
				System.out.println("得到name"+uname);
				boolean res;
				try{
					ope oper=new ope();		
				    res=ope.exname(uname);
				    System.out.println("返回结果name"+res);
				    response.getWriter().print(res);			    
				  }
				catch(Exception ex)
				  {
					  ex.printStackTrace();
				  }
			}//do exname
			//检验用户名exphone.do
			if(methodName.equals("exphone")){			
				String uphone=request.getParameter("phone");
				boolean res;
				try{
					ope oper=new ope();		
				    res=ope.exphone(uphone);
				    response.getWriter().print(res);				    
				  }
				catch(Exception ex)
				  {
					  ex.printStackTrace();
				  }
			}//do exphone
			//用户登录log.do
			if(methodName.equals("log")){		
				System.out.println("shoudao");
				String lname=request.getParameter("lname");
				String lpass=request.getParameter("lpass");
				String re;
				boolean res1;
				try{
					ope oper=new ope();		
				    res1=ope.exname(lname);
				    if(res1){
				    	re="0";//用户名不存在
				    }else{
				    	if(oper.testuser(lname, lpass)){
				    		re="2";//用户名与密码匹配
				    	}else{
				    		re="1";//密码错误
				    	}
				    }
				    response.getWriter().print(re);				    
				  }
				catch(Exception ex)
				  {
					  ex.printStackTrace();
				  }
			}//do log
	}//do post

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
