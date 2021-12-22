<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>eCourts Register</title>
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="icon" href="images/LOGO2-01.png">
	<!-- Font-->
	<link rel="stylesheet" type="text/css" href="css/montserrat-font.css">
	<link rel="stylesheet" type="text/css" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
	<!-- Main Style Css -->
    <link rel="stylesheet" href="css/ecourts_register.css"/>
</head>


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
	var check2 = function() {
  const button = document.querySelector('register');
  const name=document.getElementById('name').value;
 

  if (name.length<3) {		
    document.getElementById('message_name').style.color = 'red';
    document.getElementById('message_name').innerHTML = 'Name must be at least 3 characters';
	document.getElementById("register").disabled = true;	
  } 
  if (name.length>=3) {		
    
    document.getElementById('message_name').innerHTML = '';
	document.getElementById("register").disabled = false;	
  }  

}
</script>

<script>
	var check3 = function() {
  const button = document.querySelector('register');
  const surname=document.getElementById('surname').value; 

 
  if (surname.length<3) {		
    document.getElementById('message_surname').style.color = 'red';
    document.getElementById('message_surname').innerHTML = 'Surname must be at least 3 characters';
	document.getElementById("register").disabled = true;	
  } 

  if (surname.length>=3) {    
    document.getElementById('message_surname').innerHTML = '';
	document.getElementById("register").disabled = false;	
  }
}
</script>

<script>
	var check4 = function() {
  const button = document.querySelector('register');
  const username=document.getElementById('username').value; 

 
  if (username.length<3) {		
    document.getElementById('message_username').style.color = 'red';
    document.getElementById('message_username').innerHTML = 'Username must be at least 3 characters';
	document.getElementById("register").disabled = true;	
  } 

  if (username.length>=3) {		
    
    document.getElementById('message_username').innerHTML = '';
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


</style>
<body class="form-v10">
	
	<div class="page-content">		
		
		<div class="form-v10-content">

			<% if (session.getAttribute("not_logged")!=null){ 
                int id=Integer.parseInt(request.getParameter("id"));
                %>
				<form class="form-detail" action="register_validation.jsp?id=<%=id%>" method="post" id="myform" onsubmit="valthisform()">
                <%}else{ %>
					<form class="form-detail" action="register_validation.jsp" method="post" id="myform" onsubmit="valthisform()">
                <%}%>
			
				
				<div class="form-left">				
					<h2>General Infomation </h2>					
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text" name="name" oninput='check2();' id="name" 
							class="input-text" placeholder="Name" >	
							<span id='message_name'></span>							
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="surname" oninput='check3();'
							 id="surname" class="input-text" placeholder="Surname" >
							<span id='message_surname'></span>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text" name="username" oninput='check4();' id="username" 
							 class="input-text" placeholder="Userame" >
							<span id='message_username'></span>							
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="birth"  id="birth" placeholder="Birth date"
							onfocus="(this.type='date')">
							<span id='message_birth'></span>	
						</div>
					</div>
					
					
					<div class="form-row">
						<input type="password" name="password" onkeyup='check();' 
						 class="password" id="password" placeholder="Password" >
						<span id='message_pass1'></span>	
					</div>
					<div class="form-row">
						<input type="password" name="confirm" onkeyup='check();' class="confirm" id="confirm" placeholder="Confirm password">		
						<span id='message'></span>				
					</div>
					<div class="form-row">
						<img style="display: block;margin-left: auto; margin-top: -25px;margin-bottom: auto; margin-right: auto;margin-bottom: -10px;width: 190px; height: 160px;" src="ecourts_logo.png">
					</div>				
					
				</div>
				<div class="form-right">
					<h2>Contact Details</h2>					
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text" name="street" class="street" id="street" placeholder="Street">
							<span id='message_street'></span>
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="street_number" class="street_number" id="street_number" placeholder="Number">
							<span id='message_street_number'></span>
						</div>
					</div>	
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text" name="zip" oninput='check6();'  class="zip" id="zip" placeholder="Zip Code">
							<span id='message_zip'></span>
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="town" class="town" id="town" placeholder="Town">
							<span id='message_town'></span>
						</div>
					</div>					
					<div class="form-row">						
						<input type="text" name="phone" oninput='check7();' class="phone" id="phone" placeholder="Phone Number">
						<span id='message_phone'></span>
					</div>
					<div class="form-row">
						<input type="email" name="email" oninput='check8();' id="email"  class="input-text" placeholder="Your Email" >		
						 <span id='message_email'></span>				
					</div>
					
					<div class="form-row-last">
						<input type="submit" name="register" class="register" id="register"   value="Register">
					</div>
				</div>
				
				<script>					
					function valthisform() {		
						const name=document.getElementById('name').value;
						const surname=document.getElementById('surname').value;
						const username=document.getElementById('username').value; 
						const birth=document.getElementById('birth').value;
						var zip=document.getElementById('zip').value; 
						var street=document.getElementById('street').value; 
						var number=document.getElementById('street_number').value; 
						var town=document.getElementById('town').value; 
						var phone=document.getElementById('phone').value; 
						var email=document.getElementById('email').value;
						var password=document.getElementById('password').value;
						if (name.length==0) {		
                         document.getElementById('message_name').style.color = 'red';
                         document.getElementById('message_name').innerHTML = 'Please fill out this field';	                     
						 event.preventDefault();
                         } 
						 if (surname.length==0) {		
                          document.getElementById('message_surname').style.color = 'red';
                          document.getElementById('message_surname').innerHTML = 'Please fill out this field';
	                      event.preventDefault();	
                         }  
						 if (username.length==0) {		
                          document.getElementById('message_username').style.color = 'red';
                          document.getElementById('message_username').innerHTML = 'Please fill out this field';
	                      event.preventDefault();	
                         }  
						 if (birth==""){
						  document.getElementById('message_birth').style.color = 'red';
                          document.getElementById('message_birth').innerHTML = 'Please fill out this field';
	                      event.preventDefault();	
						 }
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
				
			</form>
			
		</div>
	</div>
</body>
</html>