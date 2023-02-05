


<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helper.ProvideConnection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page import=" java.util.*" %>
<%@ page import="com.tech.blog.entities.Posts" %>
		
		<div class="row">
		<% 
		  
		 User ud=(User)session.getAttribute("currentUser");
		
		 Thread.sleep(1000);
		PostDao d=new PostDao(ProvideConnection.getConnection());
		
		int cid=Integer.parseInt(request.getParameter("cId"));
		List<Posts> posts =null;
		if(cid==0)
		{
			posts=d.getAllPosts();
		}
		else
		{
			posts=d.getPostByCatId(cid);
		}
		
		if(posts.size()==0)
		{
			out.println("<h3 class='display-3 text-center'>No post in this categories..</h3>");
		}
		
		
		for(Posts p : posts)
		{
			%>
			<div class="col-md-6 mt-2">
			 <div class="card">
			 <div class="card-body">
			   <b><%= p.getpTitle() %></b>
			   <p> <%= p.getpContent() %></p>
			  <pre><%= p.getpCode() %></pre>
			 </div>
			 
			  <div class="card-footer text-center bg-dark">
			       
			        <%
			          LikeDao ld=new LikeDao(ProvideConnection.getConnection());
			          
			        
			        %>
			       
			       
			       <a href="show_blog_page.jsp?post_id=<%= p.getpId() %>" class="btn btn-outline-primary btn-sm">Read More</a> 
			        <a href="#!" onclick="doLike(<%= p.getpId() %>,<%= ud.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ld.countLikeOnPost(p.getCatId()) %></span></i></a>
			        <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>  
			 </div>
			 
			</div>
			 </div>
			
   		<% 
		   }
		
		%>
		
		</div>
		