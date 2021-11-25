package ecourts_java;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class Slot {
    private int slot_id;
    private Date date;
    private Time time;
    private Double price;
    private Court court;
    

    public int getSlot_id() {
        return slot_id;
    }

    public void setSlot_id(int slot_id) {
        this.slot_id = slot_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Court getCourt() {
        return court;
    }

    public void setCourt(Court court) {
        this.court = court;
    }

    

    public Slot(int slot_id, Date date, Time time, Double price, Court court) {
        this.slot_id = slot_id;
        this.date = date;
        this.time = time;
        this.price = price;
        this.court = court;
        
    }
    public Slot() {
    }


    public List<Slot> getSlots(int sport, String date) {
        

            List<Slot> slot_list = new ArrayList<Slot>();
    
            try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement


            
            String query = "select slot.slot_id, slot.date, slot.time_start, slot.price, court.name as court_name, sport.name as sport_name, surface.name as surface_name, sportsclub.name as club_name, sportsclub.street, sportsclub.town from slot, court, sportsclub, sport, surface where slot.court_id = court.court_id and court.sportsclub_id = sportsclub.sportsclub_id and court.surface_id = surface.surface_id  and court.sport_id = sport.sport_id ";

            if(sport != 0){
                query = query + "and court.sport_id = ?";
            }
            
            if (date != ""){
                query = query + " and slot.date = ?";
            }
            System.out.println(query);


            
            pstmt=con.prepareStatement(query); //sql select query 
            pstmt.setInt(1,sport);
            if (date !=""){
                pstmt.setString(2,date);
            }
            
        
            
            ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
              
            
            while(rs.next())
            {
                
                
    
                int slot_id =rs.getInt("slot_id");
                Date date_slot = rs.getDate("date");
                Time time = rs.getTime("time_start");
                Double price = rs.getDouble("price");
                String court_name = rs.getString("court_name");
                String sport_name = rs.getString("sport_name");
                String surface_name = rs.getString("surface_name");
                String club_name = rs.getString("club_name");
                String street = rs.getString("street");
                String town = rs.getString("town");

                //Construct the club object first
                SportsClub club = new SportsClub(club_name,street,town);
                Court court = new Court(court_name, sport_name,surface_name,club);

                Slot slot = new Slot(slot_id,date_slot,time,price,court);
    
                
    
    
    
                slot_list.add(slot);
    
    
                
    
                
    
    
            }
            
            
            con.close(); //close connection	
        
      
       
      
            
            
          
            
          
        
        
            }
            catch(Exception e)
            {
                System.out.println(e.getMessage());
                System.out.println("eroorrr");
            }
    
            return slot_list;
    
        }

       
    
}