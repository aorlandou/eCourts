<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="ecourts_java.*"%>
<%@ page import ="java.util.*"%>

<%


//get the filter content from db 
Municipality mun_obj = new Municipality();
List<Municipality> mun_list =  mun_obj.getMunicipalies_with_clubs();

Sport sprt = new Sport();
List<Sport> sports_list = sprt.getAll_sports();

	









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



    
    
    <script data-require="angular.js@*" data-semver="1.3.15" src="https://code.angularjs.org/1.4.8/angular.js"></script>
    <script data-require="ui-bootstrap@*" data-semver="0.12.1" src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-1.0.3.js"></script>


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
		
          .pagination{display:inline-block;padding-left:0;margin:20px 0;border-radius:4px}.pagination>li{display:inline}.pagination>li>a,.pagination>li>span{position:relative;float:left;padding:6px 12px;margin-left:-1px;line-height:1.42857143;color:#337ab7;text-decoration:none;background-color:#fff;border:1px solid #ddd}.pagination>li:first-child>a,.pagination>li:first-child>span{margin-left:0;border-top-left-radius:4px;border-bottom-left-radius:4px}.pagination>li:last-child>a,.pagination>li:last-child>span{border-top-right-radius:4px;border-bottom-right-radius:4px}.pagination>li>a:hover,.pagination>li>span:hover,.pagination>li>a:focus,.pagination>li>span:focus{color:#23527c;background-color:#eee;border-color:#ddd}.pagination>.active>a,.pagination>.active>span,.pagination>.active>a:hover,.pagination>.active>span:hover,.pagination>.active>a:focus,.pagination>.active>span:focus{z-index:2;color:#fff;cursor:default;background-color:#337ab7;border-color:#337ab7}.pagination>.disabled>span,.pagination>.disabled>span:hover,.pagination>.disabled>span:focus,.pagination>.disabled>a,.pagination>.disabled>a:hover,.pagination>.disabled>a:focus{color:#777;cursor:not-allowed;background-color:#fff;border-color:#ddd}.pagination-lg>li>a,.pagination-lg>li>span{padding:10px 16px;font-size:18px}.pagination-lg>li:first-child>a,.pagination-lg>li:first-child>span{border-top-left-radius:6px;border-bottom-left-radius:6px}.pagination-lg>li:last-child>a,.pagination-lg>li:last-child>span{border-top-right-radius:6px;border-bottom-right-radius:6px}.pagination-sm>li>a,.pagination-sm>li>span{padding:5px 10px;font-size:12px}.pagination-sm>li:first-child>a,.pagination-sm>li:first-child>span{border-top-left-radius:3px;border-bottom-left-radius:3px}.pagination-sm>li:last-child>a,.pagination-sm>li:last-child>span{border-top-right-radius:3px;border-bottom-right-radius:3px}.pager{padding-left:0;margin:20px 0;text-align:center;list-style:none}



    </style>

    <script>
        

        var app = angular.module('myApp', ['ui.bootstrap']);
        app.controller('customersCtrl', function($scope, $http) {

        $scope.municipality = '1';
        $scope.sport = '1';
        $scope.duration = '1';
        $scope.page = 1;

        $http.get("servlet/SlotsServlet").then(function(response) {
            $scope.slots = response.data;
            $scope.displayItems = $scope.slots.slice(0, 6);
        });

        
        $http.get("servlet/FiltersServlet").then(function(response) {
            $scope.filters = response.data;
        });
    

        $scope.pageChanged = function() {
        var startPos = ($scope.page - 1) *6;
        $scope.displayItems = $scope.filterData.slice(startPos, startPos + 6);
        console.log($scope.page);
        };

    });
    


    </script>



</head>


<body ng-app="myApp" ng-controller="customersCtrl">
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="background-color: #fff;">
		<div class="container">
			<a class="navbar-brand" href="home.html"><img class="logo" src="images/LOGO2-01.png" > </a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav" >
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="home.jsp" class="nav-link">Home</a></li>
                    <li class="nav-item active"><a href="results.jsp" class="nav-link">Sportsclubs</a></li>
                    <li class="nav-item"><a href="login_form.jsp" class="nav-link">Login</a></li>
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
                            <div class="form-group p-4">
                             <label for="#">Municipality</label>
                             <div class="form-field">
                                 <div class="select-wrap">
                                     <div class="icon"><span class="fa fa-chevron-down"></span></div>
                                     <select name="" id="municipality" class="form-control" ng-model = "municipality" >
										
                                        <option ng-repeat="option in filters.municipalities" value="{{option.id}}">{{option.name}}</option>
                                         
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
                                    <select name="" id="sport" class="form-control" ng-model = "sport">
                                        <option ng-repeat="option in filters.sports" value="{{option.id}}">{{option.name}}</option>
                                        
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
							onfocus="(this.type='date')" value=""  style="border: none;outline: none;"  ng-model = "date">
                            
                        </div>
                    </div>
                </div>
				<div class="col-lg d-flex">
					<div class="form-group p-4">
					 <label for="#">Duration</label>
					 <div class="form-field">
						 <div class="select-wrap">
							 <div class="icon"><span class="fa fa-chevron-down"></span></div>
							 <select name="" id="duration" class="form-control" ng-model = "duration">
								
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
							 <select name="" id="time"  autocomplete="off" class="form-control" >
								
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

    


     <section class="ftco-section" id = "">
        <div class="container">
        <div class="row" id = "">
            

                    <div class="col-md-4" ng-repeat="x in filterData = (slots | filter: {munic_id:municipality, duration:duration ,sport_id: sport, date: date === null ? undefined : date}) | limitTo:6:6*(page-1)">
                        <div class="project-wrap">
                        <a href="pre_booking.jsp?slot={{x.id}}" class="img" style="background-image: url({{x.photopath}});">
                            <span class="price">{{x.price}} €/hour </span>
                        </a>
                        <div class="text p-4">
                            <span class="days">{{x.sport}}</span>
                            <h3><a href="pre_booking.jsp?slot={{x.id}}">{{x.sportsclub}}</a></h3>
                            <p class="location"><span class="fa fa-map-marker"></span> {{x.street}}, {{x.town}}</p>
                            <ul>
                                <li><span class="fa fa-calendar" style="width: fit-content;"></span>{{x.date}}</li> <br> 
                                <li><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                    width="24" height="24"
                                    viewBox="0 0 172 172"
                                    style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#fd7e14"><path d="M86,14.33333c-39.49552,0 -71.66667,32.17115 -71.66667,71.66667c0,39.49552 32.17115,71.66667 71.66667,71.66667c39.49552,0 71.66667,-32.17115 71.66667,-71.66667c0,-39.49552 -32.17115,-71.66667 -71.66667,-71.66667zM86,28.66667c31.74921,0 57.33333,25.58412 57.33333,57.33333c0,31.74921 -25.58412,57.33333 -57.33333,57.33333c-31.74921,0 -57.33333,-25.58412 -57.33333,-57.33333c0,-31.74921 25.58412,-57.33333 57.33333,-57.33333zM78.83333,43v45.96744l30.76628,30.76628l10.13411,-10.13411l-26.56706,-26.56706v-40.03256z"></path></g></g></svg>
                                    {{x.time}} {{x.duration}} hours</li> <br>
                                <li><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                    width="24" height="24"
                                    viewBox="0 0 172 172"
                                    style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#fd7e14"><path d="M14.33333,78.83333v14.33333h143.33333v-14.33333z"></path></g></g></svg>
                                    {{x.surface}} Court
                                </li><br>
                                    
                        </ul>
                        </div>
                    </div>
                    </div>

            
            
        </div>

            <div class="row mt-5">
                <div class="col text-center">
                <div class="block-27">
                        <uib-pagination class="pagination-sm pagination" total-items="filterData.length" ng-model="page"
                        ng-change="pageChanged()" previous-text="&lsaquo;" next-text="&rsaquo;" items-per-page=6></uib-pagination>
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