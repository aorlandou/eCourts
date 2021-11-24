<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>





<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://195.251.249.131:3306/";
String database = "ismgroup7";
String userid = "ismgroup7";
String password = "he2kt6";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{
String sport=request.getParameter("sport");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql =" select slot_id, date, time_start, price from slot where court_id= "+sport+" " ;
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
int slot_id=resultSet.getInt("slot_id");

%>


    
<div class="col-md-4 ">
    <div class="project-wrap">
       <a href="pre_booking.html" class="img" style="background-image: url(images/tennis8.jpg);">
          <span class="price">15€/hour</span>
      </a>
      <div class="text p-4">
         <span class="days">Tennis</span>
         <h3><a href="pre_booking.html">Tennis Square</a></h3>
         <p class="location"><span class="fa fa-map-marker"></span> Odos Pentelis 69, Marousi</p>
         <ul>
            <li><span class="fa fa-calendar" style="width: fit-content;"></span>15/11/2021</li>
            <li><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                width="24" height="24"
                viewBox="0 0 172 172"
                style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#fd7e14"><path d="M86,14.33333c-39.49552,0 -71.66667,32.17115 -71.66667,71.66667c0,39.49552 32.17115,71.66667 71.66667,71.66667c39.49552,0 71.66667,-32.17115 71.66667,-71.66667c0,-39.49552 -32.17115,-71.66667 -71.66667,-71.66667zM86,28.66667c31.74921,0 57.33333,25.58412 57.33333,57.33333c0,31.74921 -25.58412,57.33333 -57.33333,57.33333c-31.74921,0 -57.33333,-25.58412 -57.33333,-57.33333c0,-31.74921 25.58412,-57.33333 57.33333,-57.33333zM78.83333,43v45.96744l30.76628,30.76628l10.13411,-10.13411l-26.56706,-26.56706v-40.03256z"></path></g></g></svg>
                12:00</li>
            <li><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                width="24" height="24"
                viewBox="0 0 172 172"
                style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#fd7e14"><path d="M14.33333,78.83333v14.33333h143.33333v-14.33333z"></path></g></g></svg>
                Grass Court</li>
         </ul>
     </div>
  </div>
</div>






<%
i++;




}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>