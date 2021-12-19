<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="ecourts_java.*"%>

<%
User user_now=(User)session.getAttribute("user_id");
user_now=user_now.editDetails(user_now.getUser_id());
Customer customer=new Customer();
Customer customer_now;
customer_now=customer.customerDetails(user_now.getUser_id());
session.setAttribute("user_id", user_now);
session.setAttribute("customer_id", customer_now);

%>



<!DOCTYPE html>
<html>
<head>
	<title>Edit User Profile</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <link rel="icon" href="images/LOGO2-01.png">
	<link rel="stylesheet" type="text/css" href="css/montserrat-font.css">
	<link rel="stylesheet" type="text/css" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
	<!-- Main Style Css -->
    <link rel="stylesheet" href="css/edit_user.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>

    label{
        color: #fff;
    }

    .butt{
        background: #fff;
	border-radius: 5px;
	-o-border-radius: 5px;
	-ms-border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	box-shadow: 0px 6px 17px 0px rgba(0, 0, 0, 0.15);
	-o-box-shadow: 0px 6px 17px 0px rgba(0, 0, 0, 0.15);
	-ms-box-shadow: 0px 6px 17px 0px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0px 6px 17px 0px rgba(0, 0, 0, 0.15);
	-webkit-box-shadow: 0px 6px 17px 0px rgba(0, 0, 0, 0.15);
	
    height: 50%;
	border: none;
	margin: 6px 0 50px 0px;
	cursor: pointer;
	color: #333;
	font-weight: 700;
	font-size: 15px;
	
    }

	a {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
}

a:hover {
  background-color: #ddd;
  color: black;
}

.previous {
  background-color:#f3f3f3;
  color:#333;
  border-radius: 50%;
  width: 50px;
  height: 44px;
 margin-top: -50px;
 margin-bottom: 40px;
 
  
}







</style>
<script>
	var check = function() {
  const button = document.querySelector('register');
  var pass=/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
  if (document.getElementById('password').value.match(pass)){
	document.getElementById('message_pass1').innerHTML = ''; 
  if (document.getElementById('password').value ==
    document.getElementById('confirm').value) {
		if (document.getElementById('password').value=="" && document.getElementById('confirm').value==""){
		document.getElementById('message').innerHTML = '';
		document.getElementById("register").disabled = false;
	
	}else{    
    document.getElementById('message').innerHTML = '';
	document.getElementById("register").disabled = false;
	}
  } else {	
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
	document.getElementById("register").disabled = true;
	
  }
}else{
	
	document.getElementById('message_pass1').style.color = 'red';
    document.getElementById('message_pass1').innerHTML = 'Password must contain at least one number and one uppercase and lowercase letter, and at least 6 characters';
	document.getElementById("register").disabled = true;
		

}  

}


</script>

<script>
	var check8 = function() {
  const button = document.querySelector('register'); 
  var emailno = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  var email=document.getElementById('email').value; 

 
  if (!email.match(emailno)) {		
    document.getElementById('message_email').style.color = 'red';
    document.getElementById('message_email').innerHTML = 'Please enter valid email';
	document.getElementById("register").disabled = true;	
  }

  if (email.match(emailno)) {    
    document.getElementById('message_email').innerHTML = '';
	document.getElementById("register").disabled = false;	
  }

  
  

}
</script>

<script>
	var check7 = function() {
  const button = document.querySelector('register'); 
  var phoneno = /^\d{10}$/;
  var phone=document.getElementById('phone').value; 

 
  if (!phone.match(phoneno)) {		
    document.getElementById('message_phone').style.color = 'red';
    document.getElementById('message_phone').innerHTML = 'Please enter valid phone number';
	document.getElementById("register").disabled = true;	
  }

  if (phone.match(phoneno)) {    
    document.getElementById('message_phone').innerHTML = '';
	document.getElementById("register").disabled = false;	
  }

  
 

}
</script>

