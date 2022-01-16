<%@ page import ="ecourts_java.*"%>
<% 
String sportclName = (String)request.getParameter("spid");
SportsClub allclubs = new SportsClub();
int curClubid = allclubs.findID(sportclName);

    String redirectURL = "sportsclub_profile.jsp?spid="+ curClubid;
    response.sendRedirect(redirectURL);


%>

