<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="ecourts_java.*"%>

<%
	User curUser = (User)session.getAttribute("user_id");
	



%>
<%session.setAttribute("book", null);%>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>eCourts - Reserve your next court</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="icon" href="images/LOGO2-01.png">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="css/animate.css">
	
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">

	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="css/jquery.timepicker.css">

	
	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/style.css">

	<link rel="stylesheet" href="css/search.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
	
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <style>
        
		
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

        .navbar .dropdown-menu {
            border-radius: 1px;
            border-color: #e5e5e5;
            box-shadow: 0 2px 8px rgba(0,0,0,.05);
        }
        .navbar .dropdown-menu a {
            color: #777 !important;
            padding: 8px 20px;
            line-height: normal;
            font-size: 15px;
        }
        .navbar .dropdown-menu a:hover, .navbar .dropdown-menu a:focus {
            color: #333 !important;
            background: transparent !important;
        }
        
	
	.stylish-input-group .input-group-addon{
		background: rgb(197, 196, 196) !important; 
	}
	.stylish-input-group .form-control{
		width: 270px;
		height: 40px !important;
		font-size: 13px;
		border-radius: 0.30rem;
		border: 30px; 
		box-shadow:0 0 0; 
		border-color:#ccc;
	}
	.stylish-input-group button{
		border:0;
		background:transparent;
	}   

    </style>
	  <style>
					
		ul.ks-cboxtags {
			list-style: none;
			padding: 20px;
		}
		ul.ks-cboxtags li{
		  display: inline;
		}
		ul.ks-cboxtags li label{
			display: inline-block;
			background-color: rgba(255, 255, 255, .9);
			border: 2px solid rgba(139, 139, 139, .3);
			color: #adadad;
			border-radius: 25px;
			white-space: nowrap;
			margin: 3px 0px;
			-webkit-touch-callout: none;
			-webkit-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			user-select: none;
			-webkit-tap-highlight-color: transparent;
			transition: all .2s;
		}
		
		ul.ks-cboxtags li label {
			padding: 8px 12px;
		   }
		
		ul.ks-cboxtags li label::before {
			display: inline-block;    
			padding: 2px 6px 2px 2px;  
			transition: transform .3s ease-in-out;
		}
		
		ul.ks-cboxtags li input[type="checkbox"]:checked + label::before {
			
			transform: rotate(-360deg);
			transition: transform .3s ease-in-out;
		}
		
		ul.ks-cboxtags li input[type="checkbox"]:checked + label {
			border: 2px solid #fd7e14;
			background-color: #fd7e14;
			color: #fff;
			transition: all .2s;
		}
		
		ul.ks-cboxtags li input[type="checkbox"] {
		  display: absolute;
		}
		ul.ks-cboxtags li input[type="checkbox"] {
		  position: absolute;
		  opacity: 0;
		}
		ul.ks-cboxtags li input[type="checkbox"]:focus + label {
		  border: 2px solid #fd7e14;
		}
						  
	</style>