<script>
	var check6 = function() {
  const button = document.querySelector('register');
  var zipon = /^\d{5}$/;
  var zip=document.getElementById('zip').value; 

 
  if (!zip.match(zipon)) {		
    document.getElementById('message_zip').style.color = 'red';
    document.getElementById('message_zip').innerHTML = 'Please enter valid zip code';
	document.getElementById("register").disabled = true;		
  } 

  if (zip.match(zipon)) {		
    
    document.getElementById('message_zip').innerHTML = '';
	document.getElementById("register").disabled = false;	
  } 
  

}
</script>

<script>
	var check9 = function() {
  const button = document.querySelector('register');  
  var street=document.getElementById('street').value; 
  if (street.length==0) {		
	document.getElementById('message_street').style.color = 'red';
	document.getElementById('message_street').innerHTML = 'Please fill out this field';
	document.getElementById("register").disabled = true;
   }else{	   
    document.getElementById('message_street').innerHTML = '';
	document.getElementById("register").disabled = false;
   }

 
}
</script>

<script>
	var check10 = function() {
  const button = document.querySelector('register');  
  var number=document.getElementById('street_number').value; 
  if (number.length==0) {		
	document.getElementById('message_street_number').style.color = 'red';
	document.getElementById('message_street_number').innerHTML = 'Please fill out this field';
	event.preventDefault();
							 
	document.getElementById("register").disabled = true;
   }else{	   
    document.getElementById('message_street_number').innerHTML = '';
	document.getElementById("register").disabled = false;
   }

 
}
</script>

<script>
	var check11 = function() {
  const button = document.querySelector('register');  
  var town=document.getElementById('town').value; 
  if (town.length==0) {		
	document.getElementById('message_town').style.color = 'red';
	document.getElementById('message_town').innerHTML = 'Please fill out this field';
	event.preventDefault();						 
	document.getElementById("register").disabled = true;
   }else{	   
    document.getElementById('message_town').innerHTML = '';
	document.getElementById("register").disabled = false;
   }

 
}
</script>


