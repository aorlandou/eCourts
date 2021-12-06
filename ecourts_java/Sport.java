package ecourts_java;
import java.sql.*;
import java.util.*;

public class Sport {
    private int sport_id;
    private String sport_name;

    public int getSport_id() {
        return sport_id;
    }

    public void setSport_id(int sport_id) {
        this.sport_id = sport_id;
    }

    public String getSport_name() {
        return sport_name;
    }

    public void setSport_name(String sport_name) {
        this.sport_name = sport_name;
    }
    public Sport(int sport_id, String sport_name) {
        this.sport_id = sport_id;
        this.sport_name = sport_name;
    }
    public Sport() {
    }
    

    public List<Sport> getSports_of_club(int club_id) {

        List<Sport> sport_list  = new ArrayList<Sport>();
        try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement


            
            String query = "select distinct sport.sport_id, sport.name from sport,court where court.sportsclub_id = ? and court.sport_id = sport.sport_id ";
            pstmt=con.prepareStatement(query); //sql select query 
            pstmt.setInt(1, club_id);
            
            
            
        
            
            ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
              
            
            while(rs.next())
            {
                
                
                int sport_id = rs.getInt("sport_id");
                String sport_name = rs.getString("name");

                Sport sprt = new Sport(sport_id,sport_name);
                sport_list.add(sprt);
    
    
    
            }
            
            pstmt.close();
            con.close(); //close connection	
            
        
            }
            catch(Exception e)
            {
                System.out.println(e.getMessage());
                System.out.println("eroorrr");
            }
    
            return sport_list;
    
        }


   
    public void getAll_sports(){ 


    }

    

    


}