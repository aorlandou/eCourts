<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="ecourts_java.*"%>
<%@ page errorPage="error.jsp"%>

<% if(session.getAttribute("user_id")==null){%>
  <jsp:forward page="home.jsp" /> 
<%}%>
<%
User user_now=(User)session.getAttribute("user_id");
if (user_now.getType()==1){%>
  <jsp:forward page="home.jsp" />
<%}
user_now=user_now.editDetails(user_now.getUser_id());
Customer customer=new Customer();
Customer customer_now;
customer_now=customer.customerDetails(user_now.getUser_id());
session.setAttribute("user_id", user_now);
session.setAttribute("customer_id", customer_now);


Booking bk = new Booking();
Booking upcoming_booking = bk.upcomingBooking(user_now.getUser_id());

List<Booking> bookings_list = bk.bookingsHistory(user_now.getUser_id());

%>
<%session.setAttribute("book", null);%>



<!doctype html>
<html lang="en">
  <head>
    


    <title>User Profile</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <link rel="icon" href="images/LOGO2-01.png">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- This CSS file (bootstrap-theme.min.css) is optional -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    

    <!-- Favicons -->



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
	

    <link rel="stylesheet" href="css/carousel.css">
  

    <link rel="stylesheet" href="css/min_new.css">

    <link rel="stylesheet" href="css/style.css">


  
 


 <!-- Latest compiled and minified CSS -->



    <style>
      
      .navbar img {
            border-radius: 50%;
            width: 36px;
            height: 36px;
            margin-right: 10px;
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
        
        /* for login */
        .navbar .dropdown-menu {
	color: #999;
	font-weight: normal;
	border-radius: 1px;
	border-color: #e5e5e5;
	box-shadow: 0 2px 8px rgba(0,0,0,.05);
    }
    .navbar a, .navbar a:active {
        color: #888;
        padding: 8px 20px;
        background: transparent;
        line-height: normal;
    }
    .navbar .navbar-form {
        border: none;
    }
    .navbar .action-form {
        width: 280px;
        padding: 20px;
        left: auto;
        right: 0;
        font-size: 10px;
    }
    .navbar .action-form .hint-text {
        text-align: center;
        margin-bottom: 15px;
        font-size: 13px;
    }	
    
    .navbar .social-btn .btn, .navbar .social-btn .btn:hover {
        color: #fff;
        margin: 0;
        padding: 0 !important;
        font-size: 13px;
        border: none;
        transition: all 0.4s;
        text-align: center;
        line-height: 34px;
        width: 47%;
        text-decoration: none;
    }
    .navbar .social-btn .facebook-btn {
        background: #507cc0;
    }
    .navbar .social-btn .facebook-btn:hover {
        background: #4676bd;
    }
    .navbar .social-btn .twitter-btn {
        background: #64ccf1;
    }
    .navbar .social-btn .twitter-btn:hover {
        background: #4ec7ef;
    }
    .navbar .social-btn .btn i {
        margin-right: 5px;
        font-size: 16px;
        position: relative;
        top: 2px;
    }
    .or-seperator b {
        color: #666;
        padding: 0 8px;
        width: 30px;
        height: 30px;
        font-size: 13px;
        text-align: center;
        line-height: 26px;
        background: #fff;
        display: inline-block;
        border: 1px solid #e0e0e0;
        border-radius: 50%;
        position: relative;
        top: -15px;
        z-index: 1;
    }

    .or-seperator {
        margin-top: 32px;
        text-align: center;
        border-top: 1px solid #e0e0e0;
    }
    
    .navbar .action-buttons .dropdown-toggle::after {
        display: none;
    }


    .carousel{position:relative}.carousel.pointer-event{touch-action:pan-y}.carousel-inner{position:relative;width:100%;overflow:hidden}.carousel-inner::after{display:block;clear:both;content:""}.carousel-item{position:relative;display:none;float:left;width:100%;margin-right:-100%;-webkit-backface-visibility:hidden;backface-visibility:hidden;transition:transform .6s ease-in-out}@media (prefers-reduced-motion:reduce){.carousel-item{transition:none}}.carousel-item-next,.carousel-item-prev,.carousel-item.active{display:block}.active.carousel-item-end,.carousel-item-next:not(.carousel-item-start){transform:translateX(100%)}.active.carousel-item-start,.carousel-item-prev:not(.carousel-item-end){transform:translateX(-100%)}.carousel-fade .carousel-item{opacity:0;transition-property:opacity;transform:none}.carousel-fade .carousel-item-next.carousel-item-start,.carousel-fade .carousel-item-prev.carousel-item-end,.carousel-fade .carousel-item.active{z-index:1;opacity:1}.carousel-fade .active.carousel-item-end,.carousel-fade .active.carousel-item-start{z-index:0;opacity:0;transition:opacity 0s .6s}@media (prefers-reduced-motion:reduce){.carousel-fade .active.carousel-item-end,.carousel-fade .active.carousel-item-start{transition:none}}.carousel-control-next,.carousel-control-prev{position:absolute;top:0;bottom:0;z-index:1;display:flex;align-items:center;justify-content:center;width:15%;padding:0;color:#fff;text-align:center;background:0 0;border:0;opacity:.5;transition:opacity .15s ease}@media (prefers-reduced-motion:reduce){.carousel-control-next,.carousel-control-prev{transition:none}}.carousel-control-next:focus,.carousel-control-next:hover,.carousel-control-prev:focus,.carousel-control-prev:hover{color:#fff;text-decoration:none;outline:0;opacity:.9}.carousel-control-prev{left:0}.carousel-control-next{right:0}.carousel-control-next-icon,.carousel-control-prev-icon{display:inline-block;width:2rem;height:2rem;background-repeat:no-repeat;background-position:50%;background-size:100% 100%}.carousel-control-prev-icon{background-image:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fff'%3e%3cpath d='M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z'/%3e%3c/svg%3e")}.carousel-control-next-icon{background-image:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fff'%3e%3cpath d='M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e")}.carousel-indicators{position:absolute;right:0;bottom:0;left:0;z-index:2;display:flex;justify-content:center;padding:0;margin-right:15%;margin-bottom:1rem;margin-left:15%;list-style:none}.carousel-indicators [data-bs-target]{box-sizing:content-box;flex:0 1 auto;width:30px;height:3px;padding:0;margin-right:3px;margin-left:3px;text-indent:-999px;cursor:pointer;background-color:#fff;background-clip:padding-box;border:0;border-top:10px solid transparent;border-bottom:10px solid transparent;opacity:.5;transition:opacity .6s ease}@media (prefers-reduced-motion:reduce){.carousel-indicators [data-bs-target]{transition:none}}.carousel-indicators .active{opacity:1}.carousel-caption{position:absolute;right:15%;bottom:1.25rem;left:15%;padding-top:1.25rem;padding-bottom:1.25rem;color:#fff;text-align:center}.carousel-dark .carousel-control-next-icon,.carousel-dark .carousel-control-prev-icon{filter:invert(1) grayscale(100)}.carousel-dark .carousel-indicators [data-bs-target]{background-color:#000}.carousel-dark .carousel-caption{color:#000}@-webkit-keyframes spinner-border{to{transform:rotate(360deg)}}
    .carousel-inner{position:relative;width:100%;overflow:hidden}.carousel-inner::after{display:block;clear:both;content:""}
    carousel-item{position:relative;display:none;float:left;width:100%;margin-right:-100%;-webkit-backface-visibility:hidden;backface-visibility:hidden;transition:transform .6s ease-in-out}@media (prefers-reduced-motion:reduce){.carousel-item{transition:none}}.carousel-item-next,.carousel-item-prev,.carousel-item.active{display:block}.active.carousel-item-end,.carousel-item-next:not(.carousel-item-start){transform:translateX(100%)}.active.carousel-item-start,.carousel-item-prev:not(.carousel-item-end){transform:translateX(-100%)}.carousel-fade .carousel-item{opacity:0;transition-property:opacity;transform:none}.carousel-fade .carousel-item-next.carousel-item-start,.carousel-fade .carousel-item-prev.carousel-item-end,.carousel-fade .carousel-item.active{z-index:1;opacity:1}.carousel-fade .active.carousel-item-end,.carousel-fade .active.carousel-item-start{z-index:0;opacity:0;transition:opacity 0s .6s}@media (prefers-reduced-motion:reduce){.carousel-fade .active.carousel-item-end,.carousel-fade .active.carousel-item-start{transition:none}}
    
    .scroll {
  margin:4px, 4px;
  padding:4px;
  
  width: 100%;
  height: 450px;
  overflow-x: hidden;
  overflow-y: auto;
  text-align:justify;
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


    



    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
  </head>

  <body style="padding-top: 0rem; background-color: #f3f3f3;">


    
<header>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="background-color: #fff;">
		<div class="container">
			<a class="navbar-brand" href="home.jsp"><img class="logo" src="photos/LOGO2-01.png" > </a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
          <li class="nav-item active"><a href="home.jsp" class="nav-link"><p style="color: #000;">Home</p></a></li>
          <li class="nav-item"><a href="logout.jsp" class="nav-link"><p style="color: #000;">Logout</p></a></li>
          

          
              
					
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
	


  







</header>

<main>







  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    

    <!-- START THE FEATURETTES -->


    <div class="row featurette" id = "Timetable">
      <div class="col-md-12" style="margin-top: 5%;">
        
          
        

        <div class="container-fluid">
            <div class="container" style="max-width: 1140px;">
                <div class="main-body" style="padding: 0px; margin-top: 5%;">
                
                      <!-- Breadcrumb -->
                      
               
            
                      <!-- /Breadcrumb -->
                
                      <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                          <div class="card">
                            <div class="card-body">
                              <div class="d-flex flex-column align-items-center text-center">
                                <img src="images/user.png" alt="Admin" class="rounded-circle" width="150">
                                <div class="mt-3">
                                  <h4><%=user_now.getName()%> <%=customer_now.getSurname()%></h4>
                                  <p class="text-secondary mb-1"></p>
                                  <p class="text-muted font-size-sm"><%=user_now.getStreet()%> <%=user_now.getStreet_number()%>, <%=user_now.getTown()%></p>
            
                                  <a href="edit_user_profile.jsp">
                                    <button class="btn btn-primary active">Edit Profile</button>
                                  </a> 
            
            
                                  <a href="logout.jsp">
                                    <button class="btn btn-outline-primary">Logout</button>
                                  </a> 
            
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="card mt-3">
                            <ul class="list-group list-group-flush">
                              
            
                              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <div class="mb-0 icon-inline"><span class="fa fa-user mr-2" ></span> Username</div>
                                <span class="text-secondary"><%=customer_now.getUsername()%></span>
                              </li>
                              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <div class="mb-0 icon-inline"><span class="fa fa-envelope mr-2" ></span> Email</div>
                                <span class="text-secondary"><%=user_now.getEmail()%></span>
                              </li>
                              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <div class="mb-0 icon-inline"><span class="fa fa-phone mr-2" ></span> Mobile</div>
                                <span class="text-secondary"><%=user_now.getPhone()%></span>
                              </li>
            
                                
                              
                              </li>
                            </ul>
                          </div>
            
            
                          
            
    
            
            
            
                        </div>
            
            
            
            
                      
                            
            
            
                        <div class="col-md-8">
                          <div class="card mb-3" style="background-color: #fff; max-width: 700px; ">
                            <div class="card-body">
                              <div class="row">
            
                                <h1 style="margin-left: 5%;" >Upcoming Bookings</h1>
                                <section class="ftco-section " style="margin-top: 0%; margin-bottom: 0%; padding-top: 2rem; padding-bottom: 2rem;"  >
                                  

                                  <%
                                        if (upcoming_booking==null){
                                          out.print("NO BOOKING");
                                        }else{
                                          

                                        %>

                                        <div class="container"  >
                                          <div class="row justify-content-center pb-4"></div>
                                            
                                          </div>
                                          <div class="column" style="align-items: center;">
                                            <div class="col-md-10 ftco-animate" id = "first_choice" style="width: 95%; max-width: 95%;">
                                              <div class="project-wrap" style=" width: 100%; margin-bottom: 10%;">
                                                
                                                
                                                </a>
                                                <div class="text p-4 row" >
                                                  <span class="days"><%=upcoming_booking.getSlot().getCourt().getSport()%></span>
                                                  <h3><a href="#"><%=upcoming_booking.getSlot().getCourt().getClub().getName()%></a></h3>
                                                  <div style="width: 100%;
                                                  display: flex;
                                                  flex-direction: row;
                                                  justify-content: center;"  >
                                                    <ul>
                                                      <li>
                                                        <p class="location"><span class="fa fa-map-marker"></span><%=upcoming_booking.getSlot().getCourt().getClub().getStreet()%>, <%=upcoming_booking.getSlot().getCourt().getClub().getTown()%> </p>
                                                        </li> 
                                                      <li><span class="fa fa-calendar" style="width: fit-content;"></span><%=upcoming_booking.getSlot().getDate()%></li>  
                        
                                                      <li><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                                      width="24" height="24"
                                                      viewBox="0 0 172 172"
                                                      style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#fd7e14"><path d="M86,14.33333c-39.49552,0 -71.66667,32.17115 -71.66667,71.66667c0,39.49552 32.17115,71.66667 71.66667,71.66667c39.49552,0 71.66667,-32.17115 71.66667,-71.66667c0,-39.49552 -32.17115,-71.66667 -71.66667,-71.66667zM86,28.66667c31.74921,0 57.33333,25.58412 57.33333,57.33333c0,31.74921 -25.58412,57.33333 -57.33333,57.33333c-31.74921,0 -57.33333,-25.58412 -57.33333,-57.33333c0,-31.74921 25.58412,-57.33333 57.33333,-57.33333zM78.83333,43v45.96744l30.76628,30.76628l10.13411,-10.13411l-26.56706,-26.56706v-40.03256z"></path></g></g></svg>
                                                      <%=upcoming_booking.getSlot().getTime()%>, <%=upcoming_booking.getSlot().getDuration()%> hours</li>
                                                      
                                                 </ul>
                                                    
                                                  </div>
                                                  <button class="btn btn-success btn-lg active" style="margin-top: 5%;" type="submit">Edit Booking</button>
                                                  
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>

                                        <%
                                        }

                                          
                                          %>


                                    
                                </section>
                                
            
            
            
            
            
            
                                <h1 style="margin-bottom: 5%; margin-left: 5.5%;">Bookings History</h1>
                                <section class="ftco-section scroll" style="margin-top: 0%; margin-bottom: 0%;  "  >
                                  
                                  <div class="container"  >
                                    <div class="row justify-content-center pb-4"></div>
                                      
                                    </div>
                                    <div class="column">
            
                                    
                                      <%
                                      if (bookings_list.size()==0){
                                        out.print("NO OLDER BOOKINGS");
                                      }else{
                                        for (Booking booking: bookings_list){
                                        %>
                                        <div class="col-md-10 ftco-animate"  style="width: 100%; max-width: 100%; margin-bottom: 3rem; " >
                                          <div class="project-wrap" style=" width: 100%; ">
                                            
                                            
                                            </a>
                                            <div class="text p-4 row" >
                                              <span class="days"><%=booking.getSlot().getCourt().getSport()%></span>
                                              <h3><a href="#"><%=booking.getSlot().getCourt().getClub().getName()%></a></h3>
                                              <div style="width: 100%;
                                              display: flex;
                                              flex-direction: row;
                                              justify-content: center;"  >
                                                <ul>
                                                  <li>
                                                    <p class="location"><span class="fa fa-map-marker"></span><%=booking.getSlot().getCourt().getClub().getStreet()%>, <%=booking.getSlot().getCourt().getClub().getTown()%> </p>
                                                    </li> 
                                                  <li><span class="fa fa-calendar" style="width: fit-content;"></span><%=booking.getSlot().getDate()%></li>  
                                                  <li><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                                      width="24" height="24"
                                                      viewBox="0 0 172 172"
                                                      style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#fd7e14"><path d="M14.33333,78.83333v14.33333h143.33333v-14.33333z"></path></g></g></svg>
                                                      <%=booking.getSlot().getCourt().getSurface()%>
                                                   
                                             </ul>
                                              </div>
                                              
                                            </div>
                                          </div>
                                        </div>
  

                                      <%

                                        }
                                      }

                                      %>
                                      
     
                                      

                                    </div>
                                  </div>
                                </section>
                                
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
            
                        </div>
            
            
                        </div>
                      </div>
            
                    </div>
                </div>

    

    



        
              
        
        
        
        
        
        
        
            </div>
		




    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


  <!-- FOOTER -->
  <footer class="container">
    <p class="float-end"><a href="#">Back to top</a></p>
    <p>&copy; 2017–2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
  </footer>
</main>


  </body>
   
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







  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="js/bootstrap.bundle.min.js"></script>
</html>
