<head>
	<meta charset="utf-8">
	<title>eCourts Checkout</title>
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
</head>


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


<br>
<br>

<div class="stepper-wrapper">
   
    <div class="stepper-item completed">
      <div class="step-counter"><i class="fa fa-calendar" style="font-size:24px"></i></div>
      <div class="step-name" style="color:rgb(68, 68, 68)">Confirm</div>
    </div>
    <div class="stepper-item active">
      <div class="step-counter">2</div>
      <div class="step-name" style="color:rgb(68, 68, 68)">Payment</div>
    </div>
    <div class="stepper-item">
      <div class="step-counter">3</div>
      <div class="step-name" style="color:rgb(68, 68, 68)">Finish</div>
    </div>
  </div>


  <body class="form-v10">
    <div class="page-content">
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
              <p id="cvv" style="display:none;margin-top: -7px;"  class="text mb-1">CVV/CVC</p> 
              <input id="incvv" style="display:none;width: 100px;" class="form-control mb-3 pt-2 " type="password">
            </div>      
            <div class="form-row-last">
              <input type="submit" name="register" class="register" value="Next">
            </div>
          </div>
        </form>
         <img  style="display: block;margin-left: auto; margin-bottom: -130px;margin-top: -25px; margin-right: auto;  width: 160px; height: 150px;opacity: 0.7;" src="ecourts_logo.png">
      </div>
    </div>
  </body>
    
  