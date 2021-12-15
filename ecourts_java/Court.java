package ecourts_java;
import java.util.*;
import java.sql.*;

public class Court {
    private int court_id;
    private String name;
    private String sport;
    private int sportid;
    private String surface;
    private SportsClub club;
    private String size;
    private String doors;

    public int getCourt_id() {
        return court_id;
    }

    public void setCourt_id(int court_id) {
        this.court_id = court_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSport() {
        return sport;
    }

    public void setSport(String sport) {
        this.sport = sport;
    }

    public String getSurface() {
        return surface;
    }

    public void setSurface(String surface) {
        this.surface = surface;
    }

    public SportsClub getClub() {
        return club;
    }

    public void setClub(SportsClub club) {
        this.club = club;
    }

    public Court(String name, String sport, String surface, SportsClub club) {
        this.name = name;
        this.sport = sport;
        this.surface = surface;
        this.club = club;
    }
    public Court(int court_id, String name) {
        this.court_id = court_id;
        this.name = name;
    }
    public Court() {
    }

    public List<Court> getCourts_of_club(int club_id,int sport_id) {
        List<Court> court_list  = new ArrayList<Court>();
        try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement


            
            String query = "select distinct court.court_id, court.name from court, sportscl_users where court.sportsclub_id= ? ";
            
            if (sport_id!=0){
                query = query + " and court.sport_id  = ?";
            }

            pstmt=con.prepareStatement(query); //sql select query 
            pstmt.setInt(1, club_id);
            
            if (sport_id!=0){
                pstmt.setInt(2, sport_id);
            } 
            
        
            
            ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
              
            
            while(rs.next())
            {
                
                
                int crt_id = rs.getInt("court_id");
                String court_name = rs.getString("name");

                Court crt = new Court(crt_id,court_name);
                court_list.add(crt);
    
    
    
            }
            
            pstmt.close();
            con.close(); //close connection	
            
        
            }
            catch(Exception e)
            {
                System.out.println(e.getMessage());
                System.out.println("eroorrr");
            }
    
            return court_list;
    
        }

        public Court getCourtDetails(int court_id ) {
            Court court = null;
        try
        {
        Class.forName("com.mysql.jdbc.Driver"); //load driver
        Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
        

        PreparedStatement pstmt=null; //create statement
        


        
        String query = "select court.name as court_name, sport.name as sport_name, surface.name as surface_name, users.name as club_name, users.street, users.idusers as idusers, municipality.mun_name, sport.sport_id " +  
                        "from court, sport, surface, municipality, sportscl_users, users "+ 
                        "where court.sportsclub_id = sportscl_users.id and sportscl_users.id = users.idusers and court.surface_id = surface.surface_id and users.munic_id = municipality.mun_id and court.sport_id = sport.sport_id and court.court_id = ? ";

        
        pstmt=con.prepareStatement(query); //sql select query
        pstmt.setInt(1, court_id);
        
    
        
        ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
          
        
        while(rs.next())
        {
            
            
            int club_id  = rs.getInt("idusers");
            int sport_id = rs.getInt("sport_id");
            String court_name = rs.getString("court_name");
            String sport_name = rs.getString("sport_name");
            String surface_name = rs.getString("surface_name");
            String club_name = rs.getString("club_name");
            String street = rs.getString("street");
            String town = rs.getString("mun_name");

            
            




            //check which sport and create the equivalent object 
            //Construct the club object first

            

            SportsClub club = new SportsClub(club_id,club_name,street,town);
            court = new Court(court_name, sport_name,sport_id,surface_name,club);
            


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

        public Court(String name, String sport, int sportid, String surface, SportsClub club) {
            this.name = name;
            this.sport = sport;
            this.sportid = sportid;
            this.surface = surface;
            this.club = club;
        }

        public int getSportid() {
            return sportid;
        }

        public void setSportid(int sportid) {
            this.sportid = sportid;
        }


        public Court getFootballCourtInfo(int court_id) {


            Court court = null;
            try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            
    
    
            
            String query = "select court.name as court_name, sport.name as sport_name, surface.name as surface_name, users.name as club_name, users.street, users.idusers as idusers, municipality.mun_name, football_court.size, sport.sport_id " +  
                            "from court, sport, surface, municipality, sportscl_users, users, football_court "+ 
                            "where court.sportsclub_id = sportscl_users.id and sportscl_users.id = users.idusers and court.surface_id = surface.surface_id and users.munic_id = municipality.mun_id and court.sport_id = sport.sport_id and  court.court_id = football_court.court_id and court.court_id = ? ";
    
            
            pstmt=con.prepareStatement(query); //sql select query
            pstmt.setInt(1, court_id);
            
        
            
            ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
              
            
            while(rs.next())
            {
                
                
                int club_id  = rs.getInt("idusers");
                int sport_id = rs.getInt("sport_id");
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
                court = new Court(court_name, sport_name,sport_id,surface_name,club, size);
                
    
    
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
    
        
        public Court getTennisCourtInfo(int court_id) {
        
            Court court = null;
            try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            
    
    
            
            String query = "select court.name as court_name, sport.name as sport_name, surface.name as surface_name, users.name as club_name, users.street, users.idusers as idusers, municipality.mun_name, tennis_court.doors, sport.sport_id " +  
                            "from court, sport, surface, municipality, sportscl_users, users, tennis_court "+ 
                            "where court.sportsclub_id = sportscl_users.id and sportscl_users.id = users.idusers and court.surface_id = surface.surface_id and users.munic_id = municipality.mun_id and court.sport_id = sport.sport_id and  court.court_id = tennis_court.court_id and court.court_id = ? ";
    
            
            pstmt=con.prepareStatement(query); //sql select query
            pstmt.setInt(1, court_id);
            
        
            
            ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
              
            
            if(rs.next())
            {
                
                
                int club_id  = rs.getInt("idusers");
                int sport_id = rs.getInt("sport_id");
                String court_name = rs.getString("court_name");
                String sport_name = rs.getString("sport_name");
                String surface_name = rs.getString("surface_name");
                String club_name = rs.getString("club_name");
                String street = rs.getString("street");
                String town = rs.getString("mun_name");
                String doors = rs.getString("doors");
                
    
                //check which sport and create the equivalent object 
                //Construct the club object first
                SportsClub club = new SportsClub(club_id,club_name,street,town);
                court = new Court(court_name, sport_name,sport_id, surface_name,doors,club);
            }
            
            
            
            con.close(); //close connection	
            
        
    
            }
            catch(Exception e)
            {
                System.out.println(e.getMessage());
                System.out.println("eroorrr in the method");
            }
    
            return court;
        }

        public String getSize() {
            return size;
        }

        public void setSize(String size) {
            this.size = size;
        }

        public String getDoors() {
            return doors;
        }

        public void setDoors(String doors) {
            this.doors = doors;
        }

        public Court(String name, String sport, int sportid, String surface, String doors,SportsClub club
                ) {
            this.name = name;
            this.sport = sport;
            this.sportid = sportid;
            this.surface = surface;
            this.club = club;
            this.doors = doors;
        }
        public Court(String name, String sport, int sportid, String surface, SportsClub club, String size
                ) {
            this.name = name;
            this.sport = sport;
            this.sportid = sportid;
            this.surface = surface;
            this.club = club;
            this.size = size;
        }
    


    
}