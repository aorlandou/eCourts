<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage=""%>
<%@ page import ="ecourts_java.*"%>
<%@ page import ="java.util.*"%>
<%

String date = request.getParameter("date");
String time_from = request.getParameter("time_from");
String time_to = request.getParameter("time_to");
String price = request.getParameter("price");
String court_id = request.getParameter("court_id");

List<Slot> slt_not = null;
Slot slt = new Slot();
try {
    slt_not = slt.generateAllSlots(time_from, time_to, date, court_id, price);
}catch (Exception e){
    
    %>
    <jsp:forward page="add_slot.jsp">
        <jsp:param name="messagesuc" value="Input data not in correct format" ></jsp:param>
    </jsp:forward>
    <%
}


%>
<jsp:forward page="add_slot.jsp">
   <jsp:param name="messagefail" value="Slots Added Succesfully." ></jsp:param>
</jsp:forward>

<%

%>