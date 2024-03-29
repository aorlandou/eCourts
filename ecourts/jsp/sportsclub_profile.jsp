<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import ="ecourts_java.*"%>
<%@ page import ="java.util.*"%>

<!doctype html>
<html lang="en">
  <head>
<% 
    
User curUser = (User)session.getAttribute("user_id");


int spid;
try {
    
  spid = Integer.parseInt(request.getParameter("spid"));    
}
catch (NumberFormatException e)
{
  %>
  <jsp:forward page="home.jsp" />
  <%
}
 
  SportsClub allclubs = new SportsClub();
  Sport sprt = new Sport();
  SportsClub curClub = null;
  Court crt = new Court();

 
curClub = allclubs.findClub(spid);
if (curClub== null){
  %>
        <jsp:forward page="home.jsp" />
  <%
}

String munName = allclubs.getMunicipalityName(curClub.getMunic_id());
List<Sport> sports_list = sprt.getSports_of_club(spid);
List<Court> courts_list = crt.getCourts_of_club(spid,0);

    
        
        

%>
    

    
    
  <title><%=curClub.getName()%></title>
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

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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


      function getSlots(page_num,club_id,change_court) {
        
        var sport= $('#sport').val();
        var date= $('#date').val();
        var court= $('#courts').val();
        var duration= $('#duration').val();
        var time= $('#time').val();
        
        console.log(change_court);
        console.log("I've been called");
        console.log(page_num);
        console.log(court);

        
        if (change_court==1){
          court = 0;
          console.log("the second jsp is being called");
          $.ajax({
          url: "getCourt_filters.jsp",
          type: 'POST',
          data: {sport: sport, club_id: club_id},
          success: function(data) {
          
          document.getElementById("courts").innerHTML = data;
  
        
        }
        });
        }
  
        $.ajax({
        url: "getslots.jsp",
        type: 'POST',
        data: {sport: sport, date: date, p:page_num, club_id: club_id, court: court,duration:duration, time:time},
        success: function(data) {
        
        document.getElementById("res").innerHTML = data;
  
        
        }
        });
        }


    </script>

    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
  </head>

  <body style="padding-top: 0rem; padding-bottom: 0px; background-color: #f3f3f3;" onload="getSlots(1,'<%=spid%>',1 )" >


    
