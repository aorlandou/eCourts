package ecourts_java;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.*;


public class Slot {
    private int slot_id;
    private String date;
    private String time;
    private Double price;
    private int duration;
    private Court court;
    

    public int getSlot_id() {
        return slot_id;
    }

    public void setSlot_id(int slot_id) {
        this.slot_id = slot_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }


    public Court getCourt() {
        return court;
    }

    public void setCourt(Court court) {
        this.court = court;
    }

    

    public Slot(int slot_id, String date, String time, Double price, Court court) {
        this.slot_id = slot_id;
        this.date = date;
        this.time = time;
        this.price = price;
        this.court = court;
        
    }
    public Slot(int slot_id, String date, String time, Double price, int duration, Court court) {
        this.slot_id = slot_id;
        this.date = date;
        this.time = time;
        this.price = price;
        this.duration = duration;
        this.court = court;
    }

    
    public Slot() {
    }


    public List<Slot> getSlots(int sport, String date, int municipality, int slot_id_param, int club_id_param, int court_id, int duration_param, String time_param) {
        

            List<Slot> slot_list = new ArrayList<Slot>();
    
            try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            


            
            String query = "select slot.slot_id, slot.date, slot.time_start, slot.price, slot.duration, court.name as court_name, sport.name as sport_name, surface.name as surface_name, users.name as club_name, users.street, users.idusers as idusers, municipality.mun_name " +  
                            "from slot, court, sport, surface, municipality, sportscl_users, users "+ 
                            "where slot.court_id = court.court_id and court.sportsclub_id = sportscl_users.id and sportscl_users.id = users.idusers and court.surface_id = surface.surface_id and users.munic_id = municipality.mun_id and court.sport_id = sport.sport_id and slot_id in (select * from slots_today UNION  select * from slots_after)";

            if(sport != 0){
                query = query + "and court.sport_id = ?";
            }
            
            if (date != ""){
                query = query + " and slot.date = ?";
            }
            if (municipality != 0){
                query = query + " and users.munic_id  = ?";
            }
            if (slot_id_param != 0){
                query = query + " and slot.slot_id  = ?";
            }
            if (club_id_param != 0){
                query = query + " and users.idusers  = ?";
            }
            if (court_id != 0){
                query = query + " and court.court_id  = ?";
            }
            if (duration_param != 0){
                query = query + " and slot.duration  = ?";
            }
            if (time_param != ""){
                query = query + " and hour(slot.time_start) >= hour(?)-1 and  hour(slot.time_start) <= hour(?)+3 ";
            }
            
            query = query + " order by slot.date, slot.time_start ";

            
            pstmt=con.prepareStatement(query); //sql select query 
            
            int param_num = 1;
            if(sport != 0){
                pstmt.setInt(param_num,sport);
                param_num = param_num +1;
            }
            if (date !=""){
                pstmt.setString(param_num,date);
                param_num = param_num +1;
            }
            if (municipality != 0){
                pstmt.setInt(param_num,municipality);
                param_num = param_num +1;
            }
            if (slot_id_param != 0){
                pstmt.setInt(param_num,slot_id_param);
                param_num = param_num +1;
            }
            if (club_id_param != 0){
                pstmt.setInt(param_num,club_id_param);
                param_num = param_num +1;
            }
            if (court_id != 0){
                pstmt.setInt(param_num,court_id);
                param_num = param_num +1;
            }
            if (duration_param != 0){
                pstmt.setInt(param_num,duration_param);
                param_num = param_num +1;
            }
            if (time_param != ""){
                pstmt.setString(param_num,time_param);
                param_num = param_num +1;
                pstmt.setString(param_num,time_param);
            }
            
        
            
            ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
              
            
            while(rs.next())
            {
                
                
                int club_id  = rs.getInt("idusers");
                int duration = rs.getInt("duration");
                int slot_id =rs.getInt("slot_id");
                java.sql.Date date_slot = rs.getDate("date");
                Time time = rs.getTime("time_start");
                Double price = rs.getDouble("price");
                String court_name = rs.getString("court_name");
                String sport_name = rs.getString("sport_name");
                String surface_name = rs.getString("surface_name");
                String club_name = rs.getString("club_name");
                String street = rs.getString("street");
                String town = rs.getString("mun_name");

                //format the date and time variables
                String pattern = "dd-MM-yyyy";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                String date_as_string = simpleDateFormat.format(date_slot);
                
                
                String new_time = time.toString().substring(0,5);


                //Construct the club object first
                SportsClub club = new SportsClub(club_id,club_name,street,town);
                Court court = new Court(court_name, sport_name,surface_name,club);

                Slot slot = new Slot(slot_id,date_as_string,new_time,price,duration,court);
    
                
    
    
    
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