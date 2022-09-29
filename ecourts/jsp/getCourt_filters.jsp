<%@page import="java.util.*"%>
<%@page import="ecourts_java.*"%>
<%@page import="java.lang.*"%>
<%@ page errorPage="error.jsp"%>





<%
int sport;
int club_id ; 

try {
    
    club_id = Integer.parseInt(request.getParameter("club_id"));
 }
 catch (NumberFormatException e)
 {
    club_id = 0;
 }


 try {
    
    sport = Integer.parseInt(request.getParameter("sport"));   
 }
 catch (NumberFormatException e)
 {
    sport = 0;
 }


Court crt = new Court();
List<Court> court_list = crt.getCourts_of_club(club_id,sport);

    %>

    <option value="0">All Courts</option>

    <%
    for (Court court: court_list){

        %>

        <option value="<%=court.getCourt_id()%>"><%=court.getName()%></option>

        <%



    }





%>