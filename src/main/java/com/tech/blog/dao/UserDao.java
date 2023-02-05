package com.tech.blog.dao;
import java.sql.*;


import com.tech.blog.entities.User;
public class UserDao {
	private Connection con;
	
	public UserDao(Connection con)
	{
		this.con=con;
	}
	
	public boolean saveUser(User user)
	{
		 boolean f=false ;
		try
		{
			//user --> databases
			
			String query="insert into user(name,email,password,gender,about) value(?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			//pstmt.setString(6, user.getProfile());
			pstmt.executeUpdate();
			f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	// get user by user name and user password help of login page 
	
	public User getUserByEmailAndPassword(String email, String password)
	{
		User user=null;
		
		try
		{
			String query="select * from user where email=? and password=?";
			PreparedStatement psmt=con.prepareStatement(query);
			psmt.setString(1, email);
			psmt.setString(2, password);
			
			ResultSet rs=psmt.executeQuery();
			
			
			if(rs.next())
			{
				user=new User();
				
				// data form the get database
				
				
				String name=rs.getString("name");
				// set to user object 
				
				user.setName(name);
				
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setAbout(rs.getString("about"));
				user.setGender(rs.getString("gender"));
				user.setDateTime(rs.getTimestamp("rdate"));
				//user.setProfile(rs.getString("profile"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return user;
	}
         //update the database
	   public boolean updateUser(User user)
	   {     
		   boolean f=false;
		   try {
			   String query ="update user set name=? ,email=?,password=?,gender=?,about=? where id=?";
			   PreparedStatement p=con.prepareStatement(query);
			   
			   p.setString(1, user.getName());
			   p.setString(2, user.getEmail());
			   p.setString(3,user.getPassword());
			   p.setString(4,user.getGender());
			   p.setString(5,user.getAbout());
			 //  p.setString(6,user.getProfile());
			   p.setInt(6, user.getId());
			   
			   p.executeUpdate();
			   f=true;
		       }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   return f;
	   }

   public User getUserByUserId(int userId)
   {
	   User user=null;
	   try
	   {
		 String q="select * from user where id=?";
		  PreparedStatement ps=con.prepareStatement(q);
		  ps.setInt(1, userId);
		  ResultSet rs=ps.executeQuery();
		  if(rs.next())
		  {
			  user=new User();
				
				// data form the get database
				
				
				String name=rs.getString("name");
				// set to user object 
				
				user.setName(name);
				
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setAbout(rs.getString("about"));
				user.setGender(rs.getString("gender"));
				user.setDateTime(rs.getTimestamp("rdate"));
		  }
	   }
	   catch(Exception e)
	   {
		   e.printStackTrace();
	   }
	   return user;
   }
}
