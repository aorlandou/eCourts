package ecourts_java;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.*;


public class Slot {
    private int slot_id;
    private String date;
    private String time;
    private Double price;
    private int duration;
    private Court court;
    private int court_id;
    private Booking booking;
    private String status;

    
    public int getCourt_id() {
        return this.court_id;
    }

    public void setCourt_id(int court_id) {
        this.court_id = court_id;
    }
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

    


    
    public Slot(int slot_id, String date, String time, Double price, int duration, Court court) {
        this.slot_id = slot_id;
        this.date = date;
        this.time = time;
        this.price = price;
        this.duration = duration;
        this.court = court;
    }

    public Slot(int slot_id, String date, String time, Double price, int duration, int court_id) {
        this.slot_id = slot_id;
        this.date = date;
        this.time = time;
        this.price = price;
        this.duration = duration;
        this.court_id = court_id;
    }

    
    public Slot() {
    }


    public Slot getSlot_by_id(int id){
        DB data = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM slot WHERE slot_id=?";
        Slot curSlot;
        try {                
            con = data.getConnection();
            stmt = con.prepareStatement(sql);        
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            while(rs.next()){            
            java.sql.Date date_slot = rs.getDate("date");
            Time time = rs.getTime("time_start");
            String pattern = "dd-MM-yyyy";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String date_as_string = simpleDateFormat.format(date_slot);            
            String new_time = time.toString().substring(0,5);
            curSlot= new Slot(rs.getInt("slot_id"), date_as_string, new_time, rs.getDouble("price"), rs.getInt("duration"), rs.getInt("court_id"));
            rs.close(); //closing ResultSet
            stmt.close(); //closing PreparedStatement
            return curSlot;
        }
        rs.close(); //closing ResultSet
        stmt.close(); //closing PreparedStatement
        return null;
        }catch (Exception e) {
    
            System.out.println(e.getMessage());

        } finally {

            try {
                data.closeConnection();
            } catch (Exception e) {
                
            }

        }
        return null;
    }


