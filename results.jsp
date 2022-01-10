<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="ecourts_java.*"%>
<%@ page import ="java.util.*"%>

<%

User curUser = (User)session.getAttribute("user_id");
//get the filter content from db 
Municipality mun_obj = new Municipality();
List<Municipality> mun_list =  mun_obj.getMunicipalies_with_clubs();

Sport sprt = new Sport();
List<Sport> sports_list = sprt.getAll_sports();

String	municid = (String)request.getParameter("municid");
String	sportid = (String)request.getParameter("sport");
String date = (String)request.getParameter("date");


%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>eCourts - Reserve your next court</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <link rel="icon" href="images/LOGO2-01.png">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

	<link rel="stylesheet" href="css/animate.css">
	
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">

	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="css/jquery.timepicker.css">

	
	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/style.css">


    <style>
        .ftco-section{
            background-color: #f3f3f3;
        }
        @media screen and (max-width: 770px ) {
			img.logo{
			width: 70px;
			height: 50px;
			}
      	}
		@media all and (min-width: 770px) {
			img.logo {
				width: 120px;
				height: 60px;
			}
      	}
		

    </style>

    <script>
        function getSlots(page_num) {
        
        var sport= $('#sport').val();
        var date= $('#date').val();
        var municipality= $('#municipality').val();
		var duration= $('#duration').val();
		var time= $('#time').val();
        console.log("I've been called");
        console.log(page_num);
		console.log(time);
        
  
  
        $.ajax({
        url: "getslots.jsp",
        type: 'POST',
        data: {sport: sport, date: date, municipality: municipality, p:page_num,club_id:0,duration:duration, time: time},
        success: function(data) {
        
        document.getElementById("res").innerHTML = data;
  
        
        }
        });
        }
    </script>



</head>


<body onload="getSlots()">
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="background-color: #fff;">
		<div class="container">
			<a class="navbar-brand" href="home.jsp"><img class="logo" src="images/LOGO2-01.png" > </a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav" >
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="home.jsp" class="nav-link">Home</a></li>
                    <li class="nav-item active"><a href="results.jsp" class="nav-link">Sportsclubs</a></li>
                    <% if (curUser == null || curUser.getType()==1 ){%>
						<li class="nav-item"><a href="login_form.jsp" class="nav-link">Login</a></li>
					<%} %>
                </ul>
                <!-- if logged in -->
                <% if (curUser != null && curUser.getType()==0){%>
					<div class="nav-item dropdown">
						<a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action" style="color:rgb(223, 221, 221);"><img src="images/user.png" style="width: 37px;">   <%=curUser.getName()%> <b class="caret"></b></a>
						<div class="dropdown-menu">
							<a href="user_profile.jsp" class="dropdown-item"><i class="fa fa-user-o"></i> Profile</a>
							<a href="edit_user_profile.jsp" class="dropdown-item"><i class="fa fa-sliders"></i> Settings</a>
							<div class="divider dropdown-divider"></div>
							<a href="logout.jsp" class="dropdown-item"><i class="fa fa-sign-out"></i> Logout</a>
							
							  
						</div>
					</div>
			<%} %>
                
			</div>
		</div>
	</nav>
	<!-- END nav -->

  <div class="hero-image js-fullheight" style="background-image: url('images/tennis8.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center" data-scrollax-parent="true">
				<div class="col-md-12 ftco-animate">
					
            <div class="container">
               <div class="row">
                <div class="col-md-12">
                   <div class="search-wrap-1 ftco-animate">
                      <form action="#" class="search-property-1">
                         <div class="row no-gutters">
                            
                        <div class="col-lg d-flex">
                            <div class="form-group p-4">
                             <label for="#">Municipality</label>
                             <div class="form-field">
                                 <div class="select-wrap">
                                     <div class="icon"><span class="fa fa-chevron-down"></span></div>
                                     <select name="municid" id="municipality" class="form-control" onchange="getSlots(1)">
										<%
										for (Municipality municipality: mun_list){	
											if (municid != null){ %>
												<option value="<%= municipality.getMunic_id()%>" selected><%= municipality.getMun_name()%></option>
											<%
											} else { %>
										%>
											<option value="<%= municipality.getMunic_id()%>"><%= municipality.getMun_name()%></option>
										<%
											}
										}
                                        %>
                                         
                                         
                                     </select>
                                 </div>
                             </div>
                         </div>
                     </div>
                        <div class="col-lg d-flex">
                           <div class="form-group p-4">
                            <label for="#">Choose Sport</label>
                            <div class="form-field">
                                <div class="select-wrap">
                                    <div class="icon"><span class="fa fa-chevron-down"></span></div>
                                    <select name="" id="sport" class="form-control" onchange="getSlots(1)">
                                        <%
										for (Sport spr: sports_list){
											if (sportid != null){ %>
												<option value="<%= spr.getSport_id()%>" selected><%= spr.getSport_name()%></option>
											<% 
											} else{ 

										%>
											<option value="<%= spr.getSport_id()%>"><%= spr.getSport_name()%></option>
										<%
											}
										}
                                        %>
                                        
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg d-flex">
                       <div class="form-group p-4">
                        <label for="#">Date</label>
                        <div class="form-field">
                            
							<input type="date" name="date" min="2021-11-01"  id="date" placeholder="Choose Date" onload="(this.type='date')"
							onfocus="(this.type='date')"  onchange="getSlots(1)" value="<%=date%>" style="border: none;outline: none;">
                            
                        </div>
                    </div>
                </div>
				<div class="col-lg d-flex">
					<div class="form-group p-4">
					 <label for="#">Duration</label>
					 <div class="form-field">
						 <div class="select-wrap">
							 <div class="icon"><span class="fa fa-chevron-down"></span></div>
							 <select name="" id="duration" class="form-control" onchange="getSlots(1)">
								
									 <option value="1">1 hour</option>
									 <option value="2">2 hours</option>
								
								 
							 </select>
						 </div>
					 </div>
				 </div>
				</div>
                <div class="col-lg d-flex">
					<div class="form-group p-4">
					 <label for="#">Time</label>
					 <div class="form-field">
						 <div class="select-wrap">
							 <div class="icon"><span class="fa fa-chevron-down"></span></div>
							 <select name="" id="time"  autocomplete="off" class="form-control" onchange="getSlots(1)">
								
									<option value="" selected>Choose here</option>
									<option value="08:00"> 8:00</option>
									<option value="09:00"> 9:00</option>
									<option value="10:00">10:00</option>
									<option value="11:00">11:00</option>
									<option value="12:00">12:00</option>
									<option value="13:00">13:00</option>
									<option value="14:00">14:00</option>
									<option value="15:00">15:00</option>
									<option value="16:00">16:00</option>
									<option value="17:00">17:00</option>
									<option value="18:00">18:00</option>
									<option value="19:00">19:00</option>
									<option value="20:00">20:00</option>
									<option value="21:00">21:00</option>
									<option value="22:00">22:00</option>

								 
							 </select>
						 </div>
					 </div>
				 </div>
				</div>
         
         </div>
         </form>
         </div>
         </div>
         </div>
         </div>
         
				</div>
			</div>
		</div>
	</div>
	
    
