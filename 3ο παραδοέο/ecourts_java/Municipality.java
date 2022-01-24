package ecourts_java;
import java.sql.*;
import java.util.*;

public class Municipality {
    private int munic_id;
    private String mun_name;

    public int getMunic_id() {
        return munic_id;
    }

    public void setMunic_id(int munic_id) {
        this.munic_id = munic_id;
    }

    public String getMun_name() {
        return mun_name;
    }

    public void setMun_name(String mun_name) {
        this.mun_name = mun_name;
    }

    public List<Municipality> getMunicipalies_with_clubs() {

        List<Municipality> mun_list = new ArrayList<Municipality>();
    
            try
            {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup7","ismgroup7","he2kt6");
            
    
            PreparedStatement pstmt=null; //create statement


            
            String query = "select  distinct municipality.mun_id, municipality.mun_name from municipality,users where users.munic_id = municipality.mun_id and users.type = 1;";
            pstmt=con.prepareStatement(query); //sql select query 
            
            ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
              
            
            while(rs.next())
            {
                
                
                int mun_id  = rs.getInt("mun_id");
                String mun_name = rs.getString("mun_name");
                
                Municipality mun = new Municipality(mun_id,mun_name);
                mun_list.add(mun);

            }
            
            
            con.close(); //close connection	

        
            }
            catch(Exception e)
            {
                System.out.println(e.getMessage());
                System.out.println("eroorrr");
            }
    
            return mun_list;
    
    }

    public Municipality(int munic_id, String mun_name) {
        this.munic_id = munic_id;
        this.mun_name = mun_name;
    }

    public Municipality() {
    }
}