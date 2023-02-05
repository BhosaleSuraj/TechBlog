<%@page import="com.tech.blog.helper.ProvideConnection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page errorPage="error_page.jsp" %>
<%@ page import=" com.tech.blog.entities.Categories" %>
<%@ page import=" java.util.ArrayList" %>
<%@page import="com.tech.blog.entities.Message"%>

<!-- valliadation -->
<% 
 User user=(User)session.getAttribute("currentUser");
if(user==null)
{
  response.sendRedirect("login_page.jsp");	
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile jsp pages</title>

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
					            background:url(img/bgc.jpeg);
					            background-size:cover;
					            background-attachment:fixed;
					        }
</style>


</head>
<body>

<!-- navbar of profile jsp -->
   <nav class="navbar navbar-expand-lg navbar-light primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-briefcase"></span>TECHBLOG</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-book"></span>LERARN NEW TECHNOLOGY<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="fa fa-unsorted"></span> CATEGORIES
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">ROGRAMING LANGAUGE</a>
          <a class="dropdown-item" href="#">PROJECT IMPLEMENTATION</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">DATA STRUCTURE</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal"><span class="fa fa-address-card-o"></span>CONTACT</a>
        
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-bars"></span>Do Post</a>
      </li>
      
      
      
    </ul>
    <ul class="navbar-nav mr-right">
     <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName() %></a>
      </li>
      
     <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
      </li>
    </ul>
  </div>
</nav>
<!-- end of navbar -->


        <% 
  
          Message m= (Message)session.getAttribute("msg");
		  if(m!=null)
		  {
					  %>
					  
					  <div class="alert  <%= m.getCssClass()   %>" role="alert">
		               <%= m.getContent() %>
		             </div>
		             <%
		            
		             session.removeAttribute("msg");
				  }
		  
		  %>
		  
		   <!-- main body of the page -->
		   
		   <main>
   
    <div class="container">
    
    <div class="row mt-4">
    <!-- first colomn -->
    <div class="col-md-4 ">
    <!-- list of categories -->
    
    <div class="list-group">
  <a href="#"  onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active ">
    All posts
  </a>
   <!-- all categories -->
   
   <%
     PostDao d=new PostDao(ProvideConnection.getConnection());
   
   ArrayList<Categories> list1=d.getAllCategories();
   
   for(Categories cc:list1)
   {
 	  
  
 %>
  
  <a href="#" onclick="getPosts(<%=cc.getCid() %>,this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName() %></a>


<%
   }
 %>
   
  
  
</div>
    
    </div>
    
    <!-- second colomn -->
    <div class="col-md-8" id="post_container">
    <!-- All post are show -->
    <div class="container text-center" id="loader">
      <i class="fa fa-refresh fa-4 fa-spin"></i>
      <h3 class="mt-2">Loadding....</h3>
    </div>
    
    <div class="container-fluid" id="post_container">
    
    </div>
    
    </div>
    
    </div>
    </div>
   </main>
   
   <!-- end main body tag -->

<!--  navbar modal button start -->

 <!-- Button trigger modal -->
 <!--  
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#profile-modal">
  Launch demo modal
</button> -->

<!-- Modal -->

<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body ">
      
      <div class="container text-center">
      
     
       <h5 class="modal-title" id="exampleModalLabel">!!&nbsp;<%= user.getName() %>&nbsp;!!</h5>
       
       <!-- details Ingormation table bootstrap -->
     
      <div id="profile-details">
       <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">ID:</th>
      <td><%= user.getId() %></td>
     
    </tr>
    <tr>
      <th scope="row">Email:</th>
      <td><%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td><%= user.getGender() %></td>
      
    </tr>
    <tr>
      <th scope="row">Status</th>
      <td><%= user.getAbout() %></td>
      
    </tr>
     <tr>
      <th scope="row">Register on</th>
      <td><%= user.getDateTime().toString()%></td>
      
    </tr>
  </tbody>
</table>
</div> 
       <!-- end table -->
       
       <!-- profile edit in my table -->
         
         <div id="profile-edit" style="display:none">
         <h3 class="mt-2">Plese Edit Carefully</h2>
         <!-- form of user -->
         <form action="EditServlet" method="post"  enctype="multipart/form-data">
         <table class="table">
            <tr>
               <td>ID:</td>
               <td><%= user.getId() %></td>
            </tr>
            
             <tr>
               <td>Email:</td>
               <td><input type="email" class="fprm-control" name="user_email" value="<%=user.getEmail() %>"> </td>
            </tr>
            
             <tr>
               <td>Name:</td>
               <td><input type="text" class="fprm-control" name="user_name" value="<%=user.getName() %>"> </td>
            </tr>
            
             <tr>
               <td>Password:</td>
               <td><input type="Password" class="fprm-control" name="user_password" value="<%=user.getPassword() %>"> </td>
            </tr>
            
            <tr>
               <td>Gender:</td>
               <td><%= user.getGender().toUpperCase() %></td>
            </tr>
            
            <tr>
               <td>About:</td>
               <td>
               <textarea  rows="4"class="form-control" name="user_about"> <%= user.getAbout() %>
               </textarea>
               </td>
            </tr>
        <!-- <tr>
               <td>New Profile:</td>
               <td>
               <input type="file" name="image" class="form-control">
               </td>
            </tr>
         -->
         </table>
         <div class="container">
         
         <button type="submit" class="btn btn-outlinr-primary">Save</button>
         </div>
         </form>
         
         </div>
       
       <!-- end of my edit profile code -->
        </div>.
        </div>..
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button  id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
  <!-- navbar end modal -->
  
  
 
  
  
  <!-- contact modal -->
  


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Helpline </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <div >
        <h4>+91 7420828659</h4><br>
        <h4>+91 7972992935</h4>
       
      </div>
        ...
      </div>
     
    </div>
  </div>
