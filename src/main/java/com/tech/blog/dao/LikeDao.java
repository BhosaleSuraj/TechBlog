package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {
	
	Connection con;
	public LikeDao(Connection con)
	{
		this.con=con;
	}
	public boolean insertLike(int pid , int uid)
	{
		 boolean f=false;
		 
		try
		{
			String q="insert into likep(pid,uid)values(?,?)";
			PreparedStatement p=this.con.prepareStatement(q);
			p.setInt(1,pid);
			p.setInt(2, uid);
			p.executeUpdate();
			
			f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	
	public int countLikeOnPost(int pid )
	{
		int count=0;
		try
		{
			
		
		
		String q="select count(*) from likep where pid=?";
		
		PreparedStatement ps=this.con.prepareStatement(q);
		 ps.setInt(1, pid);
		 ResultSet rs=ps.executeQuery();
		 if(rs.next())
		 {
			 count=rs.getInt("count(*)");
		 }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	
	public boolean isLikeByUser(int pid , int uid)
	{
		boolean f=false;
		
		try
		{
			PreparedStatement p=this.con.prepareStatement("select * from likep where pid=? , uid= ?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			ResultSet set=p.executeQuery();
			if(set.next())
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deletLike(int pid , int uid)
	{
		boolean f=false;
		try
		{
			PreparedStatement p=this.con.prepareStatement("delete from likep where pid=? , uid=?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f=true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}

}
