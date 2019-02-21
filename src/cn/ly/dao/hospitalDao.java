package cn.ly.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.ly.util.*;
import cn.ly.bean.User;
import cn.ly.bean.department;
import cn.ly.bean.doctor;
import cn.ly.bean.medicinal;


public class hospitalDao  {
	
	public boolean addDepartment(department dp) {
		String sql = "insert into departmentinfo(departmentName, departmentDescription, departmentNumber)values(?,?,?)";
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		try
		{
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, dp.getDepartmentName());
			stmt.setString(2, dp.getDepartmentDescription());
			stmt.setString(3, dp.getDepartmentNumber());
			
			int rows  = stmt.executeUpdate();

		    if(rows>0)
		    	return true;

		}
		catch(Exception e)
		{
			throw new RuntimeException(e);	
		}
		finally
		{
			C3P0Util.release(rs, stmt, conn);
		}

		return false;
	}

	
	public boolean delete(String dpName) {
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		String sql = "delete from departmentinfo where departmentName=? ";

		try
		{
			 List<department> list= new ArrayList<department>();
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql );
			stmt.setString(1, dpName);
			
			int rows  = stmt.executeUpdate();
			
			if(rows>0)
			
			return true;
			else
				return false;

		}
		catch(Exception e)
		{
			throw new RuntimeException(e);
			
		}
		finally
		{
			C3P0Util.release(rs, stmt, conn);
			
		}
		
	}
	
     public List<department> getAllUser() {
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;

		String sql = "select departmentName, departmentDescription, departmentNumber from departmentInfo ";
		
		try
		{
			List<department> list= new ArrayList<department>();
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			rs  = stmt.executeQuery();

			while(rs.next()){
				department dp = new department();
				
				dp.setDepartmentName(rs.getString("departmentName"));
				dp.setDepartmentDescription(rs.getString("departmentDescription"));
				dp.setDepartmentNumber(rs.getString("departmentNumber"));

				list.add(dp);

				
			}
			return list;
		}
		catch(Exception e)
		{
			throw new RuntimeException(e);
			
		}
		finally
		{
			C3P0Util.release(rs, stmt, conn);
			
		}
	}

	
	public department getOneDp(String dpName) {
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		

		String sql = "select departmentName, departmentDescription, departmentNumber from departmentinfo where departmentName= ?";
		
		System.out.println(dpName + "Dao");
		
		try
		{
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, dpName);
			
			rs  = stmt.executeQuery();

			if(rs.next()){
				
	            department dp = new department();
				
				dp.setDepartmentName(rs.getString("departmentName"));
				dp.setDepartmentDescription(rs.getString("departmentDescription"));
				dp.setDepartmentNumber(rs.getString("departmentNumber"));
				
				 List<department> list= new ArrayList<department>();
				 list.add(dp);
				 
				return dp;
				
			}
			System.out.println("not find");
			return null;			
		}
		catch(Exception e)
		{
			throw new RuntimeException(e);
			
		}
		finally
		{
			C3P0Util.release(rs, stmt, conn);
			
		}
		
	}

	public boolean update(department dp) {
		String sql = "update  departmentinfo set  departmentDescription=?, departmentNumber=? where departmentName=?";
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		System.out.println(dp.getDepartmentName());
		try
		{	
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(3, dp.getDepartmentName());
			stmt.setString(1, dp.getDepartmentDescription());
			stmt.setString(2, dp.getDepartmentNumber());
			
			int rows  = stmt.executeUpdate();

		    if(rows>0)
		    	return true;

		}
		catch(Exception e)
		{
			throw new RuntimeException(e);	
		}
		finally
		{
			C3P0Util.release(rs, stmt, conn);
		}

		return false;
		
	}

	public boolean addMedicinal(medicinal md) {
		String sql = "insert into medicinalinfo(medicinalId, medicinalName, medicinalNumber, medicinalPrice, medicinalDescription)values(?,?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		try
		{
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, md.getMedicinalId());
			stmt.setString(2, md.getMedicinalName());
			stmt.setString(3, md.getMedicinalNumber());
			stmt.setString(4, md.getMedicinalPrice());
			stmt.setString(5, md.getMedicinalDescription());
		
			int rows  = stmt.executeUpdate();

		    if(rows>0)
		    	return true;

		}
		catch(Exception e)
		{
			throw new RuntimeException(e);	
		}
		finally
		{
			C3P0Util.release(rs, stmt, conn);
		}

		return false;
	}
	
	public medicinal getOnemd(String mdId) {
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		

		String sql = "select medicinalId, medicinalName, medicinalNumber, medicinalPrice, medicinalDescription from medicinalinfo where medicinalId= ?";
		
		try
		{
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, mdId);
			
			rs  = stmt.executeQuery();

			if(rs.next()){
				
	            medicinal md = new medicinal();
				
	            md.setMedicinalId(rs.getString("medicinalId"));
	            md.setMedicinalName(rs.getString("medicinalName"));
	            md.setMedicinalNumber(rs.getString("medicinalNumber"));
	            md.setMedicinalPrice(rs.getString("medicinalPrice"));
	            md.setMedicinalDescription(rs.getString("medicinalDescription"));
	           
				
				 List<medicinal> list= new ArrayList<medicinal>();
				 list.add(md);
				 
				return md;
				
			}
		//	System.out.println("not find");
			return null;			
		}
		catch(Exception e)
		{
			throw new RuntimeException(e);
			
		}
		finally
		{
			C3P0Util.release(rs, stmt, conn);
			
		}
		
	}
	  public List<medicinal> getAllMedicinal() {
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs =null;

			String sql = "select medicinalId, medicinalName, medicinalNumber, medicinalPrice, medicinalDescription from medicinalinfo";
			
			try
			{
				List<medicinal> list= new ArrayList<medicinal>();
				conn = C3P0Util.getConnection();
				stmt = conn.prepareStatement(sql);
				
				rs  = stmt.executeQuery();

				while(rs.next()){
					 medicinal md = new medicinal();
							
		            md.setMedicinalId(rs.getString("medicinalId"));
		            md.setMedicinalName(rs.getString("medicinalName"));
		            md.setMedicinalNumber(rs.getString("medicinalNumber"));
		            md.setMedicinalPrice(rs.getString("medicinalPrice"));
		            md.setMedicinalDescription(rs.getString("medicinalDescription"));
			
					
				    list.add(md);
					
				}
				return list;
			}
			catch(Exception e)
			{
				throw new RuntimeException(e);
				
			}
			finally
			{
				C3P0Util.release(rs, stmt, conn);
				
			}
		}
	  
		public boolean deleteMedicinal(String mdId) {
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs =null;
			
			String sql = "delete from medicinalinfo where medicinalId=? ";

			try
			{
				conn = C3P0Util.getConnection();
				stmt = conn.prepareStatement(sql );
				stmt.setString(1, mdId);
				
				int rows  = stmt.executeUpdate();
				
				if(rows>0)
				
				return true;
				else
					return false;

			}
			catch(Exception e)
			{
				throw new RuntimeException(e);
				
			}
			finally
			{
				C3P0Util.release(rs, stmt, conn);
				
			}
			
		}
		
		public boolean updateMedicinal(medicinal md) {
			String sql = "update  medicinalinfo set  medicinalName = ?, medicinalNumber = ?, medicinalPrice = ?, medicinalDescription = ? where medicinalId=?";
			
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs =null;
			
			try
			{	
				conn = C3P0Util.getConnection();
				stmt = conn.prepareStatement(sql);
				
				System.out.println(md.getMedicinalId() + "DaoId");
				
				stmt.setString(5, md.getMedicinalId());
				stmt.setString(1, md.getMedicinalName());
				stmt.setString(2, md.getMedicinalNumber());
				stmt.setString(3, md.getMedicinalPrice());
				stmt.setString(4, md.getMedicinalDescription());
				
				int rows  = stmt.executeUpdate();

			    if(rows>0)
			    	return true;

			}
			catch(Exception e)
			{
				throw new RuntimeException(e);	
			}
			finally
			{
				C3P0Util.release(rs, stmt, conn);
			}

			return false;
			
		}
		
		public boolean addDoctor(doctor dc) {
			String sql = "insert into doctorinfo(doctorNumber, doctorName, doctorSex, doctorAge, doctorBirthday, doctorMarriage, doctorEducation, doctorCareer, Expert)values(?,?,?,?,?,?,?,?,?)";
			
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs =null;
			
			try
			{
				conn = C3P0Util.getConnection();
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, dc.getdoctorNumber());
				stmt.setString(2, dc.getdoctorName());
				stmt.setString(3, dc.getdoctorSex());
				stmt.setString(4, dc.getdoctorAge());
				stmt.setString(5, dc.getdoctorBirthday());
				stmt.setString(6, dc.getdoctorMarriage());
				stmt.setString(7, dc.getdoctorEducation());
				stmt.setString(8, dc.getdoctorCareer());
				stmt.setString(9, dc.getExpert());
				
				int rows  = stmt.executeUpdate();

			    if(rows>0)
			    	return true;

			}
			catch(Exception e)
			{
				throw new RuntimeException(e);	
			}
			finally
			{
				C3P0Util.release(rs, stmt, conn);
			}

			return false;
		}
		
		public doctor getOneDc(String dcNumber) {
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs =null;
			

			String sql = "select doctorNumber, doctorName, doctorSex, doctorAge, doctorBirthday, doctorMarriage, doctorEducation, doctorCareer, Expert from doctorinfo where doctorNumber= ?";
			
			try
			{
				conn = C3P0Util.getConnection();
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, dcNumber);
				
				rs  = stmt.executeQuery();

				if(rs.next()){
					
		            doctor dc = new doctor();
					
					dc.setdoctorNumber(rs.getString("doctorNumber"));
		    		dc.setdoctorName(rs.getString("doctorName"));
		    		dc.setdoctorSex(rs.getString("doctorSex"));
		    		dc.setdoctorAge(rs.getString("doctorAge"));
		    		dc.setdoctorBirthday(rs.getString("doctorBirthday"));
		    		dc.setdoctorMarriage(rs.getString("doctorMarriage"));
		    		dc.setdoctorEducation(rs.getString("doctorEducation"));
		    		dc.setdoctorMarriage(rs.getString("doctorMarriage"));
		    		dc.setdoctorCareer(rs.getString("doctorCareer"));
		    		dc.setdoctorExpert(rs.getString("Expert"));
					
					 List<doctor> list= new ArrayList<doctor>();
					 list.add(dc);
					 
					return dc;
					
				}
			//	System.out.println("not find");
				return null;			
			}
			catch(Exception e)
			{
				throw new RuntimeException(e);
				
			}
			finally
			{
				C3P0Util.release(rs, stmt, conn);
				
			}
			
		}
		  public List<doctor> getAllDoctor() {
				Connection conn=null;
				PreparedStatement stmt=null;
				ResultSet rs =null;

				String sql = "select doctorNumber, doctorName, doctorSex, doctorAge, doctorBirthday, doctorMarriage, doctorEducation, doctorCareer, Expert from doctorInfo ";
				
				try
				{
					List<doctor> list= new ArrayList<doctor>();
					conn = C3P0Util.getConnection();
					stmt = conn.prepareStatement(sql);
					
					rs  = stmt.executeQuery();

					while(rs.next()){
						doctor dc = new doctor();
						dc.setdoctorNumber(rs.getString("doctorNumber"));
			    		dc.setdoctorName(rs.getString("doctorName"));
			    		dc.setdoctorSex(rs.getString("doctorSex"));
			    		dc.setdoctorAge(rs.getString("doctorAge"));
			    		dc.setdoctorBirthday(rs.getString("doctorBirthday"));
			    		dc.setdoctorMarriage(rs.getString("doctorMarriage"));
			    		dc.setdoctorEducation(rs.getString("doctorEducation"));
			    		dc.setdoctorMarriage(rs.getString("doctorMarriage"));
			    		dc.setdoctorCareer(rs.getString("doctorCareer"));
			    		dc.setdoctorExpert(rs.getString("Expert"));
						
						
					    list.add(dc);
						
					}
					return list;
				}
				catch(Exception e)
				{
					throw new RuntimeException(e);
					
				}
				finally
				{
					C3P0Util.release(rs, stmt, conn);
					
				}
			}
		  
			public boolean deleteDoctor(String dcNumber) {
				Connection conn=null;
				PreparedStatement stmt=null;
				ResultSet rs =null;
				
				String sql = "delete from doctorinfo where doctorNumber=? ";

				try
				{
					 List<department> list= new ArrayList<department>();
					conn = C3P0Util.getConnection();
					stmt = conn.prepareStatement(sql );
					stmt.setString(1, dcNumber);
					
					int rows  = stmt.executeUpdate();
					
					if(rows>0)
					
					return true;
					else
						return false;

				}
				catch(Exception e)
				{
					throw new RuntimeException(e);
					
				}
				finally
				{
					C3P0Util.release(rs, stmt, conn);
					
				}
				
			}
			
			public boolean updateDoctor(doctor dc) {
				String sql = "update  doctorinfo set doctorName = ?, doctorSex = ?, doctorAge = ?, doctorBirthday = ?, doctorMarriage = ?, doctorEducation = ?, doctorCareer = ?, Expert = ? where doctorNumber=?";
				
				Connection conn=null;
				PreparedStatement stmt=null;
				ResultSet rs =null;
				
				try
				{	
					conn = C3P0Util.getConnection();
					stmt = conn.prepareStatement(sql);
					
					stmt.setString(9, dc.getdoctorNumber());
					stmt.setString(1, dc.getdoctorName());
					stmt.setString(2, dc.getdoctorSex());
					stmt.setString(3, dc.getdoctorAge());
					stmt.setString(4, dc.getdoctorBirthday());
					stmt.setString(5, dc.getdoctorMarriage());
					stmt.setString(6, dc.getdoctorEducation());
					stmt.setString(7, dc.getdoctorCareer());
					stmt.setString(8, dc.getExpert());
					
					int rows  = stmt.executeUpdate();

				    if(rows>0)
				    	return true;

				}
				catch(Exception e)
				{
					throw new RuntimeException(e);	
				}
				finally
				{
					C3P0Util.release(rs, stmt, conn);
				}

				return false;
				
			}

}