<div id = "here"></div>

     <section class="ftco-section" id = ""  >
        <div class="container" id = "res">
         
			
            
        </div>
     </section>

     <!-- footer -->
		<footer class="ftco-footer bg-bottom ftco-no-pt" style="background-color: #e6c5bb;">
			<div class="container">
				<div class="row mb-2">
					<div class="col-md pt-5">
						<div class="ftco-footer-widget pt-md-5 mb-4">
							<h2 class="ftco-heading-2" id="About">About</h2>
							<p>Hustle free sport court booking! With eCourts you will forget the multiple phone calls to diferrent sportsclubs. Just choose your favorite sport and leave the rest to us.</p>
							<ul class="ftco-footer-social list-unstyled float-md-left float-lft">
								<li class="ftco-animate"><a href="#"><span class="fa fa-twitter"></span></a></li>
								<li class="ftco-animate"><a href="#"><span class="fa fa-facebook"></span></a></li>
								<li class="ftco-animate"><a href="#"><span class="fa fa-instagram"></span></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md pt-5 ">
						<div class="ftco-footer-widget pt-md-5 mb-4 ml-md-5">
							<h2 class="ftco-heading-2">Infromation</h2>
							<ul class="list-unstyled">
								<li><a href="#" class="py-2 d-block">Booking Conditions</a></li>
								<li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
								<li><a href="#" class="py-2 d-block">Refund Policy</a></li>
								<li><a href="#" class="py-2 d-block">Call Us</a></li>
							</ul>
						</div>
					</div>
					
					<div class="col-md pt-5">
						<div class="ftco-footer-widget pt-md-5 mb-4">
							<h2 class="ftco-heading-2">Have any Questions?</h2>
							<div class="block-23 mb-3">
								<ul>
									<li><span class="icon fa fa-map-marker"></span><span class="text">Leoforos Kifisias 679, Psychiko, Athens, Greece</span></li>
									<li><a href="#"><span class="icon fa fa-phone"></span><span class="text">+30 2137839241</span></a></li>
									<li><a href="#"><span class="icon fa fa-paper-plane"></span><span class="text">info@ecourts.gr</span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">

						<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>document.write(new Date().getFullYear());</script> / <a href="https://colorlib.com" target="_blank"> Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
						</div>
					</div>
				</div>
			</footer>
			
			
			

			<!-- loader -->
			<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


			<script src="js/jquery.min.js"></script>
			<script src="js/jquery-migrate-3.0.1.min.js"></script>
			<script src="js/popper.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/jquery.easing.1.3.js"></script>
			<script src="js/jquery.waypoints.min.js"></script>
			<script src="js/jquery.stellar.min.js"></script>
			<script src="js/owl.carousel.min.js"></script>
			<script src="js/jquery.magnific-popup.min.js"></script>
			<script src="js/jquery.animateNumber.min.js"></script>
			<script src="js/bootstrap-datepicker.js"></script>
			<script src="js/scrollax.min.js"></script>
			<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
			<script src="js/google-map.js"></script>
			<script src="js/main.js"></script>
			
	</body>
</html>