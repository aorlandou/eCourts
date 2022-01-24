<%@ page import ="ecourts_java.*"%>
<%@ page errorPage="error.jsp"%>

<% 
String sportclName = (String)request.getParameter("spid");
SportsClub allclubs = new SportsClub();
int curClubid = allclubs.findID(sportclName);

    String redirectURL = "sportsclub_profile.jsp?spid="+ curClubid;
    response.sendRedirect(redirectURL);


%>

