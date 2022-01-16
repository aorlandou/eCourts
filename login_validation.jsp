<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="ecourts_java.*"%>

<%String email=request.getParameter("email");
String password=request.getParameter("password");
if(email==null){%>
  <jsp:forward page="login_form.jsp" />

<%}

User user=new User();
int user_id;
user_id=user.checkPassword(password,email);
if ( user_id!=-1 ){
    User curUser = user.getDetails(user_id); 
      
    if (session.getAttribute("not_logged")!=null){ 
      session.setAttribute("user_id", curUser); 
      int id=Integer.parseInt(request.getParameter("id"));
      Slot slot=new Slot();
      Slot curSlot= slot.getSlot_by_id(id);
      if (curSlot==null){ %>
        <jsp:forward page="home.jsp" />
      <%}
      %>
      
    <jsp:forward page="checkout.jsp?id=<%=id%>" />    
<%}else{
  if(curUser.getType()==1){ 
    session.setAttribute("user_id", curUser);  
   %>
    
    <jsp:forward page="club_managing.jsp" />
    <%}else{ 
      session.setAttribute("user_id", curUser);     
     %>
  <jsp:forward page="home.jsp" />    

<%}}}
%>








<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login to your Account</title>
  <link rel="icon" href="images/LOGO2-01.png">
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/login.css">
</head>

<script>
var check = function() {
  const button = document.querySelector('register');
  const email=document.getElementById('email').value;
  if (email.length!=0) {		
  document.getElementById('message_email').innerHTML = '';
     if(document.getElementById('password').value!=""){
      document.getElementById("login").disabled = false;

     }
	
  }   

}
</script>

<script>
  var check2 = function() {
    const button = document.querySelector('register');
    const password=document.getElementById('password').value;  
    if (password.length!=0) {		
    document.getElementById('message_pass1').innerHTML = '';
    if(document.getElementById('email').value!=""){
      document.getElementById("login").disabled = false;

     }
   	
    }   
  
  }
  </script>



<body>
  <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-5">
            <img src="images/tennis5.jpg" alt="login" class="login-card-img">
          </div>
          <div class="col-md-7">
            <div class="card-body">
              <div class="brand-wrapper">
                <% if (session.getAttribute("not_logged")!=null){ %>
                  <div class="alert alert-danger" role="alert" style="margin-bottom: 10%;">
                    Please login or register to complete your booking
                  </div>
                  <%}%>
                <img src="images/LOGO2-01.png" alt="logo" class="logo" style="display: block;margin-left: 0px; margin-top: -25px;margin-bottom: auto; margin-right: auto;margin-bottom: -10px;width: 130px; height: 70px;">
              </div>
              <p class="login-card-description">Sign into your account</p>
              <% if (session.getAttribute("not_logged")!=null){ 
                int id=Integer.parseInt(request.getParameter("id"));
                %>
                <form action="login_validation.jsp?id=<%=id%>" method="post" onsubmit="valthisform()">
                  <%}else{ %>
                    <form action="login_validation.jsp" method="post" onsubmit="valthisform()">
                  <%}%>
                  <div class="form-group">
                    <label for="email" class="sr-only">Email</label>
                    <input type="text" name="email" id="email" oninput="check()" value="<%=email%>" class="form-login" placeholder="Email or Phone">
                    <span id='message_email'></span>	
                  </div>
                  <div class="form-group mb-4">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" name="password" id="password" value="<%=password%>" oninput="check2()" class="form-login" placeholder="Password">
                    <span id='message_pass1'></span>	
                  </div>
                  <% if (user.checkEmail(email) && user.checkPhone(email)){ %>
                  <div class="form-group">
                    <p style="color: #FF0000;">Email or phone doesn't exists.</p>
                  </div>
                 
                   <% }else if (user_id==-1){ %>
                  <div class="form-group">
                    <p style="color: #FF0000;">Wrong password.</p>
                  </div>
                  <% } %>
                  <input name="login"  id="login"  class="btn btn-block login-btn mb-4" type="submit" value="Login" >

                  <script>					
                    function valthisform() {                   
                      var email=document.getElementById('email').value;
                      var password=document.getElementById('password').value;
                      const button = document.querySelector('login');
                      
                       if (password.length==0) {		
                                    document.getElementById('message_pass1').style.color = 'red';
                                    document.getElementById('message_pass1').innerHTML = 'Please fill out this field';
                                    event.preventDefault();
                                   }                   
                       if (email.length==0) {		
                                     document.getElementById('message_email').style.color = 'red';
                                     document.getElementById('message_email').innerHTML = 'Please fill out this field';
                                     event.preventDefault();
                                     
              
                                  }                    
                       
                    }					
                  </script>
                </form>
                
                <% if (session.getAttribute("not_logged")!=null){ 
                  int id=Integer.parseInt(request.getParameter("id"));
                  %>
                  <p class="login-card-footer-text">Don't have an account? <a href="register.jsp?id=<%=id%>" class="text-reset">Register here</a></p>
                    <%}else{ %>
                      <p class="login-card-footer-text">Don't have an account? <a href="register.jsp" class="text-reset">Register here</a></p>
                    <%}%>
               
                <nav class="login-card-footer-nav">
                  <a href="#!">Terms of use.</a>
                  <a href="#!">Privacy policy</a>
                </nav>

                
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
