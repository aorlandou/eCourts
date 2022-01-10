<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import ="ecourts_java.*"%>



<script>
    function myfunc(item){
        showList.style.display = "none";       
       
        
        
    }
   
   

</script>
<%
if(request.getParameter("key")!=null){
    String key=request.getParameter("key");
    String wild="%" +key+ "%";

    DB data = new DB();
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String sql = "SELECT name FROM users WHERE type='1' AND name LIKE ?";

    try {
            
        con = data.getConnection();
        stmt = con.prepareStatement(sql);
        stmt.setString(1, wild);

        rs = stmt.executeQuery();
        while (rs.next()){
            %> 
                <li class="list-group-item" id="list1" onclick="myfunc(this)"><%=rs.getString("name")%></li>
            <%
        }
        rs.close(); //closing ResultSet
        stmt.close();
    } catch (Exception e) {

        throw new Exception(e.getMessage());

    } finally {

        try {
            data.closeConnection();
        } catch (Exception e) {
            
        }

    }
}
%>
