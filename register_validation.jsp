<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="ecourts_java.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>

<%      String name=request.getParameter("name"); 
        String surname=request.getParameter("surname"); 
        String username=request.getParameter("username"); 
        String birth_date=request.getParameter("birth"); 
        String password=request.getParameter("password"); 
		String confirm=request.getParameter("confirm"); 
        String street=request.getParameter("street"); 
		String street_number=request.getParameter("street_number"); 
        String zip=request.getParameter("zip"); 
        String town=request.getParameter("town");
        String phone=request.getParameter("phone"); 
		String email=request.getParameter("email");		 

		Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
        String register_date = formatter.format(date);
		Customer customer= new Customer(name,surname,email,phone,street,
		town,street_number,zip,password,register_date,birth_date);
		
%>



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

<body class="form-v10">
	
	<div class="page-content">		
		
		<div class="form-v10-content">

		
			<form class="form-detail" action="register_validation.jsp" method="post" id="myform">
				
				<div class="form-left">				
					<h2>General Infomation </h2>					
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text"  name="name" id="name" class="input-text" placeholder="Name" required>							
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="surname" id="surname" class="input-text" placeholder="Surname" required>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text" name="birth" id="birth" placeholder="Birth date"
							onfocus="(this.type='date')">
						</div>						
					</div>	

					
					<div class="form-row">
						<input type="password" name="password" class="password" id="password" placeholder="Password" required>
					</div>
					<div class="form-row">
						<input type="password" name="confirm" class="confirm" id="confirm" placeholder="Confirm password" required>						
					</div>
					<div class="form-row">
						<img style="display: block;margin-left: auto; margin-top: -25px;margin-bottom: auto; margin-right: auto;margin-bottom: -10px;width: 190px; height: 160px;" src="ecourts_logo.png">
					</div>				
					
				</div>
				<div class="form-right">
					<h2>Contact Details</h2>
					<div class="form-row">
						<input type="text" name="street" class="street" id="street" placeholder="Street + Number" required>
					</div>
					
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text" name="zip" class="zip" id="zip" placeholder="Zip Code" required>
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="town" class="town" id="town" placeholder="Town" required>
						</div>
					</div>					
					<div class="form-group">
						<div class="form-row form-row-1">
							<input type="text" name="code" class="code" id="code" placeholder="Code +" required>
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="phone" class="phone" id="phone" placeholder="Phone Number" required>
						</div>
					</div>
					<div class="form-row">
						<input type="email" name="email" id="email" class="input-text" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" placeholder="Your Email" >
					</div>
					
					<div class="form-row-last">
						<input type="submit" name="register" class="register" id="register"  onclick="val()" value="Register">
					</div>
				</div>
			</form>
			
		</div>
	</div>
</body>
</html>