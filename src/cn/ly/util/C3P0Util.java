package cn.ly.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Util {
	private static String className;
	static String user;;
	static String password;;
	static String url;
	
	
	private static ComboPooledDataSource ds = new ComboPooledDataSource();
	
	
	public static DataSource getDataSource()
	{
		return ds;
	
	}
	
	
	//2�õ����ݿ������
	
	public static Connection getConnection()
	{
		

		Connection conn;
		try
		{
			conn =	ds.getConnection();
		}
		catch(Exception e)
		{
			
			throw new RuntimeException(e);
		}
		
		
		return conn;
		
		
	}
	
	
	
	//3.�ͷ���Դ
	
	
	public static void release( 
			ResultSet rs,Statement st, Connection conn)
	{
		
		try{if(rs!=null)rs.close();}catch(Exception ex){}
		try{if(st!=null)st.close();}catch(Exception ex){}
		try{if(conn!=null)conn.close();}catch(Exception ex){}	
		conn=null; st=null;rs=null;
		
	}
	
}
