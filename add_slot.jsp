<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import ="ecourts_java.*"%>
<%@ page import ="java.util.*"%>
<%

String messagesuc = request.getParameter("messagesuc");
String messagefail = request.getParameter("messagefail");

if(session.getAttribute("user_id")==null){%>
    <jsp:forward page="home.jsp" />
<%}
User user=(User)session.getAttribute("user_id");
if(user.getType()==0){%>
    <jsp:forward page="home.jsp" />
<%}
int club_id = user.getUser_id();
Court crt = new Court();
List<Court> court_list = crt.getCourts_of_club(club_id,0);



%>

<!doctype html>
<html lang="en">
<head>
  
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" href="images/LOGO2-01.png">
    <meta charset="utf-8">
    <title>Club Managing - Add Slot</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script>
    $( function() {
        $( "#datepicker" ).datepicker();
    } );
    </script>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- This CSS file (bootstrap-theme.min.css) is optional -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
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
    <link rel="stylesheet" href="css/search.css">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link href="css/mobiscroll.javascript.min.css" rel="stylesheet" />
    <script src="js/mobiscroll.javascript.min.js"></script>
    <script>
    $( function() {
      $( "#datepicker" ).datepicker();
    } );
    </script>


    <script>
        mobiscroll.setOptions({
            theme: 'ios',
            themeVariant: 'light'
        });

        
        mobiscroll.datepicker('#demo-timegrid', {
            controls: ['timegrid'],
            select: 'range',
            display: 'inline'
        });

        
        </script>
  
    
 <!-- Latest compiled and minified CSS -->



    <style>
        body {
  overflow: hidden; /* Hide scrollbars */
}

        .mt-3, .my-3 {
            margin-top: -0.02rem !important;
        }
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
    .alert {
        margin-top: 4%;
        color: green;
        background-color: lightgreen;
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

    <script>
        function add_slot(){
            console.log("HERE")
            var date= $('#datepicker').val();
            var time= $('#demo-timegrid')[0];
            console.log(date)
            console.log(time)
        }

    </script>
    



    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="background-color: #fff;">
            <div class="container">
                <a class="navbar-brand" href="logout.jsp"><img class="logo" src="photos/LOGO2-01.png" > </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>
    
                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="club_managing.jsp" class="nav-link">Home</a></li>
                        <li class="nav-item"  ><a href="club_managing.jsp#Timetable" class="nav-link"> <p style="color: #000;">Timetable</p></a></li>
                        <li class="nav-item"><a href="club_managing.jsp#Courts" class="nav-link"><p style="color: #000;">Courts</p></a></li>
                        <li class="nav-item"><a href="logout.jsp" class="nav-link"><p style="color: #000;">Logout</p></a></li>
                    
                    
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
        
    
    
      
    
    
    
    
    
    
    
    </header>
    
    <main>

    
        
        <div class="container">
            <div class="row">
                <%
                    if (messagesuc!= null){ %>
                        <div class="alert alert-success" style="background-color: green;">

                            <%=messagesuc%>

                        </div>
                <%    }
                    if (messagefail!= null){ %>
                        <div class="alert alert-danger" style="color: #000;">

                            <%=messagefail %>

                        </div>
                <%    }
                %>
            </div>
            <div class="row">
            <% if (messagesuc!= null || messagefail!=null){ %>
                <div class="col-7" style="background-color: rgb(233, 153, 101); margin-top: 0%;">
                    <h2 style="margin-top: 20px;">Add available slots for your Courts </h2>
                </div>
            <%} else { %>
                <div class="col-7" style="background-color: rgb(233, 153, 101); margin-top: 5%;">
                    <h2 style="margin-top: 20px;">Add available slots for your Courts </h2>
                </div>
            <% } %>
            </div>
        </div>
        
        
        
        <form action="add_slot_process.jsp" method="post">
        <div class="container p-3 my-3 border" style="background-color:#e0e0e0; margin-top: -3rem;">
            <div class="row">
                
                <div class="col">
                    Select Date: <input type="date" id="start" name="date"
                    value="2022-01-20"
                    min="2022-01-20">
                </div>
                <div class="col">
                    Choose one Court:
                    <ul class="ks-cboxtags">

                        <%
                        for (Court court: court_list){
                    
                            %>
                    
                            <li><input type="checkbox" id="<%=court.getCourt_id()%>" name = "court_id" value="<%=court.getCourt_id()%>" class="chb"><label for="<%=court.getCourt_id()%>"><%=court.getName()%></label></li>
                    
                            <%

                        }

                        %>
                        
                        
                        

                        
                        				  
                    </ul>
                </div>
                <div class="col">
                    <label for="#">Select Timespan:</label>
                    <br>
                    <br>
                    <label for="#">From Time:</label>
                    <div class="form-field">
                        <div class="select-wrap">
                            
                            <select name="time_from" id="fromtime" class="form-control" placeholder="From" style="width: 80%; margin-top: 0%; height: 4px; color: #333; text-align: left; -webkit-box-shadow: 0 6px 10px 0 rgb(0 0 0 / 10%); box-shadow: 0 6px 10px 0 rgb(0 0 0 / 10%); border: 0; outline: 0; padding: 0px 18px; border-radius: 50px;">
                                
                                    <option value="08:00:00">8:00 AM</option>
                                    <option value="09:00:00">9:00 AM</option>
                                    <option value="10:00:00">10:00 AM</option>
                                    <option value="11:00:00">11:00 AM</option>
                                    <option value="12:00:00">12:00 PM</option>
                                    <option value="13:00:00">13:00 PM</option>
                                    <option value="14:00:00">14:00 PM</option>
                                    <option value="15:00:00">15:00 PM</option>
                                    <option value="16:00:00">16:00 PM</option>
                                    <option value="17:00:00">17:00 PM</option>
                                    <option value="18:00:00">18:00 PM</option>
                                    <option value="19:00:00">19:00 PM</option>
                                    <option value="20:00:00">20:00 PM</option>
                                    <option value="21:00:00">21:00 PM</option>
                                    
                            </select>
                        </div>
                    </div>
                    <br>
                    <br>
                    <label for="#">Until Time:</label>
                    <div class="form-field">
                        <div class="select-wrap">
                            <select name="time_to" id="totime" class="form-control" placeholder="To" style="width: 80%; margin-top: 0%; height: 4px; color: #333; text-align: left; -webkit-box-shadow: 0 6px 10px 0 rgb(0 0 0 / 10%); box-shadow: 0 6px 10px 0 rgb(0 0 0 / 10%); border: 0; outline: 0; padding: 0px 18px; border-radius: 50px;">
                                
                                    <option value="08:00:00">8:00 AM</option>
                                    <option value="09:00:00">9:00 AM</option>
                                    <option value="10:00:00">10:00 AM</option>
                                    <option value="11:00:00">11:00 AM</option>
                                    <option value="12:00:00">12:00 PM</option>
                                    <option value="13:00:00">13:00 PM</option>
                                    <option value="14:00:00">14:00 PM</option>
                                    <option value="15:00:00">15:00 PM</option>
                                    <option value="16:00:00">16:00 PM</option>
                                    <option value="17:00:00">17:00 PM</option>
                                    <option value="18:00:00">18:00 PM</option>
                                    <option value="19:00:00">19:00 PM</option>
                                    <option value="20:00:00">20:00 PM</option>
                                    <option value="21:00:00">21:00 PM</option>
                                    <option value="22:00:00">22:00 PM</option>
                            
                            </select>
                        </div>
                    </div>
                    
                </div>
                <div class="col">
                    Price of Court per hour:
                    <input type="text" name = "price" class="form-search__field" placeholder="" style="width: 80%; margin-top: 0%; margin-left: auto; height: 4px;"/>
                    <button type="Submit" class="btn-search--primary btn--inside uppercase" style="margin-top: 70%; margin-left: 10%; "><i class="fa fa-calendar"></i>  Add Slot</button>
                </div>
                </div>
            <br>
            
            </div>
            
        </div>
    </form>
    <div class="row">
        <a  href="club_managing.jsp">
            <button type="" class="btn-search--primary btn--inside uppercase" style=" margin-left: 11%;"><img src="images/back.png" width="20px" ></img>  Back</button>
        </a>
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
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

            <script>
                mobiscroll.datepicker('#demo-timegrid', {
                    controls: ['timegrid'],       // More info about controls: https://docs.mobiscroll.com/5-13-2/javascript/range#opt-controls
                    select: 'range',              // More info about select: https://docs.mobiscroll.com/5-13-2/javascript/range#methods-select
                    display: 'inline'             // Specify display mode like: display: 'bottom' or omit setting to use default
                });
            </script>

            <script>
                $(".chb").change(function() {
                    $(".chb").prop('checked', false);
                    $(this).prop('checked', true);
                });
            </script>


  
</html>