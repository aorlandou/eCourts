<%@page import="java.util.*"%>
<%@page import="ecourts_java.*"%>
<%@page import="java.lang.*"%>






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
    
   time = request.getParameter("time");    
}
catch (NumberFormatException e)
{
   time = "";
}
 try {
    
   duration = Integer.parseInt(request.getParameter("duration"));
}
catch (NumberFormatException e)
{
   duration = 0;
}
 


Slot slot = new Slot();
List<Slot> slot_list = slot.getSlots(sport, date, municipality, 0, club_id, court_id, duration,time);

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
         doors = "";
         is_tennis = false;
         if (slt.getCourt().getSportid() == 1 ){
            is_tennis = true;
            doors = slt.getCourt().getDoors();
         }

      }
      

        
%>
         

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