</div>
  <!-- end contact modal -->
  
   <!-- stsrt post modal -->
<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <form  id="add-post-form" action="AddPostServlet" method="post">
      <div class="form-group">
      
        <select class="form-control" name="cid">
            <option selected disabled>--Select category--</option>
            
            <%
              PostDao pd=new PostDao(ProvideConnection.getConnection());
              ArrayList<Categories> list=pd.getAllCategories();
              
              for(Categories c:list)
              {
            	  
             
            %>
           <option value="<%=c.getCid()%>"><%= c.getName() %></option>
           
          
           
           <%
              }
            %>
        </select>
      </div>
      <div class="form-group">
        <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
      </div>
      
      
      <div class="form-group">
      
        <textarea  name="pContent" class="form-control"  placeholder="Enter your content"  style="height:100px;"></textarea>
      </div>
      
      <div class="form-group">
      
        <textarea  name="pCode"  class="form-control"  placeholder="Enter your Program code (if any)"  style="height:100px;"></textarea>
      </div>
      
     <!--   <div class="form-group">
      <lable>Select your pic..</lable>
      <br>
      <input name="pPic" type="file">
      </div> -->
      
      <div class="container text-center">
        <button type="submit" class="btn btn-outline-primary">Post</button>
      </div>
      
      </form>
        ...
      </div>
      
    </div>
  </div>
</div>
  
  <!-- end post model -->
    
     <!-- javascript -->
  <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="jscript/myjs.js" type="text/javascript"></script>
 <script>
 $(document).ready(function(){
	 let editStatus="false";
	 
	 $('#edit-profile-btn').click(function(){
		// alert("button clicked")
		
		if(editStatus==false)
			{
			$("#profile-details").hide()
			
			$("#profile-edit").show();
			
			editStatus=true;
			$(this).text("Back")
			}
		else
			{
           $("#profile-details").show()
			
			$("#profile-edit").hide();
			
			editStatus=false;
			$(this).text("Edit")
			
			}
		
	 })
 })
 </script>
   <script>
  
   </script>
   <!-- add for post js -->
   <script>
     
      $(document).ready(function(e)
      {
    	  $("#add-post-form").on("submit",function (event)
    			  {
    		        event.preventDefault();
    		        
    		        console.log("you have submited")
    		        
    		        let form=new FormData(this);
    		        //now requesting to server
    		        
    		        $.ajax({
    		        	
    		        	url: "AddPostServlet",
    		        	type: 'POST',
    		        	data : form,
    		        	
    		        	success: function(data, textStatus,jqXHR)
    		        	{
    		        		//get request successfully
    		        		console.log(data);
    		        		
    		        		if(data.trim()=='done')
    		        			{
    		        			swal("Good job!", "Save Successfully...!", "success");
    		        			}
    		        		
    		        		else
    		        			{
    		        			swal("Error!", "Something went wrong.....!", "error");
    		        			}
    		        	},
    		        	
    		        	error: function(jqXHR, textStatus, errorThrown)
    		        	{
    		        		//get the error to call the function
    		        	},
    		        	
    		        	processData:false,
    		        	contentType:false	
    		        })
    			  })
      })
  
   </script>
   <!-- loading posts using ajax -->
           <script>
           
            function getPosts(catId, temp)
            {        
            	$("#loader").show();
            	$("#post_container").hide()
            	$(".c-link").removeClass('active')
            	
                     $.ajax({
            		 
            		 url:"load_post.jsp",
            		 data:{cId:catId},
            		 success: function(data, textStatus , jqXHR){
            			 
            			 console.log(data);
            			 
            			 $("#loader").hide();
            			 $("#post_container").show();
            			 $('#post_container').html(data)
            			$(temp).addClass('active')
            		 }
            	 })
            }
            
             $(document).ready(function(e){
            	 
            	 let getAllPostRef=$('.c-link')[0]
            	getPosts(0,getAllPostRef);
             })
           </script>
   
</body>
</html>