    public List<Slot> getSlots(int sport, String date, int municipality, int slot_id_param, int club_id_param, int court_id, int duration_param, String time_param) {
        

            List<Slot> slot_list = new ArrayList<Slot>();
    
            try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            


            
            String query = "select slot.slot_id, slot.date, slot.time_start, slot.price, slot.duration, court.sport_id, court.court_id " +  
                            "from slot, court, sportscl_users, municipality, users, surface, sport  " + 
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
                
                
                int court_id_1 = rs.getInt("court_id");
                int sid = rs.getInt("sport_id");
                int duration = rs.getInt("duration");
                int slot_id =rs.getInt("slot_id");
                java.sql.Date date_slot = rs.getDate("date");
                Time time = rs.getTime("time_start");
                Double price = rs.getDouble("price");

                //format the date and time variables
                String pattern = "dd-MM-yyyy";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                String date_as_string = simpleDateFormat.format(date_slot);
                
                
                String new_time = time.toString().substring(0,5);




                //check which sport and create the equivalent object 
                //Construct the club object first
                Slot slot = null;
                System.out.println(sid);
                System.out.println(court_id_1);

                if (sid== 2)
                {
                    Court c = new Court();
                    Court court =  c.getFootballCourtInfo(court_id_1);
                    System.out.println(court.getName());
                    slot = new Slot(slot_id,date_as_string,new_time,price,duration,court);
                    System.out.println(slot.getCourt().getSize());


                } else if (sid ==1){

                    Court tn = new Court();
                    Court court = tn.getTennisCourtInfo(court_id_1);
                    System.out.println(court.getName());
                    slot = new Slot(slot_id,date_as_string,new_time,price,duration,court);
                    System.out.println(slot.getCourt().getName());
                    System.out.println(slot.getCourt().getDoors());


                }else{
                    Court cr = new Court();
                    Court court = cr.getCourtDetails(court_id_1);
                    slot = new Slot(slot_id,date_as_string,new_time,price,duration,court);

                }


                slot_list.add(slot);

            }
            
            
            con.close(); //close connection	
        

            }
            catch(Exception e)
            {
                System.out.println("eroorrr");
                System.out.println(e.getMessage());
                
            }
            
            return slot_list;
    
        }

        
        public void generateAllSlots(String time_from, String time_to,String date, int court_id, Double price){
            

            SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");  

            java.util.Date d1 = null;
            java.util.Date d2 = null;
            try {
                d1 = format.parse(time_from);
                d2 = format.parse(time_to);
            } catch (ParseException e) {
                e.printStackTrace();
            }    
            Calendar cal = Calendar.getInstance();
            cal.setTime(d1);

            long diff = d2.getTime() - d1.getTime();
            long  diffHours = diff / (60 * 60 * 1000);

            for (int i = 0; i < diffHours; i++){

                //add the 2h slot
                if (i < diffHours-1){
                    try
                    {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver
                    Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
                    PreparedStatement pstmt=null; //create statement

                    String query = "insert into slot (date, time_start, court_id, status, date_added, price, duration) values (?,?,?, 'AVAILABLE', CURDATE(), ?, 2 )";
                    pstmt=con.prepareStatement(query); //sql select query 

                    pstmt.setString(1, date);
                    pstmt.setString(2, time_from);
                    pstmt.setInt(3, court_id);
                    pstmt.setDouble(4, price);
                    
                    pstmt.execute(); // execute query and store in resultset object rs.
                    con.close(); //close connection	

                    }
                    catch(Exception e)
                    {
                        System.out.println(e.getMessage());
                        System.out.println("eroorrr");
                    }

                }

                try
                    {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver
                    Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
                    PreparedStatement pstmt=null; //create statement

                    String query = "insert into slot (date, time_start, court_id, status, date_added, price, duration) values (?,?,?, 'AVAILABLE', CURDATE(), ?, 1     )";
                    pstmt=con.prepareStatement(query); //sql select query 

                    pstmt.setString(1, date);
                    pstmt.setString(2, time_from);
                    pstmt.setInt(3, court_id);
                    pstmt.setDouble(4, price);
                    
                    pstmt.execute(); // execute query and store in resultset object rs.
                    con.close(); //close connection	

                    }
                    catch(Exception e)
                    {
                        System.out.println(e.getMessage());
                        System.out.println("eroorrr");
                    }



                
                cal.add(Calendar.HOUR, 1);
                time_from = format.format(cal.getTime());
                


                
                
                
                



            }

        }

    
        

        public List<Slot> getSlotsManaging(int club_id){

            List<Slot> slot_list = new ArrayList<Slot>();
    
            try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            


            
            String query = "select slot.slot_id, slot.date, slot.time_start ,slot.duration, slot.status, court.name as court_name, sport.name as sport_name " +  
                            "from slot, court, sport " + 
                            "where slot.court_id = court.court_id and court.sport_id = sport.sport_id and court.sportsclub_id = ?";
            
            query = query + " order by slot.date, slot.time_start ";
            pstmt=con.prepareStatement(query); //sql select query   
            pstmt.setInt(1, club_id);
            ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
              
            
            while(rs.next())
            {
                
                
                int slot_id = rs.getInt("slot_id");
                java.sql.Date date_slot = rs.getDate("date");
                Time time = rs.getTime("time_start");
                int duration = rs.getInt("duration");
                String status = rs.getString("status");
                String court_name = rs.getString("court_name");
                String sport_name = rs.getString("sport_name");


                //format the date and time variables
                String pattern = "dd-MM-yyyy";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                String date_as_string = simpleDateFormat.format(date_slot);
                String new_time = time.toString().substring(0,5);


                Slot slt = null;

                //check which sport and create the equivalent object 
                //Construct the club object first
                Court crt = new Court(court_name, sport_name);
                
                
                if (status.equals("BOOKED")){ //get the booking details in a booking object
                    Booking bk = new Booking();
                    Booking booking = bk.getBookingSlotDetails(slot_id);
                    slt = new Slot(slot_id,date_as_string, new_time,duration,status,crt, booking);
                }else{
                    slt = new Slot(slot_id,date_as_string, new_time,duration,status,crt);
                }
                


                slot_list.add(slt);

            }
            
            
            con.close(); //close connection	
        

            }
            catch(Exception e)
            {
                System.out.println("eroorrr");
                System.out.println(e.getMessage());
                
            }

            return slot_list;

        }

        public Slot(int slot_id, String date, String time, int duration,String status, Court court) {
            this.slot_id = slot_id;
            this.date = date;
            this.time = time;
            this.duration = duration;
            this.status = status;
            this.court = court;
        }

        public Slot(int slot_id, String date, String time, int duration, String status ,Court court, Booking booking) {
            this.slot_id = slot_id;
            this.date = date;
            this.time = time;
            this.duration = duration;
            this.status = status;
            this.court = court;
            this.booking = booking;
        }

        public Booking getBooking() {
            return booking;
        }

        public void setBooking(Booking booking) {
            this.booking = booking;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }



        public List<Slot> getSlotsCalendar(int sport, String date, int municipality, int slot_id_param, int club_id_param, int court_id, int duration_param, String time_param) {
        

            List<Slot> slot_list = new ArrayList<Slot>();
    
            try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            


            
            String query = "select slot.slot_id, slot.date, slot.time_start, slot.price, slot.duration, court.sport_id, court.court_id " +  
                            "from slot, court, sportscl_users, municipality, users, surface, sport  " + 
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
                
                
                int court_id_1 = rs.getInt("court_id");
                int sid = rs.getInt("sport_id");
                int duration = rs.getInt("duration");
                int slot_id =rs.getInt("slot_id");
                java.sql.Date date_slot = rs.getDate("date");
                Time time = rs.getTime("time_start");
                Double price = rs.getDouble("price");

                //format the date and time variables
               
                
                





                //check which sport and create the equivalent object 
                //Construct the club object first
                Slot slot = null;
                System.out.println(sid);
                System.out.println(court_id_1);

                if (sid== 2)
                {
                    Court c = new Court();
                    Court court =  c.getFootballCourtInfo(court_id_1);
                    System.out.println(court.getName());
                    slot = new Slot(slot_id,date_slot.toString(),time.toString(),price,duration,court);
                    System.out.println(slot.getCourt().getSize());


                } else if (sid ==1){

                    Court tn = new Court();
                    Court court = tn.getTennisCourtInfo(court_id_1);
                    System.out.println(court.getName());
                    slot = new Slot(slot_id,date_slot.toString(),time.toString(),price,duration,court);
                    System.out.println(slot.getCourt().getName());
                    System.out.println(slot.getCourt().getDoors());


                }else{
                    Court cr = new Court();
                    Court court = cr.getCourtDetails(court_id_1);
                    slot = new Slot(slot_id,date_slot.toString(),time.toString(),price,duration,court);

                }


                slot_list.add(slot);

            }
            
            
            con.close(); //close connection	
        

            }
            catch(Exception e)
            {
                System.out.println("eroorrr");
                System.out.println(e.getMessage());
                
            }
            
            return slot_list;
    
        }


        public Slot SlotDetails(int slid) {
            
            Slot slot = null;
            try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement 
            String query = "SELECT * from slot where slot.slot_id = ?";
                           
        
            pstmt=con.prepareStatement(query); //sql select query 
            pstmt.setInt(1, slid);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()){
               

                int court_id_1 = rs.getInt("court_id");
                int sid = rs.getInt("sport_id");
                int duration = rs.getInt("duration");
                int slot_id =rs.getInt("slot_id");
                java.sql.Date date_slot = rs.getDate("date");
                Time time = rs.getTime("time_start");
                Double price = rs.getDouble("price");

                //format the date and time variables
                String pattern = "dd-MM-yyyy";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                String date_as_string = simpleDateFormat.format(date_slot);
                
                
                String new_time = time.toString().substring(0,5);




                //check which sport and create the equivalent object 
                //Construct the club object first

                System.out.println(sid);
                System.out.println(court_id_1);

                if (sid== 2)
                {
                    Court c = new Court();
                    Court court =  c.getFootballCourtInfo(court_id_1);
                    System.out.println(court.getName());
                    slot = new Slot(slot_id,date_as_string,new_time,price,duration,court);
                    System.out.println(slot.getCourt().getSize());


                } else if (sid ==1){

                    Court tn = new Court();
                    Court court = tn.getTennisCourtInfo(court_id_1);
                    System.out.println(court.getName());
                    slot = new Slot(slot_id,date_as_string,new_time,price,duration,court);
                    System.out.println(slot.getCourt().getName());
                    System.out.println(slot.getCourt().getDoors());


                }else{
                    Court cr = new Court();
                    Court court = cr.getCourtDetails(court_id_1);
                    slot = new Slot(slot_id,date_as_string,new_time,price,duration,court);

                }


            }

            }catch(Exception e){
                System.out.println("eroorrr");
                System.out.println(e.getMessage());
            }
            return slot;
    }
        

       
    
}