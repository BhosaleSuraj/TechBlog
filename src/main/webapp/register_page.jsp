<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%@include file="normal_navbar.jsp" %>

<main class="bg p-2">
 <div class="container">
  <div class="col-md-6 offset-md-3">
  <div class="card">
  
  <div class="card-header text-center">
   <span class="fa fa-3x fa-user-circle"></span>
    <h1>Register hear</h1>
  </div>
  
  <div class="card-body">
  
  <form action="RegisterServlet" method="post" id="reg-form">
  
  <div class="form-group">
    <label for="user_name">User Name</label>
    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
    </div>
  
  
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  
  
  
  
  <div class="form-group">
    <label for="gender">Select Gender</label>
    <br>
    <input type="radio"  id="gender" name="gender" value="male">male
    <input type="radio"  id="gender" name="gender" value="female" >female
    </div>
  
  
  
    <div class="form-group">
    
    <textarea name="about"  class="form-control" id="" rows="5" placeholder="Enter something about yourself!"></textarea>
  </div>
  
  <div class="form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">agree term and condition</label>
  </div>
  
  <br> 
  <div class="container" id="loader" style="display:none;">
  <span class="fa fa-refresh fa-spin fa-2x" ></span>
  <h4>wait.....</h4>
  </div>
  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
</form>
  </div>
  
 
  </div>
  </div>
 </div>
</main>



<!-- javascript -->
  <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="jscript/myjs.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
$(document).ready(function()
		{
	console.log("loaded...")
	$('#reg-form').on('submit',function(event)
			{
		event.preventDefault();
		let form=new FormData(this);
		
		$("#submit-btn").hide();
		$("#loader").show();
		
		//send register servlet
		
		$.ajax({
				
				url:"RegisterServlet",
				type:'POST',
				data:form,
				success:function (data, textStatus, jqXHR)	
				{
					console.log(data)
					
					$("#submit-btn").show();
					$("#loader").hide();
					if(data.trim()==='done')
					{
				swal("Register Succesfully ! we redirect the login page")
				.then((value) => {
				  window.location = "login_page.jsp"
					//swal(`The returned value is: ${value}`);
				});
					}
				else
					{
					swal(data);
					}								
				},
				error:function (jqXHR, textStatus,errorThrown)
				{
					console.log(jqXHR)
					$("#submit-btn").show();
					$("#loader").hide();
					swal("something wents wrong try again");
					
					
				},
				processData:false,
				contentType:false
				});
				
		
		
			});
		});

</script>
</body>
</html>