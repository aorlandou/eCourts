<%@page import="java.util.*"%>
<%@page import="ecourts_java.*"%>
<%@page import="java.lang.*"%>
<%@ page errorPage="error.jsp"%>







<%
int sport;
String date;
int municipality;
int p; 
int club_id;
int court_id;
int duration;
String time;

try {
    
    club_id = Integer.parseInt(request.getParameter("club_id"));
 }
 catch (NumberFormatException e)
 {
    club_id = 0;
 }
 
try {
    
    court_id = Integer.parseInt(request.getParameter("court"));
 }
 catch (NumberFormatException e)
 {
    court_id = 0;
 }
try {
    
    p = Integer.parseInt(request.getParameter("p"));    
 }
 catch (NumberFormatException e)
 {
    p=1;
 }

 try {
    
    sport = Integer.parseInt(request.getParameter("sport"));   
 }
 catch (NumberFormatException e)
 {
    sport = 0;
 }

 try {
    
    municipality = Integer.parseInt(request.getParameter("municipality"));  
 }
 catch (NumberFormatException e)
 {
    municipality =0;
 }


try {
    
    date = request.getParameter("date");    
 }
 catch (NumberFormatException e)
 {
    date = "";
 }

 
 try {
    
   duration = Integer.parseInt(request.getParameter("duration"));
}
catch (NumberFormatException e)
{
   duration = 0;
}
 


Slot slot = new Slot();
List<Slot> slot_list = slot.getSlots(sport, date, municipality, 0, club_id, court_id, duration,"",0,1);

int start;
int stop;
int num_pages = (int)Math.ceil(slot_list.size()/6.0);


String doors = "";
Boolean is_tennis = false;
start = 6* (p-1);
stop = start + 6;
if (stop>slot_list.size()){
    stop = slot_list.size();
}


if (slot_list.size()!= 0 ){

%>
   <div class="row" id = "">
       
<%

    for (int i = start; i < stop; i++) {
      

       
      Slot slt = slot_list.get(i);
      

         String photo_path = "";
         
         photo_path= "photos/"+slt.getCourt().getClub().getName()+"/"+slt.getCourt().getName()+".jpg";
      
      
         if (photo_path != null){
            photo_path = photo_path.replaceAll("\\s", "");
         }
         doors = "";
         is_tennis = false;
         if (slt.getCourt().getSportid() == 1 ){
            is_tennis = true;
            doors = slt.getCourt().getDoors();
         
         }
      

        
%>
         <div class="col-md-4">
            <div class="project-wrap">
               <a href="pre_booking.jsp?slot=<%=slt.getSlot_id()%>" class="img" style="background-image: url(<%=photo_path%>);">
                  <span class="price"><%= slt.getPrice().intValue()+ " €/hour" %></span>
              </a>
              <div class="text p-4">
                 <span class="days"><%=slt.getCourt().getSport()%></span>
                 <h3><a href="pre_booking.jsp?slot=<%=slt.getSlot_id()%>"><%=slt.getCourt().getClub().getName()%></a></h3>
                 <p class="location"><span class="fa fa-map-marker"></span> <%=slt.getCourt().getClub().getStreet() + ", " +slt.getCourt().getClub().getTown() %></p>
                 <ul>
                    <li><span class="fa fa-calendar" style="width: fit-content;"></span><%=slt.getDate()%></li> <br> 
                    <li><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                        width="24" height="24"
                        viewBox="0 0 172 172"
                        style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#fd7e14"><path d="M86,14.33333c-39.49552,0 -71.66667,32.17115 -71.66667,71.66667c0,39.49552 32.17115,71.66667 71.66667,71.66667c39.49552,0 71.66667,-32.17115 71.66667,-71.66667c0,-39.49552 -32.17115,-71.66667 -71.66667,-71.66667zM86,28.66667c31.74921,0 57.33333,25.58412 57.33333,57.33333c0,31.74921 -25.58412,57.33333 -57.33333,57.33333c-31.74921,0 -57.33333,-25.58412 -57.33333,-57.33333c0,-31.74921 25.58412,-57.33333 57.33333,-57.33333zM78.83333,43v45.96744l30.76628,30.76628l10.13411,-10.13411l-26.56706,-26.56706v-40.03256z"></path></g></g></svg>
                        <%=slt.getTime()%> <%= ", " + slt.getDuration() + " hours"%></li> <br>
                    <li><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                        width="24" height="24"
                        viewBox="0 0 172 172"
                        style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#fd7e14"><path d="M14.33333,78.83333v14.33333h143.33333v-14.33333z"></path></g></g></svg>
                        <%=slt.getCourt().getSurface() + " Court " + doors%> 
                     </li><br>
                        <%
                        
                        if (slt.getCourt().getSportid()==2){
                        %>
                        <li><i class="far fa-futbol" style="color: #f15d30;"></i><%= " "+ slt.getCourt().getSize()%></li>
                        <%
                        }

                        
                        %>
                     
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
         

<%
            for (int i=0; i < num_pages; i++){
                String cl = "";
                if (i +1 == p){
                    cl = "active";
                }


%>
            <li class="<%=cl%>"><a href="#here" onclick="getSlots('<%=i+1%>','<%=club_id%>')"><%= i +1%></a></li>
<%              
            }
%>

          
          
      </ul>
  </div>
  </div>
  </div>

    






<%

}
else
{

out.println("NO RESULTS");

}



%>