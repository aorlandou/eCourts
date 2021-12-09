package ecourts_java;
import java.sql.*;

public class Customer extends User{
    private String date_birth;
    private String surname;
    private String username;


    public Customer(String name,String username, String surname, String email, String phone, 
    String street, String town, String street_number, String zip_code, String password, 
    String register_date, String date_birth) {
        super(name, email, phone, street, town, street_number, zip_code, password, register_date);
        this.date_birth = date_birth;
        this.surname=surname;
        this.username=username;

    }

    public Customer(){

    }

    public Customer(String surname, String username) {
        super();        
        this.surname=surname;
        this.username=username;

    }



    
    public String getDate_birth() {
        return this.date_birth;
    }
   

    public void setDate_birth(String date_birth) {
        this.date_birth = date_birth;
    }


    public Customer customerDetails(int userID) throws Exception{
        DB data = new DB();
		Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM client_users WHERE id=?";
        try {
            
            con = data.getConnection();
            stmt = con.prepareStatement(sql);

            // setting parameter
            stmt.setInt(1, userID);

            rs = stmt.executeQuery();

            if ( !rs.next() ) {
                rs.close(); //closing ResultSet
                stmt.close(); //closing PreparedStatement
				return null;
            }
            Customer curCustomer = new Customer ( rs.getString("surname"), rs.getString("username"));

            return curCustomer;
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                data.closeConnection();
            } catch (Exception e) {
                
            }

        }
    }

    

    public boolean checkEmail(String email){
        try
        {   ResultSet rs=null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6"); 

            PreparedStatement pstmt=null;
    
            pstmt=con.prepareStatement("select idusers from users where email=? ;");
            pstmt.setString(1,email);    
            rs=pstmt.executeQuery();
            int i=0;
            while (rs.next()){
                i=i+1;
            }
            if (i==0){
                con.close();
                return true;}               
            con.close();         
        }
        catch(Exception e)
        {
        System.out.println(e.getMessage());
        return false;
        }
        return false;
    }


    public boolean checkPhone(String phone){
        try
        {   ResultSet rs=null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            PreparedStatement pstmt=null;    
            pstmt=con.prepareStatement("select idusers from users where phone=? ;");
            pstmt.setString(1,phone);    
            rs=pstmt.executeQuery();
            int i=0;
            while (rs.next()){
                i=i+1;
            }
            con.close();
            if (i==0){
                
                return true;}               
                        
        }catch(Exception e)
            {
            System.out.println(e.getMessage());
            
            return false;
            }
            return false;
        }


        public int register(){
            try

            {  
                ResultSet rs=null;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
                PreparedStatement pstmt=null;    
                pstmt=con.prepareStatement("INSERT INTO users(email,phone,password,name,street,munic_id,zipcode,date_registered,type) VALUES (?,?,?,?,?,?,?,?,?);");
                pstmt.setString(1,super.getEmail());  
                pstmt.setString(2,super.getPhone());  
                pstmt.setString(3,super.getPassword());  
                pstmt.setString(4,super.getName());  
                pstmt.setString(5,super.getStreet());  
                pstmt.setInt(6,1);    
                pstmt.setString(7,super.getZip_code()); 
                pstmt.setString(8,super.getRegister_date());                 
                pstmt.setInt(9,0);    
                pstmt.executeUpdate();  
                pstmt=con.prepareStatement("select * from users where phone=? ;");
                pstmt.setString(1,super.getPhone()); 
                  
                rs=pstmt.executeQuery();
                
                while(rs.next()){              
                pstmt=con.prepareStatement("INSERT INTO client_users(id,surname,birthdate,username) VALUES (?,?,?,?);");
                pstmt.setInt(1,rs.getInt("idusers"));  
                pstmt.setString(2,this.getSurname());  
                pstmt.setString(3,this.getDate_birth());  
                pstmt.setString(4,this.getUsername());
                pstmt.executeUpdate();   
                } 
                con.close(); 
                return  rs.getInt("idusers");      
            }
            catch(Exception e)
            {
               
            System.out.println(e.getMessage());  
            return -1; 
                   
            }
  
        }
   

    public String getSurname() {
        return this.surname;
    }

    public String getUsername() {
        return this.username;
    }
    

}