</head>
<body>


	


	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="background-color: #fff;">
		<div class="container">
			<a class="navbar-brand" href="home.jsp"><img class="logo" src="images/LOGO2-01.png" > </a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="home.jsp" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="#About" class="nav-link">About</a></li>
					<li class="nav-item"><a href="#Search-club" class="nav-link">Search for a Club</a></li>
					<li class="nav-item"><a href="#Popular" class="nav-link">Popular Sportsclubs</a></li>
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
	
	<div class="hero-image js-fullheight" style="background-image: url('images/img_bg_tennis.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center" data-scrollax-parent="true">
				<div class="col-md-7 ftco-animate">
					<span class="subheading">Welcome to eCourts</span>
					<h1 class="mb-4">Book your next sport activity with ease!</h1>
					<p class="caps"></p>
				</div>
			</div>
		</div>
	</div>

	
	  <% if(session.getAttribute("register_id")!=null){
		session.setAttribute("register_id", null); 
		%>
		<script>
			$(document).ready(function(){
				$("#exampleModalCenter").modal('show');
			});
		</script>
	  <!-- Modal -->
	  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalLongTitle">Welcome</h5>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<div class="modal-body">
				<div class="container-first">
					<img  style="display: block;  margin-left: auto;  margin-right: auto;  width: 140px; height: 140px;" src="images/progress.png"> 
				<h4 style="text-align: center;color:rgb(68, 68, 68)">Almost done...</h4>
				<h4 style="text-align: center;color:rgb(68, 68, 68)">Successfull registration. A verification link has been sent to your email.</h4>
				<h5 style="text-align: center;color:rgb(68, 68, 68)">Before you get started choose some of your favorite sports.</h5>
				  </div>
				  <div class="container-second">
					<ul class="ks-cboxtags">
					  <li><input type="checkbox" id="checkboxOne" value="Rainbow Dash"><label for="checkboxOne">Football</label></li>
					  <li><input type="checkbox" id="checkboxTwo" value="Cotton Candy"><label for="checkboxTwo">Tennis</label></li>
					  <li><input type="checkbox" id="checkboxThree" value="Rarity" ><label for="checkboxThree">Swimming</label></li>
					  <li><input type="checkbox" id="checkboxFour" value="Moondancer"><label for="checkboxFour">Basketball</label></li>
					  <li><input type="checkbox" id="checkboxFive" value="Surprise"><label for="checkboxFive">Padel</label></li>				  
					  <li><input type="checkbox" id="checkboxEight" value="Derpy Hooves"><label for="checkboxEight">Golf</label></li>					  
					  <li class="ks-selected"><input type="checkbox" id="checkboxEleven" value="Discord"><label for="checkboxEleven">Ice skating</label></li>
					  <li><input type="checkbox" id="checkboxTwelve" value="Clover"><label for="checkboxTwelve">Volleyball</label></li>					 
					  <li><input type="checkbox" id="checkboxFourteen" value="Medley"><label for="checkboxFourteen">Skiing</label></li>					 
					</ul>			   
				</div>
				
			</div>
			<div class="modal-footer">			  
			  <button type="button" class="btn btn-primary" style="font-family: 'Poppins', Arial, sans-serif;" data-dismiss="modal">Submit</button>
			</div>
		  </div>
		</div>
	  </div>
	  <%}%>

	<section class="ftco-section ftco-no-pb ftco-no-pt" style="background-color: #f3f3f3;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="ftco-search d-flex justify-content-center">
						<div class="row">
							<div class="col-md-12 nav-link-wrap">
								<div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
									<a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Search for Availability</a>

									
								</div>
							</div>
							<div class="col-md-12 tab-wrap">
								
								<div class="tab-content" id="v-pills-tabContent">

									<div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
										<form action="#" class="search-property-1">
											<div class="row no-gutters">
												<div class="col-md d-flex">
													<div class="form-group p-4 border-0">
														<label for="#">Municipality</label>
														<div class="form-field">
															<div class="icon"><span class="fa fa-search"></span></div>
															<input type="text" class="form-control" placeholder="Search place">
														</div>
													</div>
												</div>
												<div class="col-md d-flex">
													<div class="form-group p-4">
														<label for="#">Choose Sport</label>
														<div class="form-field">
															<div class="select-wrap">
																<div class="icon"><span class="fa fa-chevron-down"></span></div>
																<select name="" id="" class="form-control">
																	<option value="">Tennis</option>
																	<option value="">Padel</option>
																	<option value="">Football</option>
																</select>
															</div>
														</div>
													</div>
												</div>
												<div class="col-md d-flex">
													<div class="form-group p-4">
														<label for="#">Date</label>
														<div class="form-field">
															<div class="icon"><span class="fa fa-calendar"></span></div>
															<input type="text" class="form-control checkin_date" placeholder="Choose Date">
														</div>
													</div>
												</div>
												<div class="col-md d-flex">
													<div class="form-group p-4">
														<label for="appt">Select time</label>
														<input type="time" id="appt" name="appt">
													</div>		
												</div>
												
												<div class="col-md d-flex">
													<div class="form-group d-flex w-100 border-0">
														<div class="form-field w-100 align-items-center d-flex">
															<input type="button" value="Search" class="align-self-stretch form-control btn btn-primary" onclick="location.href='results.jsp';"> 
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
									<script>
										export default {
										  data() {
											return {
											  value: ''
											}
										  }
										}
									</script>
								</div>
							</div>		
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
		
		<div id="Search-club"></div>
		<section class="ftco-intro ftco-section ftco-no-pt" style="background-color: #f3f3f3;">
			<div class="container" style="margin-top: 110px; margin-bottom: -60px;">
				<div class="row justify-content-center">
					<div class="col-md-12 text-center">
						<div class="img"  style="background-image: url(images/searchbg2.jpg);">
							<div class="overlay"></div>
							<h2>Want to search for a Sportsclub?</h2>
							<br>
							<div class="container-search">
								<form autocomplete="off">
									<a href="" target="_blank" hidden></a>
									<input type="text" class="form-search__field" placeholder="Name of Sportsclub" />
									<div class="autocom-box">
										<!-- here list are inserted from javascript -->
									</div>
									<button type="button" class="btn-search--primary btn--inside uppercase" onclick="location.href='sportsclub_profile.html';">Search</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

        <section class="ftco-section img ftco-select-destination" id="Popular" style="background-color: #f3f3f3; margin-top:-30px;">
			<div class="container">
				<div class="row justify-content-center pb-4">
					<div class="col-md-12 heading-section text-center ftco-animate">
						<span class="subheading">eCourts</span>
						<h2 class="mb-4">Our Popular Sportsclubs</h2>
					</div>
				</div>
			</div>
			<div class="container container-2">
				<div class="row">
					<div class="col-md-12">
						<div class="carousel-destination owl-carousel ftco-animate">
							<div class="item">
								<div class="project-destination">
									<a href="sportsclub_profile.html" class="img" style="background-image: url(images/tennis3.jpg);">
										<div class="text">
											<h3>Sportone</h3>
											<span>8 Courts</span>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="sportsclub_profile.html" class="img" style="background-image: url(images/tennis4.jpg);">
										<div class="text">
											<h3>Ekali Club</h3>
											<span>9 Courts</span>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="sportsclub_profile.html" class="img" style="background-image: url(images/football1.jpg);">
										<div class="text">
											<h3>Football Club</h3>
											<span>5 Courts</span>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="sportsclub_profile.html" class="img" style="background-image: url(images/football2.jpg);">
										<div class="text">
											<h3>Ballers</h3>
											<span>5 Courts</span>
										</div>
									</a>
								</div>
							</div>
							<div class="item">
								<div class="project-destination">
									<a href="sportsclub_profile.html" class="img" style="background-image: url(images/padel1.jpg);">
										<div class="text">
											<h3>Anoixi Padel</h3>
											<span>7 Courts</span>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
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