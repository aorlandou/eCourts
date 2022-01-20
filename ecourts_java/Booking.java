package ecourts_java;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.*;




public class Booking {

    private int online_payment;
    private Customer customer;
    private String comment;
    private int slot_id;
    private int user_id;
    private java.sql.Date date_booked;
    private Time time_booked;
    private int booking_id;
    private Slot slot;
    private User user;
    


    public Booking(int online_payment, Customer customer) {
        this.online_payment = online_payment;
        this.customer = customer;
    }
    
    public Booking(int slot_id, int user_id){
        this.slot_id=slot_id;
        this.user_id=user_id;
    }

    public void setNotAvailable(int slot){
        ResultSet rs=null;
        DB data = new DB();
		Connection con = null;
        PreparedStatement stmt = null;       
        String sql = "UPDATE slot SET status=? WHERE slot_id=?";
        String sql2="SELECT * FROM slot WHERE slot_id=?";
        try {
            
            con = data.getConnection();
            stmt = con.prepareStatement(sql);

            // setting parameter
            stmt.setString(1,"BOOKED");
            stmt.setInt(2, slot);
           

           stmt.executeUpdate();
           stmt = con.prepareStatement(sql2);
           stmt.setInt(1, slot);
           rs=stmt.executeQuery();
           while(rs.next()){
             int court_id=rs.getInt("court_id");
             int duration=rs.getInt("duration");
             date_booked=rs.getDate("date");
             time_booked=rs.getTime("time_start");
             
             SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");

             if (duration==2){
                System.out.println("hi");
                Calendar cal = Calendar.getInstance();
                cal.setTime(time_booked);
                cal.add(Calendar.HOUR,1);
                String first = format.format(cal.getTime());               
                String sql3="UPDATE slot SET status=? WHERE court_id=? AND date=? AND (time_start=? OR time_start=?) AND NOT slot_id=? ;";
                stmt = con.prepareStatement(sql3);
                stmt.setString(1,"NOT AVAILABLE");
                stmt.setInt(2, court_id);
                stmt.setDate(3,date_booked);
                stmt.setString(4,first);
                stmt.setTime(5,time_booked);
                stmt.setInt(6,slot);
                stmt.executeUpdate();
             }else if (duration==1){
                
                String sql4="UPDATE slot SET status=? WHERE court_id=? AND date=? AND time_start=? AND NOT slot_id=?;";
                stmt = con.prepareStatement(sql4);
                stmt.setString(1,"NOT AVAILABLE");
                stmt.setInt(2, court_id);
                stmt.setDate(3,date_booked);
                stmt.setTime(4,time_booked);
                stmt.setInt(5,slot);
                stmt.executeUpdate();

             }
           }

           
          
        } catch (Exception e) {

            

        } finally {

            try {
                data.closeConnection();
            } catch (Exception e) {
                
            }

        }
    }

    public int makeBooking(int slot, int user, String comm, int pay){
        try

        {  
            ResultSet rs=null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            PreparedStatement pstmt=null;    
            pstmt=con.prepareStatement("SELECT * FROM slot WHERE slot_id=?;");
            pstmt.setInt(1,slot); 
            rs=pstmt.executeQuery();
            while(rs.next()){
                date_booked=rs.getDate("date");
                time_booked=rs.getTime("time_start");
                pstmt=con.prepareStatement("INSERT INTO booking(user_id,slot_id,date_booked,time_booked,online_payment,comment) VALUES (?,?,?,?,?,?);");
                pstmt.setInt(1,user);
                pstmt.setInt(2,slot);
                pstmt.setDate(3,date_booked);
                pstmt.setTime(4,time_booked);
                pstmt.setInt(5,pay);
                pstmt.setString(6,comm);
                pstmt.executeUpdate();
            }          
            
            pstmt=con.prepareStatement("select * from booking where slot_id=? ;");
            pstmt.setInt(1,slot);              
            rs=pstmt.executeQuery();
            int id=-1;
            while(rs.next()){
                id=rs.getInt("booking_id");
            }
            
            con.close(); 
            return  id;
                 
        }
        catch(Exception e)
        {
           
        System.out.println(e.getMessage());  
        return -1; 
               
        }

    }
    
