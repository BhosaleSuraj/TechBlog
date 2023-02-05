package com.tech.blog.dao;

import java.sql.*;
import java.util.*;
import com.tech.blog.entities.Posts;

import com.tech.blog.entities.Categories;

public class PostDao 
{
	Connection con;
	
	public PostDao(Connection con)
	{
		this.con=con;
	}
	
	public ArrayList<Categories> getAllCategories()
	
	  {   
		
		
		ArrayList<Categories> list=new ArrayList<>();
		
		try
		{
			
			String q="select * from categories";
			Statement st=this.con.createStatement();
			ResultSet rs=st.executeQuery(q);
			
			while(rs.next())
			{
				int cid=rs.getInt("cid");
				String name=rs.getString("name");
				String description=rs.getString("description");
				
				Categories c=new Categories(cid,name,description);
				
				list.add(c);
			} 
					
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	} 
	 public boolean savePost(Posts p)

	  {
		boolean f=false;
		
		try
		{
			String q="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) value(?,?,?,?,?,?)";
			PreparedStatement psmt=con.prepareStatement(q);
			
			psmt.setString(1,p.getpTitle());
			psmt.setString(2,p.getpContent());
			psmt.setString(3,p.getpCode());
			psmt.setString(4,p.getpPic());
			psmt.setInt(5,p.getCatId() );
			psmt.setInt(6, p.getUserId());
			psmt.executeUpdate();
			f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
      }
    
	 //get All the post value
	 public List<Posts>getAllPosts()
	 {
		 List<Posts> list=new ArrayList<>();
		 
		 //fetch all the post
		 try
		 {
			PreparedStatement p=con.prepareStatement("select * from posts");
			
			ResultSet rs=p.executeQuery();
			while(rs.next())
			{
				int pId=rs.getInt("pId");
				String pTitle=rs.getString("pTitle");
				String pContent=rs.getString("pContent");
				String pCode=rs.getString("pCode");
				Timestamp pDate=rs.getTimestamp("pDate");
				int catId=rs.getInt("catId");
				int userId=rs.getInt("userId");
				
				Posts ps=new Posts( pId, pTitle, pContent,pCode ,pDate,  catId ,userId );
				
				list.add(ps);
						
			}
		 }
		 catch(Exception e)
		 {
			e.printStackTrace(); 
		 }
		 
		 return list;
	 }
	 
	 //get all the cat id
	 
	 public List<Posts>getPostByCatId(int catId)
	 {
        List<Posts> list=new ArrayList<>();
		 
		 //fetch all the  post data by catId
        try
        {
        	
            PreparedStatement p=con.prepareStatement("select * from posts where catId=?");
			
            p.setInt(1,catId);
            
			ResultSet rs=p.executeQuery();
			while(rs.next())
			{
				int pId=rs.getInt("pId");
				String pTitle=rs.getString("pTitle");
				String pContent=rs.getString("pContent");
				String pCode=rs.getString("pCode");
				Timestamp pDate=rs.getTimestamp("pDate");
				
				int userId=rs.getInt("userId");
				
				Posts ps=new Posts( pId, pTitle, pContent,pCode ,pDate,  catId ,userId );
				
				list.add(ps);
						
			}
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
		 
		 
		 return list;
	 }
	 
	 public Posts getPostByPostId(int postId) 
	 {   
		 Posts post=null;
		String q=" select * from posts where pId=?";
		try
		{
		PreparedStatement p=this.con.prepareStatement(q);
		p.setInt(1,postId);
		
		ResultSet rs=p.executeQuery();
		
		if(rs.next())
		{   
			
			int pId=rs.getInt("pId");
			String pTitle=rs.getString("pTitle");
			String pContent=rs.getString("pContent");
			String pCode=rs.getString("pCode");
			Timestamp pDate=rs.getTimestamp("pDate");
			
			int userId=rs.getInt("userId");
			int cid=rs.getInt("catId");
			
			post=new Posts( pId, pTitle, pContent,pCode ,pDate, cid  ,userId );
			
			 
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return post;
	 }
}
