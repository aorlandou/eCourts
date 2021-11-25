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
        function getSlots() {
        
        var sport= $('#sport').val();
        console.log("I've been called");
  
  
        $.ajax({
        url: "getdata.jsp",
        type: 'POST',
        data: {sport: sport},
        success: function(data) {
        
        document.getElementById("res").innerHTML = data;
  
        
        }
        });
        }
    </script>



</head>


<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="background-color: #fff;">
		<div class="container">
			<a class="navbar-brand" href="home.html"><img class="logo" src="images/LOGO2-01.png" > </a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav" >
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="home.html" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="#About" class="nav-link">About</a></li>
                    <li class="nav-item active"><a href="results.html" class="nav-link">Sportsclubs</a></li>
                    <li class="nav-item"><a href="login_form.html" class="nav-link">Login</a></li>
                </ul>
                <!-- if logged in -->
                <!-- <div class="nav-item dropdown">
                    <a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action"><img src="https://www.tutorialrepublic.com/examples/images/avatar/3.jpg" class="avatar" alt="Avatar"> Antonio Moreno <b class="caret"></b></a>
                    <div class="dropdown-menu">
                        <a href="#" class="dropdown-item"><i class="fa fa-user-o"></i> Profile</a>
                        <a href="#" class="dropdown-item"><i class="fa fa-calendar-o"></i> Calendar</a>
                        <a href="#" class="dropdown-item"><i class="fa fa-sliders"></i> Settings</a>
                        <div class="divider dropdown-divider"></div>
                        <a href="#" class="dropdown-item"><i class="material-icons">&#xE8AC;</i> Logout</a>
                    </div>
                </div> -->
                
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
                               <div class="form-group p-4 border-0">
                                  <label for="#">Municipality</label>
                                  <div class="form-field">
                                    <div class="icon"><span class="fa fa-search"></span></div>
                                    <input type="text" class="form-control" placeholder="Search Place" value="Voreia Proasteia">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg d-flex">
                           <div class="form-group p-4">
                            <label for="#">Choose Sport</label>
                            <div class="form-field">
                                <div class="select-wrap">
                                    <div class="icon"><span class="fa fa-chevron-down"></span></div>
                                    <select name="" id="sport" class="form-control" onchange="getSlots()">
                                        <option value="1">Tennis</option>
                                        <option value="2">Padel</option>
                                        <option value="3">Football</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg d-flex">
                       <div class="form-group p-4">
                        <label for="#">Date</label>
                        <div class="form-field">
                            <div class="icon"><span class="fa fa-calendar"></span></div>
                            <input type="text" class="form-control checkin_date" placeholder="Choose Date" value="11/15/2021">
                        </div>
                    </div>
                </div>
                <div class="col-lg d-flex">
                    <div class="form-group p-4">
                        <label for="appt">Select a time:</label>
                        <input type="time" id="appt" name="appt" value="12:00">
                    </div>
                </div>
         <div class="col-lg d-flex">
           <div class="form-group d-flex w-100 border-0">
              <div class="form-field w-100 align-items-center d-flex">
                 <input type="submit" value="Search" class="align-self-stretch form-control btn btn-primary">
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

    

     <section class="ftco-section" >
        <div class="container">
         <div class="row" id = "res">
             
            Results will be displayed here          
       

     </div>
     
     <div class="row mt-5">
       <div class="col text-center">
         <div class="block-27">
           <ul>
             <li><a href="#">&lt;</a></li>
             <li class="active"><span>1</span></li>
             <li><a href="#">2</a></li>
             <li><a href="#">3</a></li>
             <li><a href="#">4</a></li>
             <li><a href="#">5</a></li>
             <li><a href="#">&gt;</a></li>
         </ul>
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