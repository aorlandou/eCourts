package ecourts_java;
import java.sql.*;

public class User{
    private int user_id;
    private String name;   
    private String email;
    private String phone;
    private String street;
    private String town;
    private String street_number;
    private String zip_code;
    private String password;
    private String register_date;
    private int munic_id;
  

    public User(String name,  String email, String phone, String street, String town, String street_number, String zip_code, String password, String register_date) {
        
        this.name = name;
     
        this.email = email;
        this.phone = phone;
        this.street = street;
        this.town = town;
        this.street_number = street_number;
        this.zip_code = zip_code;
        this.password = password;
        this.register_date = register_date;
        user_id=user_id +1;
    }
    
    public User(String name, String street, String town){
        this.name = name;
        this.street = street;
        this.town = town;
    }
    
    public User(int user_id, String email, String phone, String name, String street, int munic_id, String zip_code){
        this.user_id = user_id;
        this.email = email;
        this.phone = phone;
        this.name = name;
        this.street = street;
        this.munic_id = munic_id;
        this.zip_code = zip_code;
    }

    public User(int user_id, String email, String phone, String password, String street, String street_number, String zip_code, String town, String name){
        this.user_id = user_id;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.street = street;
        this.street_number = street_number;
        this.zip_code = zip_code;
        this.town=town;
        this.name=name;
    }

    public User(){
    }
    

    public User(String email, String password){
        this.email=email;
        this.password=password;
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


        public int checkPassword(String password, String email){
            try
            {   ResultSet rs=null;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
                PreparedStatement pstmt=null;    
                pstmt=con.prepareStatement("select * from users where (phone=? or email=?) and password=?;");
                pstmt.setString(1,email);  
                pstmt.setString(2,email);
                pstmt.setString(3,password);
                rs=pstmt.executeQuery();
                while (rs.next()){                              
                    return rs.getInt("idusers");
                }               
                con.close();             
            }catch(Exception e)
                {
                System.out.println(e.getMessage());
                
                return -1;
                }
               return -1;
            }
    
    public User getDetails(int userID) throws Exception{
        DB data = new DB();
		Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM users WHERE idusers=?";
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
            User curUser = new User (rs.getInt("idusers"), rs.getString("email"), rs.getString("phone"), rs.getString("name"),
            rs.getString("street"), rs.getInt("munic_id"), rs.getString("zipcode"));

            return curUser;
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                data.closeConnection();
            } catch (Exception e) {
                
            }

        }
    }


    public User editDetails(int userID) throws Exception{
        DB data = new DB();
		Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM users WHERE idusers=?";
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
            User curUser = new User (rs.getInt("idusers"), rs.getString("email"), rs.getString("phone"), rs.getString("password"),
            rs.getString("street"), rs.getString("street_number"), rs.getString("zipcode"),rs.getString("town"),rs.getString("name"));

            return curUser;
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                data.closeConnection();
            } catch (Exception e) {
                
            }

        }
    }


    public void editProfile(int userID, String email, String phone,String password, 
    String street, String street_number, String zipcode, String town) throws Exception{
        DB data = new DB();
		Connection con = null;
        PreparedStatement stmt = null;
       
        String sql = "UPDATE users SET email=?, phone=?, password=?, street=?, street_number=?, zipcode=?, town=? WHERE idusers=?";
        try {
            
            con = data.getConnection();
            stmt = con.prepareStatement(sql);

            // setting parameter
            stmt.setString(1, email);
            stmt.setString(2, phone);
            stmt.setString(3, password);
            stmt.setString(4, street);
            stmt.setString(5, street_number);
            stmt.setString(6, zipcode);
            stmt.setString(7, town);
            stmt.setInt(8, userID);

           stmt.executeUpdate();

           
          
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                data.closeConnection();
            } catch (Exception e) {
                
            }

        }
    }





    public  int getUser_id() {
        return user_id;
    }

    public int getMunic_id() {
        return munic_id;
    }

    public void setMunic_id(int munic_id) {
        this.munic_id = munic_id;
    }
 

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

  

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStreet() {
        return this.street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getTown() {
        return this.town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getStreet_number() {
        return this.street_number;
    }

    public void setStreet_number(String street_number) {
        this.street_number = street_number;
    }

    public String getZip_code() {
        return this.zip_code;
    }

    public void setZip_code(String zip_code) {
        this.zip_code = zip_code;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRegister_date() {
        return this.register_date;
    }

    public void setRegister_date(String register_date) {
        this.register_date = register_date;
    }

    public User(int user_id, String name, String street, String town) {
        this.user_id = user_id;
        this.name = name;
        this.street = street;
        this.town = town;
    }

    public User(String name) {
        this.name = name;
    }

    public User(int user_id, String name, String street, String town, int munic_id) {
        this.user_id = user_id;
        this.name = name;
        this.street = street;
        this.town = town;
        this.munic_id = munic_id;
    }





}
