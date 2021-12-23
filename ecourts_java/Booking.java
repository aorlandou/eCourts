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
    


    public Booking(int online_payment, Customer customer) {
        this.online_payment = online_payment;
        this.customer = customer;
    }
    
    public Booking(int slot_id, int user_id){
        this.slot_id=slot_id;
        this.user_id=user_id;
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
    
    
}