<body class="form-v10">	
	<div class="page-content">		
		<div class="form-v10-content" style="margin-top: 50px;">
			<form class="form-detail"  id="myform" action="edit_validation.jsp" method="post" onsubmit="valthisform()">
				
				<div class="form-left">				
					<br>
					<br>
					<br>				
					<div class="">					
                        <div class="card-body">						
                          <div class="d-flex flex-column align-items-center text-center">
							<br>							
							<a href="user_profile.jsp" class="previous"><i class="fa fa-chevron-left "  style='font-size:23px;'></i></a>
							<br>
							<br>
							<br>
                            <img src="images/user.png" alt="Admin" class="rounded-circle" width="150">
                            <div class="mt-3">
								<h4><%=user_now.getName()%> <%=customer_now.getSurname()%></h4>
								<p class="text-secondary mb-1"></p>
								<p class="text-muted font-size-sm"><%=user_now.getStreet()%> <%=user_now.getStreet_number()%>, <%=user_now.getTown()%></p>
							  <img style="display: block;margin-left: auto; margin-top: -25px;margin-bottom: auto; margin-right: auto;margin-bottom: -10px;width: 190px; height: 160px;" src="ecourts_logo.png">
                              
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-row">						
					</div>					
				</div>
				<div class="form-right" >
                    <h2>Profile Infomation </h2>					
                    <div class="form-group">
						<div class="form-row form-row-1">
							<label class="text-muted">Email</label>
							<br>
							<input  type="text" name="email" oninput='check8();' style="width: 250px;" class="email" id="email" value="<%=user_now.getEmail()%>">
							<span id='message_email'></span>	
						</div>
						<div class="form-row form-row-2">
							<label class="text-muted">Phone</label>
							<br>
							<input   type="text" name="phone" oninput='check7();' style="width: 250px;"  id="phone" autocomplete="off" class="phone" value="<%=user_now.getPhone()%>">
							<span id='message_phone'></span>                            
						</div>
					</div>				
					<div class="form-group">
						<div class="form-row form-row-1">
							<label class="text-muted">Password</label>
						<br>
						<input  type="password" name="password" onkeyup='check();' style="width: 250px;" class="password" id="password"  value="<%=user_now.getPassword()%>">	
						<span id='message_pass1'></span>					
						</div>
						<div class="form-row form-row-2">
							<label class="text-muted">Confirm Password</label>
						<br>
						<input  type="password" name="confirm" style="width: 250px;" onkeyup='check();' class="confirm" id="confirm"  value="<%=user_now.getPassword()%>">	
						<span id='message'></span>					
						</div>						
					</div>					
					<div class="form-group">
						<div class="form-row form-row-1">
							<label class="text-muted" style="color:#fff;">Street</label>
							<br>
							<input type="text" name="street" oninput='check9();' style="width: 250px;" id="street" autocomplete="off" class="street"  value="<%=user_now.getStreet()%>">   
							<span id='message_street'></span>                         
						</div>
						<div class="form-row form-row-2">
							<label class="text-muted">Number</label>
							<br>
							<input type="text" name="street_number" onkeyup='check10();'  style="width: 250px;" id="street_number" autocomplete="off" class="street_number"  value="<%=user_now.getStreet_number()%>"> 
							<span id='message_street_number'></span>                          
						</div>						
					</div>
					<div class="form-group">
						<div class="form-row form-row-1">
							<label class="text-muted" style="color:#fff;">Zipcode</label>
							<br>
							<input type="text" name="zip" oninput='check6();' style="width: 250px;" id="zip" autocomplete="off" class="zip" value="<%=user_now.getZip_code()%>">
                            <span id='message_zip'></span>	
						</div>
						<div class="form-row form-row-2">
							<label class="text-muted">Town</label>
							<br>
							<input type="text" name="town" oninput='check11();' style="width: 250px;" id="town" autocomplete="off" class="town" value="<%=user_now.getTown()%>">
							<span id='message_town'></span>	                        
						</div>						
					</div>									
                    <div class="form-row-last">						
						<input type="submit" name="register" id="register" class="register" value="Update">
					</div>
					<script>					
						function valthisform(){						
							var zip=document.getElementById('zip').value; 
							var street=document.getElementById('street').value; 
							var number=document.getElementById('street_number').value; 
							var town=document.getElementById('town').value; 
							var phone=document.getElementById('phone').value; 
							var email=document.getElementById('email').value;
							var password=document.getElementById('password').value;						
							 if (password.length==0) {		
							  document.getElementById('message_pass1').style.color = 'red';
							  document.getElementById('message_pass1').innerHTML = 'Please fill out this field';
							  event.preventDefault();	
							 }  
							 if (street.length==0) {		
							  document.getElementById('message_street').style.color = 'red';
							  document.getElementById('message_street').innerHTML = 'Please fill out this field';
							  event.preventDefault();
							 }  
							 if (number.length==0) {		
							  document.getElementById('message_street_number').style.color = 'red';
							  document.getElementById('message_street_number').innerHTML = 'Please fill out this field';
							  event.preventDefault();
							 }  
							 if (zip.length==0) {		
							  document.getElementById('message_zip').style.color = 'red';
							  document.getElementById('message_zip').innerHTML = 'Please fill out this field';
							  event.preventDefault();
							 }
							 if (town.length==0) {		
							  document.getElementById('message_town').style.color = 'red';
							  document.getElementById('message_town').innerHTML = 'Please fill out this field';
							  event.preventDefault();
							 }    
							 if (phone.length==0) {		
							  document.getElementById('message_phone').style.color = 'red';
							  document.getElementById('message_phone').innerHTML = 'Please fill out this field';
							  event.preventDefault();
							 }  
							 if (email.length==0) {		
							   document.getElementById('message_email').style.color = 'red';
							   document.getElementById('message_email').innerHTML = 'Please fill out this field';
							   event.preventDefault();
					
							}  
							 
						}					
					</script>
				</div>				
			</form>			
		</div>
	</div>
</body>
</html>