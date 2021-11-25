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
  const button = document.querySelector('register')
  if (document.getElementById('password').value ==
    document.getElementById('confirm').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
	document.getElementById("register").disabled = false;
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
	document.getElementById("register").disabled = true;
  }
}
</script>



</style>
<body class="form-v10">
	
	<div class="page-content">		
		
		<div class="form-v10-content">

		
			<form class="form-detail" action="register_validation.jsp" method="post" id="myform" onsubmit="valthisform()">
				
				<div class="form-left">				
					<h2>General Infomation </h2>					
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text" name="name" id="name" pattern=".{2,}"
							title="Name should contain more than 2 characters." class="input-text" placeholder="Name" required>							
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="surname" pattern=".{2,}"
							title="Surname should contain more than 2 characters." id="surname" class="input-text" placeholder="Surname" required>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text" name="username" id="username" pattern=".{4,}"
							title="Username should contain more than 4 characters." class="input-text" placeholder="Userame" required>							
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="birth" id="birth" placeholder="Birth date"
							onfocus="(this.type='date')">
						</div>
					</div>
					
					
					<div class="form-row">
						<input type="password" name="password" onkeyup='check();' pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
						title="Password must contain at least one number and one uppercase and lowercase letter, and at least 6 characters." class="password" id="password" placeholder="Password" required>
					</div>
					<div class="form-row">
						<input type="password" name="confirm" onkeyup='check();' class="confirm" id="confirm" placeholder="Confirm password" required>		
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
							<input type="text" name="street" class="street" id="street" placeholder="Street" required>
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="street_number" class="street_number" id="street_number" placeholder="Number" required>
						</div>
					</div>	
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text" name="zip" pattern=".{4,}" title="Zip code must be 4 characters long." class="zip" id="zip" placeholder="Zip Code" required>
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="town" class="town" id="town" placeholder="Town" required>
						</div>
					</div>					
					<div class="form-row">						
						<input type="text" name="phone" pattern="^\d{10}$" title="Phone must be 10 characters." class="phone" id="phone" placeholder="Phone Number" required>
						
					</div>
					<div class="form-row">
						<input type="email" name="email" id="email"  class="input-text" required pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}
						\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$" placeholder="Your Email" >						
					</div>
					
					<div class="form-row-last">
						<input type="submit" name="register" class="register" id="register"  onclick="val()" value="Register">
					</div>
				</div>
				
				<script>					
					function valthisform() {		
						
						if (!(document.getElementById('password').value ==
                            document.getElementById('confirm').value))
						 { 							
							event.preventDefault();
						} 
					}					
				</script>
				
			</form>
			
		</div>
	</div>
</body>
</html>