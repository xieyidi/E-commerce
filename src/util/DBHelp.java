package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelp {
	  private static final String driver="com.mysql.jdbc.Driver";
	  private static final String url="jdbc:mysql://localhost:3306/nuoxin?useUnicode=true&characterEncoding-UTF-8";
	  //?useUnicode=true&characterEncoding-UTF-8
	  private static final String username="root";
	  private static final String password="12xie";
	  //mysql-connector-javaÐèÒªbuild path
	  static Connection conn=null;
	  static
	  {
		  try
		  {
			  Class.forName(driver);
		  }
		  catch(Exception ex)
		  {
			  ex.getStackTrace();
		  }
	  }
	  public static Connection getConnection()throws Exception
	  {
		  if(conn==null)
		  {
			  conn=DriverManager.getConnection(url, username, password);
			  return conn;
		  }
		  return conn;
	  }
//	  public static void main(String[] args)
//	  {
//		  try 
//		  {
//			  Connection conn=DBHelp.getConnection();
//			  if(conn!=null)
//			  {System.out.println("success");}
//			  else
//			  {System.out.println("fail");}
//		  }
//		  catch(Exception ex)
//		  {
//			  ex.printStackTrace();
//		  }
//	  }
}