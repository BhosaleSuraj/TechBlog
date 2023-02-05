<%@page import="com.tech.blog.helper.ProvideConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!-- navbar -->
 <%@include file="normal_navbar.jsp" %>

 <%--    <h1>Hello World</h1>
  <!-- connection page link -->
  
   <%
     Connection con=ProvideConnection.getConnection();
     %>  
    <h1><%= con %></h1>  --%> 
    
    <!-- //banner -->
    <div class="container-fluid p-0 m-0">
     <div class="jumbotron primary-background">
     <div class="container">
     <h1 class="display-3"> WELCOME TO TECHBLOG</h1>
     <P> Welcome to technical blog ,World of Technology
     As we know, to communicate with a person, we need a specific language, similarly to communicate with computers, programmers also need a language is called Programming language.</P>
     <p>Before learning the programming language, let's understand what is language?</p>
     <a href="register_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-plus"></span>Start ! its free</a>
      <a href="login_page.jsp" class="btn btn-outline-light"><span class="	fa fa-user-circle-o fa-spin"></span>Login</a>
     </div>
     </div>
    </div>
    <br>
    
    <!-- cards -->
    <div class="container">
    <div class="row mb-2 ">
    <div class="co-md-4">
      <div class="card" style="width: 23rem;">
     <div class="card-body">
    <h5 class="card-title">Java Programing</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
  </div>
</div>
    </div>
    <div class="co-md-4">
      <div class="card" style="width: 23rem;">
     <div class="card-body">
    <h5 class="card-title">Java Programing</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
  </div>
</div>
    </div>
    <div class="co-md-4">
      <div class="card" style="width: 23rem;">
     <div class="card-body">
    <h5 class="card-title">Java Programing</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
  </div>
</div>
    </div>
    </div>
    
    <div class="row">
    <div class="co-md-4">
      <div class="card" style="width: 23rem;">
     <div class="card-body">
    <h5 class="card-title">Java Programing</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
  </div>
</div>
    </div>
    <div class="co-md-4">
      <div class="card" style="width: 23rem;">
     <div class="card-body">
    <h5 class="card-title">Java Programing</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
  </div>
</div>
    </div>
    <div class="co-md-4">
      <div class="card" style="width: 23rem;">
     <div class="card-body">
    <h5 class="card-title">Java Programing</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read more</a>
  </div>
</div>
    </div>
    </div>
    </div>
    
  <!-- javascript -->
  <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="jscript/myjs.js" type="text/javascript"></script>
   <script>
   </script>
</body>
</html>