package cn.ly.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

import cn.ly.util.*;
import cn.ly.bean.User;
import cn.ly.bean.patient;
import cn.ly.bean.prescription;
import cn.ly.bean.registration;


public class userDao  {

	public boolean add(User user) {
		// TODO Auto-generated method stub
		String sql = "insert into userinfo(name, password, phone, email)values(?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		try
		{
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getPhone());
			stmt.setString(4, user.getEmail());

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
	
	public User getOneUser(String username) {


		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		

		String sql = "select name, password, phone, email from userinfo where name= ? ";
		
		
		try
		{
				
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, username);
			
			rs  = stmt.executeQuery();

			if(rs.next()){
				User user = new User();
			
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));

				return user;
			}
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
	
	
	public boolean addRegistration(registration rg) {
		// TODO Auto-generated method stub
		String sql = "insert into registrationform(patientName, departmentNumber, doctorNumber, registrationTime, registrationFee)values(?,?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		try
		{
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, rg.getPatientName());
			stmt.setString(2, rg.getDepartmentNumber());
			stmt.setString(3, rg.getDoctorNumber());
			stmt.setString(4, rg.getRegistrationTime());
			stmt.setString(5, rg.getRegistrationFee());

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
	
public List<registration> getAllRegistration() {

		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;

		String sql = "select patientName, departmentNumber, doctorNumber, registrationTime, registrationFee from registrationform ";
		
		try
		{
			 List<registration> list= new ArrayList<registration>();
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			rs  = stmt.executeQuery();

			while(rs.next()){
				registration rg = new registration();
				
				rg.setPatientName(rs.getString("patientName"));
				rg.setDepartmentNumber(rs.getString("departmentNumber"));
				rg.setDoctorNumber(rs.getString("doctorNumber"));
				rg.setRegistrationTime(rs.getString("registrationTime"));
				rg.setRegistrationFee(rs.getString("registrationFee"));
				
				list.add(rg);
				
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
	public boolean addPatient(patient pt) {
		// TODO Auto-generated method stub
		String sql = "insert into patientinfo(patientName, patientSex, patientDescription, medicinal, time, doctorNumber)values(?,?,?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		try
		{
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, pt.getPatientName());
			stmt.setString(2, pt.getPatientSex());
			stmt.setString(3, pt.getPatientDescription());
			stmt.setString(4, pt.getMedicinal());
			stmt.setString(5, pt.getTime());
			stmt.setString(6, pt.getDoctorNumber());

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
	
	public List<patient> getAllPatient() {

		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;

		String sql = "select patientName, patientSex, patientDescription, medicinal, time, doctorNumber from patientinfo ";
		
		try
		{
			 List<patient> list= new ArrayList<patient>();
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			rs  = stmt.executeQuery();

			while(rs.next()){
				patient pt = new patient();
				
				pt.setPatientName(rs.getString("patientName"));
				pt.setPatientSex(rs.getString("patientSex"));
				pt.setPatientDescription(rs.getString("patientDescription"));
				pt.setMedicinal(rs.getString("medicinal"));
				pt.setTime(rs.getString("time"));
				pt.setDoctorNumber(rs.getString("doctorNumber"));
				
				list.add(pt);
				
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
	
	public boolean addPrescription(prescription ps) {
		// TODO Auto-generated method stub
		String sql = "insert into prescriptioninfo(medicinalName, medicinalNumber) values(?,?)";
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;
		
		try
		{
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, ps.getMedicinalName());
			stmt.setString(2, ps.getMedicinalNumber());

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
	
	public List<prescription> getAllPrescription() {

		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs =null;

		String sql = "select medicinalName, medicinalNumber from prescriptioninfo";
		
		try
		{
			 List<prescription> list= new ArrayList<prescription>();
			conn = C3P0Util.getConnection();
			stmt = conn.prepareStatement(sql);
			
			rs  = stmt.executeQuery();

			while(rs.next()){
				prescription ps = new prescription();
				
				ps.setMedicinalName(rs.getString("medicinalName"));
				ps.setMedicinalNumber(rs.getString("medicinalNumber"));
				
				list.add(ps);
				
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

}
