package ecourts_java;
import java.sql.*;
public class FootballCourt extends Court{


    private String size;
    

    public FootballCourt() {
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Court getFootballCourtInfo(int court_id) {


        Court court = null;
        try
        {
        Class.forName("com.mysql.jdbc.Driver"); //load driver
        Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
        

        PreparedStatement pstmt=null; //create statement
        


        
        String query = "select court.name as court_name, sport.name as sport_name, surface.name as surface_name, users.name as club_name, users.street, users.idusers as idusers, municipality.mun_name, football_court.size " +  
                        "from court, sport, surface, municipality, sportscl_users, users, football_court "+ 
                        "where court.sportsclub_id = sportscl_users.id and sportscl_users.id = users.idusers and court.surface_id = surface.surface_id and users.munic_id = municipality.mun_id and court.sport_id = sport.sport_id and  court.court_id = football_court.court_id and court.court_id = ? ";

        
        pstmt=con.prepareStatement(query); //sql select query
        pstmt.setInt(1, court_id);
        
    
        
        ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
          
        
        while(rs.next())
        {
            
            
            int club_id  = rs.getInt("idusers");
            String court_name = rs.getString("court_name");
            String sport_name = rs.getString("sport_name");
            String surface_name = rs.getString("surface_name");
            String club_name = rs.getString("club_name");
            String street = rs.getString("street");
            String town = rs.getString("mun_name");
            String size = rs.getString("size");

            
            




            //check which sport and create the equivalent object 
            //Construct the club object first

            

            SportsClub club = new SportsClub(club_id,club_name,street,town);
            court = new FootballCourt(court_name, sport_name,surface_name,size,club);
            


        }
        
        
        con.close(); //close connection	
        
    

        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
            System.out.println("eroorrr");
        }

        return court;
        

    }

    public FootballCourt(String name, String sport, String surface, String size, SportsClub club) {
        super(name, sport, surface, club);
        this.size = size;
    }

    public FootballCourt(int court_id, String name, String size) {
        super(court_id, name);
        this.size = size;
    }

    public FootballCourt(String size) {
        this.size = size;
    }


    
}