    public Booking getBookingSlotDetails(int slot_id) {
        Booking bk = null;

        
        try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            


            
            String query = "select booking.online_payment, users.name, client_users.surname " +  
                            "from booking, client_users, users " + 
                            "where booking.user_id = users.idusers and users.idusers = client_users.id and booking.slot_id = ? ";

            pstmt=con.prepareStatement(query); //sql select query   
            pstmt.setInt(1, slot_id);
            ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.



            while(rs.next())
            {
                
                int online_payment = rs.getInt("online_payment");
                String name = rs.getString("name");
                String surname = rs.getString("surname");

                Customer cr = new Customer(name,surname);
                bk = new Booking(online_payment, cr);
                

            }
            
            
            con.close(); //close connection	
            
        

            }
            catch(Exception e)
            {
                System.out.println("eroorrr");
                System.out.println(e.getMessage());
                
            }
            return bk; 
    }

    public Booking() {
    }

 

  

    public int getOnline_payment() {
        return online_payment;
    }

    public void setOnline_payment(int online_payment) {
        this.online_payment = online_payment;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }


    public String getComment() {
        return this.comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getSlot_id() {
        return this.slot_id;
    }

    public void setSlot_id(int slot_id) {
        this.slot_id = slot_id;
    }

    public int getUser_id() {
        return this.user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public java.sql.Date getDate_booked() {
        return this.date_booked;
    }

    public void setDate_booked(java.sql.Date date_booked) {
        this.date_booked = date_booked;
    }

    public Time getTime_booked() {
        return this.time_booked;
    }

    public void setTime_booked(Time time_booked) {
        this.time_booked = time_booked;
    }

    public int getBooking_id() {
        return this.booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }
    
    public Booking upcomingBooking(int userid){

        Booking bk = null;
        try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            


            
            String query = "SELECT booking.booking_id, booking.online_payment, booking.slot_id  FROM booking, slot where booking.slot_id = slot.slot_id and slot.slot_id in (select * from slots_today UNION  select * from slots_after) and booking.user_id = ? order by slot.date asc, slot.time_start asc LIMIT 1";
                           
        
            pstmt=con.prepareStatement(query); //sql select query 
            pstmt.setInt(1, userid);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()){
                int booking_id = rs.getInt("booking_id");
                int slot_id = rs.getInt("slot_id");
                int paid = rs.getInt("online_payment");

                //call the method to get the slot details
                Slot slt = new Slot();
                List<Slot> slot_list= slt.getSlots(0, "", 0, slot_id, 0, 0, 0, "",0,0);
                //throws errors
                bk = new Booking(booking_id, paid, slot_list.get(0));

            }

            }catch(Exception e){
                System.out.println("eroorrr");
                System.out.println(e.getMessage());
            }
            return bk;
    }


    public List<Booking> bookingsHistory(int userid) {

        List<Booking> bookings_list = new ArrayList<Booking>(); 
        try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            


            
            String query = "SELECT booking.booking_id, booking.online_payment, booking.slot_id, slot.date, slot.time_start FROM booking, slot where booking.slot_id = slot.slot_id and slot.slot_id not in (select * from slots_after) and booking.user_id = ? order by slot.date desc, slot.time_start desc LIMIT 4;";
                           
        
            pstmt=con.prepareStatement(query); //sql select query 
            pstmt.setInt(1, userid);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){

                int booking_id = rs.getInt("booking_id");
                int slot_id = rs.getInt("slot_id");
                int paid = rs.getInt("online_payment");


                Slot slt = new Slot();
                List<Slot> slot_list= slt.getSlots(0, "", 0, slot_id, 0, 0, 0, "",1,0);
                Booking bk = new Booking(booking_id, paid, slot_list.get(0));
                bookings_list.add(bk);      

            }

            }catch(Exception e){
                System.out.println("eroorrr");
                System.out.println(e.getMessage());
            }
            return bookings_list;
    }


    public List<Booking> BookingsCalendar(int clubid, int courtid) {

        List<Booking> bookings_list = new ArrayList<Booking>(); 
        try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            


            
            String query = "SELECT booking.booking_id, booking.online_payment, slot.slot_id, users.name, client_users.surname FROM booking, slot, court, users, client_users where booking.slot_id = slot.slot_id and slot.court_id = court.court_id and booking.user_id = client_users.id and client_users.id = users.idusers ";
                           
            if(clubid != 0){
                query = query + " and court.sportsclub_id = ?";
            }
            
            if (courtid != 0){
                query = query + " and slot.court_id = ?";
            }
        
            pstmt=con.prepareStatement(query); //sql select query 
            if(clubid != 0){
                pstmt.setInt(1,clubid);
            }
            if (courtid !=0){
                pstmt.setInt(2,courtid);
            }
            System.out.println(query);


            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){

                int booking_id = rs.getInt("booking_id");
                int slot_id = rs.getInt("slot_id");
                int paid = rs.getInt("online_payment");
                String name = rs.getString("name");
                String surname = rs.getString("surname");

                Customer cr = new Customer(name, surname);

                Slot slt = new Slot();
                List<Slot> slot_list= slt.getSlots(0, "", 0, slot_id, 0, 0, 0, "",1,0);
                Booking bk = new Booking(booking_id, paid, slot_list.get(0), cr);
                bookings_list.add(bk);      

            }

            }catch(Exception e){
                System.out.println("eroorrr");
                System.out.println(e.getMessage());
            }
            return bookings_list;
    }



    public Booking(int booking_id, int paid, Slot slot) {
        this.booking_id = booking_id;
        this.online_payment = paid;
        this.slot = slot;
    }
    public Booking(int booking_id, int paid, Slot slot, Customer customer) {
        this.booking_id = booking_id;
        this.online_payment = paid;
        this.slot = slot;
        this.customer = customer;
    }

    public Booking(int booking_id, int paid, String comment ,Slot slot, User user, Customer customer) {
        this.booking_id = booking_id;
        this.online_payment = paid;
        this.comment = comment;
        this.slot = slot;
        this.user = user;
        this.customer = customer;
    }

    public Slot getSlot() {
        return slot;
    }

    public void setSlot(Slot slot) {
        this.slot = slot;
    }

    public Booking getBookingDetails(int bookingid) throws Exception {
        Booking bk = new Booking();
        try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement
            


            
            String query = "SELECT booking.online_payment, booking.comment, slot.slot_id, users.idusers FROM booking, slot, users, client_users where booking.slot_id = slot.slot_id and booking.user_id = client_users.id and client_users.id = users.idusers and booking.booking_id = ? ";
                           
            
        
            pstmt=con.prepareStatement(query); //sql select query 
            pstmt.setInt(1,bookingid);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()){

                int slot_id = rs.getInt("slot_id");
                int paid = rs.getInt("online_payment");
                int userid = rs.getInt("idusers");
                String comment = rs.getString("comment");

                
                
                User us = new User();
                User user = us.getDetails(userid);

                Customer cr = new Customer();
                Customer customer = cr.customerDetails(userid);

                Slot slt = new Slot();
                List<Slot> slot_list= slt.getSlots(0, "", 0, slot_id, 0, 0, 0, "",1,0);
                bk = new Booking(bookingid, paid,comment ,slot_list.get(0), user, customer);
                   

            }else{
                throw new Exception("No booking with that specific id");
            }

            }catch(Exception e){
                throw new Exception(e.getMessage());
            }
            return bk;
        
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }











}