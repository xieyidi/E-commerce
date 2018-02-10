package operate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.io.Console;
import java.lang.reflect.Array;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

import entity.cake;
import entity.user;
import util.DBHelp;

import com.mysql.jdbc.*;

public class ope {
	//判断手机号码是否已被注册
	public static boolean exphone(String phone)throws Exception
	{		
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs=null;		
			try{
			conn=DBHelp.getConnection();
			stmt=conn.prepareStatement("select * from user where phone=?;");
			stmt.setString(1, phone);
			rs = stmt.executeQuery();
			
			while(rs.next()){
			   return false;	
			}
			return true;
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
			return false;
		} 
		finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	//判断手机号码是否已被注册
		public static boolean exname(String name)throws Exception
		{		
				Connection conn=null;
				PreparedStatement stmt=null;
				ResultSet rs=null;		
				try{
				conn=DBHelp.getConnection();
				stmt=conn.prepareStatement("select * from user where name=?;");
				stmt.setString(1, name);
				rs = stmt.executeQuery();
				
				while(rs.next()){
				   return false;	
				}
				return true;
			}
			catch (Exception ex) 
			{
				ex.printStackTrace();
				return false;
			} 
			finally {
				// 释放数据集对象
				if (rs != null) {
					try {
						rs.close();
						rs = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				// 释放语句对象
				if (stmt != null) {
					try {
						stmt.close();
						stmt = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}
		}
	//获取user表的行数 返回下一个user的id值
	public static int rows()throws Exception
	{		
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs=null;		
			try{
			conn=DBHelp.getConnection();
			stmt=conn.prepareStatement("select * from user;");
			rs = stmt.executeQuery();
			
			rs.last();
			int rowCount = rs.getRow()+1; //获得ResultSet的总行数
			return rowCount;
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
			return -1;
		} 
		finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	//插入一条用户信息
	public static boolean newuser(user emp) throws Exception
	{
		boolean resul=false;
	
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try{
			System.out.println("1conn:"+conn);
			conn=DBHelp.getConnection();
			System.out.println("conn:"+conn);
			String sqls="insert into user(id, name, phone, password) values(?, ?, ?, ?)";
			stmt=conn.prepareStatement(sqls);
			 stmt.setInt(1, emp.getId());         //设置SQL语句第一个“？”的值
			 stmt.setString(2, emp.getName());    //设置SQL语句第二个“？”的值
			 stmt.setString(3, emp.getPhone());        //设置SQL语句第三个“？”的值
			 stmt.setString(4, emp.getPassword()); 
			 int i = stmt.executeUpdate();            //执行插入数据操作，返回影响的行数
			 if (i == 1) {
			  resul = true;
			 }
			return resul;
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
			return false;
		} 
		finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		}

	//传入账号+密码 判断是否存在+相符
	public boolean testuser(String uname,String upass)throws Exception
	{		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;		
		try{
		conn=DBHelp.getConnection();
		stmt=conn.prepareStatement("select * from user where name=?;");
		stmt.setString(1, uname);
		rs = stmt.executeQuery();
		rs.last();
		if (rs.getString("password").equals(upass)){
			return true;
		}
		return false;
	}
	catch (Exception ex) 
	{
		ex.printStackTrace();
		return false;
	} 
	finally {
		// 释放数据集对象
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		// 释放语句对象
		if (stmt != null) {
			try {
				stmt.close();
				stmt = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
	}
	//获得所有蛋糕的信息
	public static ArrayList<cake> getcakes() throws Exception
	{
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<cake> aryall=new ArrayList<cake>();//蛋糕信息的集合
		System.out.println("co:"+aryall);
		try{
			System.out.println("1conn:"+conn);
			conn=DBHelp.getConnection();
			System.out.println("conn:"+conn);
			stmt=conn.prepareStatement("select * from cake;");
			rs=stmt.executeQuery();
			int i=0;
			while(rs.next())
			{
				i++;
				System.out.println("i:"+i);
				cake iu=new cake();
				iu.setId(rs.getInt("id"));
				iu.setName(rs.getString("name"));
				iu.setEname(rs.getString("ename"));
				iu.setSweet(rs.getInt("sweet"));
				iu.setP(rs.getString("p"));
				iu.setPipo(rs.getString("pipo"));
				iu.setType(rs.getString("type"));
				iu.setSp1(rs.getString("sp1"));
				iu.setSp2(rs.getString("sp2"));
				aryall.add(iu);
				//把一个蛋糕信息加入集合
			}
			return aryall;
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
			return null;
		} 
		finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		}
	public cake getCake(int id)throws Exception
	{		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;		
		try{
		conn=DBHelp.getConnection();
		stmt=conn.prepareStatement("select * from cake where id=?;");
		stmt.setInt(1, id);
		rs = stmt.executeQuery();
		
		if (rs.next()) {
			cake item = new cake();
			item.setId(rs.getInt("id"));
			item.setName(rs.getString("name"));
			item.setEname(rs.getString("ename"));
			item.setSweet(rs.getInt("sweet"));
			item.setP(rs.getString("p"));
			item.setPipo(rs.getString("pipo"));
			item.setType(rs.getString("type"));
			item.setSp1(rs.getString("sp1"));
			item.setSp2(rs.getString("sp2"));
			return item;
		} else {
			return null;
		}
	}
	catch (Exception ex) 
	{
		ex.printStackTrace();
		return null;
	} 
	finally {
		// 释放数据集对象
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		// 释放语句对象
		if (stmt != null) {
			try {
				stmt.close();
				stmt = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
	}
	//search页面根据筛选条件查询数据库 返回一个arraylist
	public static ArrayList<cake> getspe(String p,String t) throws Exception
	{
		//处理传入的筛选信息 拼凑sql语句
		String sqlt=t.replace(",", " , type = ");
		String[] arrt=sqlt.split(",");
		StringBuffer tsql=new StringBuffer();
		
		int lt=arrt.length;
		if(lt>0){
			for(int i=0;i<lt;i++){
					tsql.append(arrt[i]+" OR ");
			}
		}
		String sqlp=p.replace(",", " , p LIKE ");
		String[] arrp=sqlp.split(",");
		StringBuffer psql=new StringBuffer();
		
		int lp=arrp.length;
		if(lp>0){
			for(int j=0;j<lp;j++){
					psql.append(arrp[j]+" OR ");
			}
		}
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<cake> aryall=new ArrayList<cake>();//蛋糕信息的集合
		try{
			conn=DBHelp.getConnection();
			System.out.println("lt:"+lt+":"+arrt[1]+":lp:"+lp+":"+arrp[0]);
			//split之后即便是空字符也会产生长度为1的数组 影响了筛选条件类型数量的判断
			if(lt>1&&lp>1){
				stmt=conn.prepareStatement("select * from cake where ("+tsql.substring(5, tsql.length()-3)+") AND ("+psql.substring(5, psql.length()-3)+");");
				System.out.println("co1:"+"select * from cake where ("+tsql.substring(5, tsql.length()-3)+") AND ("+psql.substring(5, psql.length()-3)+");");
			}
			if(lt>1&&lp==1){
				stmt=conn.prepareStatement("select * from cake where "+tsql.substring(5, tsql.length()-3)+";");
				System.out.println("co1:"+"select * from cake where "+tsql.substring(5, tsql.length()-3)+";");
			}
			if(lp>1&&lt==1){
				stmt=conn.prepareStatement("select * from cake where "+psql.substring(5, psql.length()-3)+";");
				System.out.println("co1:"+"select * from cake where "+psql.substring(5, psql.length()-3)+";");
			}
			rs=stmt.executeQuery();
			int i=0;
			while(rs.next())
			{
				i++;
				System.out.println("i:"+i);
				cake iu=new cake();
				iu.setId(rs.getInt("id"));
				iu.setName(rs.getString("name"));
				iu.setEname(rs.getString("ename"));
				iu.setSweet(rs.getInt("sweet"));
				iu.setP(rs.getString("p"));
				iu.setPipo(rs.getString("pipo"));
				iu.setType(rs.getString("type"));
				iu.setSp1(rs.getString("sp1"));
				iu.setSp2(rs.getString("sp2"));
				aryall.add(iu);
				//把一个蛋糕信息加入集合
			}
			return aryall;
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
			return null;
		} 
		finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		}
//	  public static void main(String[] args)
//	  {
//		  try 
//		  {
//			  ope items = new ope(); 
//	             ArrayList<cake> list = items.getcakes();
//	             System.out.println("list"+items);
//	             if(list!=null&&list.size()>0)
//	             {
//		               for(int i=0;i<list.size();i++)
//		               {
//		                  cake item = list.get(i);
//		                  System.out.println(item.getName());	         
//	             }}
//		  }
//		  catch(Exception ex)
//		  {
//			  ex.printStackTrace();
//		  }}
}