<header>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="background-color: #fff;">
		<div class="container">
			<a class="navbar-brand" href="home.jsp"><img class="logo" src="photos/LOGO2-01.png"> </a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="#" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="#About" class="nav-link">About</a></li>
					<li class="nav-item"><a href="#Gallery" class="nav-link">Gallery</a></li>
					<li class="nav-item"><a href="#Book" class="nav-link">Book a Court</a></li>
          <% if (curUser == null || curUser.getType()==1 ){%>
						<li class="nav-item"><a href="login_form.jsp" class="nav-link">Login</a></li>
					<%} %>
                
                
            </ul>
                <!-- if logged in -->
                <% if (curUser != null && curUser.getType()==0){%>
                  <div class="nav-item dropdown">
                    <a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action" style="color:rgb(223, 221, 221);"><img src="images/user.png" style="width: 37px;">   <%=curUser.getName()%> <b class="caret"></b></a>
                    <div class="dropdown-menu">
                      <a href="user_profile.jsp" class="dropdown-item"><i class="fa fa-user"></i> Profile</a>
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
	<div class="hero-image " style="background-image: url('images/sportsclub/<%=curClub.getUser_id()%>/background.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center" data-scrollax-parent="true">
				<div class="col-md-7 ftco-animate">
					
                
					<h1 class="mb-4" style="margin-left: 5%;"><%=curClub.getName()%> </h1>
                    <h2 class="mb-4" style="margin-left: 5%; color: #fff ;font-family: Poppins, Arial, sans-serif;"><%=munName%> </h2>
					<p class="caps"></p>
				</div>
				
			</div>
		</div>
	</div>


  







</header>

<main>







  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    

    <!-- START THE FEATURETTES -->


    <div class="row featurette" id = "About">
      <div class="col-md-7" style="margin-top: 7%;">
        <h1 class="mb-4">About <span class="text-muted"></span></h1>
          
        
        
        <p style="font-size: large; margin-top: 5%;" >  <%=curClub.getAbout()%></p>
        
        <p style="margin-top: 10%;">
          <span class="icon fa fa-map-marker"></span>&emsp;<b>Location:</b> <%=curClub.getStreet()%>, <%=munName%> <br>
          <span class="icon fa fa-phone"></span>&emsp;<b>Email:</b> <%=curClub.getEmail()%><br>
          <span class="icon fa fa-paper-plane"></span>&emsp;<b>Phone:</b> <%=curClub.getLinephone()%>  
        </p>
      </div>
      
         

      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" style="margin-top: 20%;" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#f3f3f3"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
          <image  href = "images/sportsclub/<%=curClub.getUser_id()%>/logo.jpg" style="width: 400px;height: 500px"></image>
        </svg>
            
      </div>
    </div>

    <hr class="featurette-divider" id ="Gallery">

    <div class="row featurette" >
      <h1  style="margin-top: 2%;">Gallery <span class="text-muted"></span></h1>

      
    <div class="carousel slide" id="slider" data-ride="carousel" style="width: 70%; margin: auto; margin-top: 5%;">
      <!--indicators-->
      <ol class="carousel-indicators">
        <li data-target="#slider" data-slide-to="0" class="active"></li>
        <li data-target="#slider" data-slide-to="1"></li>
        <li data-target="#slider" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="images/sportsclub/<%=curClub.getUser_id()%>/gallery/gallery1.jpg">
          <div class="carousel-caption">
           
          </div>
        </div>
    
        <div class="carousel-item" id="slide2">
          <img src="images/sportsclub/<%=curClub.getUser_id()%>/gallery/gallery2.jpg">
          <div class="carousel-caption">
           
          </div>
        </div>
    
        <div class="carousel-item" id="slide3">
          <img src="images/sportsclub/<%=curClub.getUser_id()%>/gallery/gallery3.jpg">
          <div class="carousel-caption">
           
          </div>
        </div>
    
      </div>
      <a class="carousel-control-prev" href="#slider" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#slider" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>

    

    <hr class="featurette-divider" id ="Book">

    

    <h2 class="featurette-heading"> <span class="text-muted"></span></h2>

   

	<section class="ftco-section ftco-no-pb ftco-no-pt" style="padding-bottom: 0px; padding-top: 2rem";>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="ftco-search d-flex justify-content-center">
						<div class="row">
							<div class="col-md-12 nav-link-wrap">
								<div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
									<a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Book a Court </a>

									

								</div>
							</div>
							<div class="col-md-12 tab-wrap">
								
								<div class="tab-content" id="v-pills-tabContent">

									<div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
										<form action="#" class="search-property-1">
											<div class="row no-gutters">


                        <div class="col-md d-flex">
													<div class="form-group p-4">
														<label for="#">Sport</label>
														<div class="form-field">
															<div class="select-wrap">
																<div class="icon"><span class="fa fa-chevron-down"></span></div>
																<select name="" id="sport" class="form-control" onchange="getSlots(1, '<%=spid%>',1)">
                                  <%
                                  
                                  for (Sport sport: sports_list){
                                  %>
                                    <option value="<%=sport.getSport_id()%>"><%=sport.getSport_name()%></option>
                                  <%
                                  }
                                  
                                  %>

                                  
                                  
																	
																
																</select>
															</div>
														</div>
													</div>
												</div>


                        <div class="col-md d-flex">
													<div class="form-group p-4">
														<label for="#">Court</label>
														<div class="form-field">
															<div class="select-wrap">
																<div class="icon"><span class="fa fa-chevron-down"></span></div>
																<select name="" id="courts" class="form-control" onchange="getSlots(1, '<%=spid%>',0)">
                                  

                                  

																	
																
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
                              <input type="date" id = "date" class="form-control " placeholder="Choose Date" value="" onchange="getSlots(1,'<%=spid%>',0)">
														</div>
													</div>
												</div>
                        <div class="col-lg d-flex">
                          <div class="form-group p-4">
                           <label for="#">Duration</label>
                           <div class="form-field">
                             <div class="select-wrap">
                               <div class="icon"><span class="fa fa-chevron-down"></span></div>
                               <select name="" id="duration" class="form-control" onchange="getSlots(1,'<%=spid%>',0)">
                                
                                  <option value="1">1 hour</option>
                                  <option value="2">2 hours</option>

                               </select>
                             </div>
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
		</section>




    <div id = "here"></div>

    <section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center pb-4">
					
				</div>
				<div class="row" id ="res">



                        
				</div>
			</div>
		</section>
		



    </div>
</div><!-- /.container -->
    


  



  


  <!-- FOOTER -->
  
  <footer class="ftco-footer bg-bottom ftco-no-pt" style="background-color: #e6c5bb;">
    <div class="container">
      <div class="row mb-2">
        <div class="col-md pt-5">
          <div class="ftco-footer-widget pt-md-5 mb-4">
            <h2 class="ftco-heading-2" id="About">About</h2>
            <p>Hustle free sport court booking! With eCourts you will forget the multiple phone calls to diferrent sportsclubs. Just choose your favorite sport and leave the rest to us.</p>
            <ul class="ftco-footer-social list-unstyled float-md-left float-lft">
              <li class="ftco-animate"><a href="#"><span class="fab fa-twitter"></span></a></li>
              <li class="ftco-animate"><a href="#"><span class="fab fa-facebook"></span></a></li>
              <li class="ftco-animate"><a href="#"><span class="fab fa-instagram"></span></a></li>
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
    
  </div>
  





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







 
</html>
