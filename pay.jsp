<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="ecourts_java.*"%>

<% int slot_id;
  session.setAttribute("not_logged", null);
	User curUser = (User)session.getAttribute("user_id");
  try{
  slot_id=Integer.parseInt(request.getParameter("id"));
  }catch (NumberFormatException e){%>
    <jsp:forward page="home.jsp" />
  <%}
  
  Slot slot=new Slot();
  Slot curSlot= slot.getSlot_by_id(slot_id);
  Court court=new Court();
  court=court.getCourt_by_id(curSlot.getCourt_id());

  String comments= request.getParameter("subject");
  if(session.getAttribute("book")!=null){
  Booking book=(Booking)session.getAttribute("book");
  book.setComment(comments);
  }else{%>
    <jsp:forward page="home.jsp" />
  <%}

 
	



%>





<!doctype html>
<html lang="en">
  <head>
    


    <title>Checkout</title>
	  <!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="icon" href="images/LOGO2-01.png">
  <!-- Font-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="css/ecourts_payment.css">
  <link rel="stylesheet" href="css/ecourts_stepper.css">
  
	<link rel="stylesheet" type="text/css" href="css/montserrat-font.css">
	<link rel="stylesheet" type="text/css" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
	<!-- Main Style Css -->  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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


<style> 
    textarea {
      width: 100%;
      height: 150px;
      padding: 12px 20px;
      box-sizing: border-box;
      border: 2px solid #ccc;
      border-radius: 4px;
      background-color: #f8f8f8;
      font-size: 16px;
      resize: none;
    }
    </style>


<script>
    function myFunction() {
      var checkBox = document.getElementById("myCheck");
      var name = document.getElementById("name");
      var inname = document.getElementById("inname");
      var number = document.getElementById("number");
      var innumber = document.getElementById("innumber");
      var exp = document.getElementById("exp");
      var cvv = document.getElementById("cvv");
      var incvv = document.getElementById("incvv");
      var month = document.getElementById("month");
      var year = document.getElementById("year");
      if (checkBox.checked == true){
        name.style.display = "block";
        inname.style.display = "block";
        number.style.display = "block";
        innumber.style.display = "block";
        exp.style.display = "block";
        cvv.style.display = "block";
        incvv.style.display = "block";
        month.style.display = "block";
        year.style.display = "block";
      } else {
         name.style.display = "none";
         inname.style.display = "none";
         number.style.display = "none";
         innumber.style.display = "none"; 
         exp.style.display = "none"; 
         cvv.style.display = "none";
         incvv.style.display = "none";
         month.style.display = "none";
         year.style.display = "none";
         
      }
    }
    </script>
  
  <script>
    function validate(){
     if (document.getElementById('cash').checked){              
      document.getElementById("cash").checked = false;                  
     }           
      }
  </script>
  
  <script>
       function validate_second(){
          if (document.getElementById('myCheck').checked){    
               document.getElementById('myCheck').click();
               document.getElementById("cash").checked = true; 
                      
          }           
       }
  </script>
  



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
        </ul>
        <div class="nav-item dropdown" style="margin-top: -1%;">
          <a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action" style="color:rgb(223, 221, 221);"><img src="images/user.png" style="width: 37px;"><%=curUser.getName()%><b class="caret"></b></a>
          <div class="dropdown-menu">
            <a href="user_profile.jsp" class="dropdown-item"><i class="fa fa-user-o"></i> Profile</a>
            <a href="edit_user_profile.jsp" class="dropdown-item"><i class="fa fa-sliders"></i> Settings</a>
            <div class="divider dropdown-divider"></div>
            <a href="logout.jsp" class="dropdown-item"><i class="fa fa-sign-out"></i> Logout</a>
            
              
          </div>
        </div>

          
              
					
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
                        <div class="col-md-12">
                            <div class="stepper-wrapper">  
    
                                <div class="stepper-item active completed">
                                  <div class="step-counter"><i class="fa fa-info" style="font-size:24px"></i></div>
                                  <div class="step-name">Summary</div>
                                </div>
                                <div class="stepper-item active completed">
                                  <div class="step-counter "><i class="fa fa-credit-card-alt" style="font-size:24px"></i></div>
                                  <div class="step-name">Payment</div>
                                </div>
                                <div class="stepper-item">
                                  <div class="step-counter"><i class="fa fa-check" style="font-size:24px"></i></div>
                                  <div class="step-name">Finish</div>
                                </div>
                              </div>

                              <div class="form-v10">
                                <div class="page-content" style="margin-top: -60px;">
                                  <div class="form-v10-content">
                                    <form class="form-detail" action="finish.html" method="post" id="myform">
                                      <div class="form-left">
                                        <h2>Payment Method</h2>             
                                        <div class="form-row">
                                          <label class="containercheck">
                                            <i class="fa fa-money" style="font-size:24px"></i>
                                            Cash payment
                                            <input name="one" id="cash" onclick="validate_second()" type="checkbox">
                                            <span class="checkmark"></span>
                                           </label>           
                                        </div>
                                        <div class="form-row">
                                          <label class="containercheck">
                                            <i class="fa fa-credit-card" style="font-size:24px"></i>
                                            Online payment
                                            
                                            <input name="one" id="myCheck" onclick="myFunction(),validate()" type="checkbox" >
                                            <span class="checkmark"></span>
                                          </label>         
                                        </div> 
                                        <div class="form-row">
                                          <p id="number" style="display:none" class="text mb-1">Card Number</p>        
                                          <input id="innumber" style="display:none" class="form-control mb-3" type="text">
                                          <p id="name" style="display:none">Cardholder's name</p>
                                          <input style="display:none" id="inname" class="form-control mb-3" type="text">
                                        </div>                   
                                        
                                      </div>
                                      <div class="form-right">
                                        <div class="form-row">
                                          <p id="exp" class="exp" style="display:none;">Expiration date</p>
                                        </div>      
                                          <div class="form-group">                 
                                            <div class="form-row form-row-1">                 
                                              <select id="month" style="display:none; margin-top: -7px;width: 140px;" class="month">
                                                <option value="01">January</option>
                                                <option value="02">February </option>
                                                <option value="03">March</option>
                                                <option value="04">April</option>
                                                <option value="05">May</option>
                                                <option value="06">June</option>
                                                <option value="07">July</option>
                                                <option value="08">August</option>
                                                <option value="09">September</option>
                                                <option value="10">October</option>
                                                <option value="11">November</option>
                                                <option value="12">December</option>
                                            </select>
                                            </div>
                                            <div class="form-row form-row-2">                  
                                             <select id="year" style="display:none;margin-top: -7px;width: 140px;">
                                              <option value="16"> 2022</option>
                                              <option value="17"> 2023</option>
                                              <option value="18"> 2024</option>
                                              <option value="19"> 2025</option>
                                              <option value="20"> 2026</option>
                                              <option value="21"> 2027</option>
                                             </select>
                                            </div>
                                          </div>             
                                       
                                          
                                        <div class="form-row">
                                          <p id="cvv" style="display:none;margin-top: -20px;"  class="text mb-1">CVV/CVC</p> 
                                          <input id="incvv" style="display:none;width: 100px;margin-left: -18%;margin-top: 5%;" class="form-control mb-3 pt-2 " type="password">
                                        </div>      
                                        <div class="form-row-last">
                                          <input type="submit" name="register" class="register" value="Next">
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
