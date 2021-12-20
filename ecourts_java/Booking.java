package ecourts_java;
import java.sql.*;
import java.util.*;

public class Booking {

    private int online_payment;
    private Customer customer;

    public Booking(int online_payment, Customer customer) {
        this.online_payment = online_payment;
        this.customer = customer;
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

    
    
}