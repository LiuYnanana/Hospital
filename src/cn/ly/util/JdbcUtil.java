package cn.ly.util;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class JdbcUtil {

	private static String classname;
	private static String url;
	private static String user;
	private static String password;
	
	static
	{
		try{
			
			classname="com.mysql.jdbc.Driver";
			url="jdbc:mysql://localhost:3306/hospital?useUnicode=true&amp;characterEncoding=utf-8";
			user="root";
			password="123456";
			
			//1��������������ע������
			Class.forName(classname);
			
		}
		catch(Exception e)
		{
			throw new RuntimeException(e);
		}	
	}
	

	public static Connection getConnection() throws Exception
	{
		Connection conn=null;
		conn =  DriverManager.getConnection(url, user, password);
		return conn;
	}
	
	
	public static void release(ResultSet rs,Statement stmt,Connection conn)
	{
		if (rs != null) try { rs.close(); } catch(Exception e) {} rs=null;
        if (stmt != null) try { stmt.close(); } catch(Exception e) {}stmt=null;
        if (conn != null) try { conn.close(); } catch(Exception e) {}	
	}
	
	
	
}
