<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="ecourts_java.*"%>





<%
int sport;
String date;
int municipality;

try {
    sport = Integer.parseInt(request.getParameter("sport"));
    date = request.getParameter("date");
    municipality = Integer.parseInt(request.getParameter("municipality"));
    
 }
 catch (NumberFormatException e)
 {
    sport = 0;
    date = null;
    municipality =0;
 }
 


Slot slot = new Slot();
List<Slot> slot_list = slot.getSlots(sport,date, municipality);

%>
    <div class="row">
<%
 
    for(Slot slot1 : slot_list) {

        String photo_path = "photos/"+slot1.getCourt().getClub().getName()+"/"+slot1.getCourt().getName()+".jpg";
        
        if (photo_path != null){
        photo_path = photo_path.replaceAll("\\s", "");
      }
      

        
%>
        <div class="col-md-4 ">
            <div class="project-wrap">
               <a href="pre_booking.html" class="img" style="background-image: url(<%=photo_path%>);">
                  <span class="price"><%= slot1.getPrice()+ " €/hour" %></span>
              </a>
              <div class="text p-4">
                 <span class="days"><%=slot1.getCourt().getSport()%></span>
                 <h3><a href="pre_booking.html"><%=slot1.getCourt().getClub().getName()%></a></h3>
                 <p class="location"><span class="fa fa-map-marker"></span> <%=slot1.getCourt().getClub().getStreet() + ", " +slot1.getCourt().getClub().getTown() %></p>
                 <ul>
                    <li><span class="fa fa-calendar" style="width: fit-content;"></span><%=slot1.getDate()%></li>
                    <li><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                        width="24" height="24"
                        viewBox="0 0 172 172"
                        style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#fd7e14"><path d="M86,14.33333c-39.49552,0 -71.66667,32.17115 -71.66667,71.66667c0,39.49552 32.17115,71.66667 71.66667,71.66667c39.49552,0 71.66667,-32.17115 71.66667,-71.66667c0,-39.49552 -32.17115,-71.66667 -71.66667,-71.66667zM86,28.66667c31.74921,0 57.33333,25.58412 57.33333,57.33333c0,31.74921 -25.58412,57.33333 -57.33333,57.33333c-31.74921,0 -57.33333,-25.58412 -57.33333,-57.33333c0,-31.74921 25.58412,-57.33333 57.33333,-57.33333zM78.83333,43v45.96744l30.76628,30.76628l10.13411,-10.13411l-26.56706,-26.56706v-40.03256z"></path></g></g></svg>
                        <%=slot1.getTime()%></li>
                    <li><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                        width="24" height="24"
                        viewBox="0 0 172 172"
                        style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#fd7e14"><path d="M14.33333,78.83333v14.33333h143.33333v-14.33333z"></path></g></g></svg>
                        <%=slot1.getCourt().getSurface() + " Court"%></li>
                 </ul>
             </div>
          </div>
        </div>

        


<%




  
    }
%>

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


<%










%>