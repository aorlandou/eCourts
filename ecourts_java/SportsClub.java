package ecourts_java;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.xml.crypto.dsig.spec.ExcC14NParameterSpec;

import java.sql.*;

public class SportsClub extends User{
    
    private String owners_name;
    private int numofcourts;
    private String linephone;
    private String about;
    private int id;
    public int getNumofcourts() {
        return numofcourts;
    }

    public void setNumofcourts(int numofcourts) {
        this.numofcourts = numofcourts;
    }

    public String getLinephone() {
        return linephone;
    }

    public void setLinephone(String linephone) {
        this.linephone = linephone;
    }

    public String getOwners_name() {
        return owners_name;
    }

    public void setOwners_name(String owners_name) {
        this.owners_name = owners_name;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public SportsClub(String name,  String email, String phone, String street, String town, String street_number, String zip_code, String password, String register_date,
     String owners_name, int numofcourts, String linephone, String about) {
        
        super(name, email, phone, street, town, street_number, zip_code, password, register_date);
        this.owners_name = owners_name;
        this.numofcourts = numofcourts;
        this.linephone = linephone;
        this.about = about;
    }

    public SportsClub(String name, String street, String town){
        super(name, street, town);
    }

    public SportsClub(int user_id, String email, String phone, String name, String street, int munic_id, String zip_code,int num_courts, String linephone, String about){
        super(user_id, email, phone, name, street, munic_id, zip_code);
        this.numofcourts = num_courts;
        this.linephone = linephone;
        this.about = about;
    }

    public SportsClub(){
        super();
    }

    public SportsClub(int id){
        this.id=id;
    }
    
    public SportsClub findClub (int clubid) throws Exception {
        DB data = new DB();
		Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT idusers, email, phone, name, street, munic_id, zipcode, num_courts, line_phone, about FROM users , sportscl_users WHERE id=idusers AND id=?";

		try {
            
            con = data.getConnection();
            stmt = con.prepareStatement(sql);

            // setting parameter
            stmt.setInt(1, clubid);

            rs = stmt.executeQuery();

            if ( !rs.next() ) {
                rs.close(); //closing ResultSet
                stmt.close(); //closing PreparedStatement
				return null;
            }

            SportsClub curClub = new SportsClub(rs.getInt("idusers"), rs.getString("email"), rs.getString("phone"), rs.getString("name"),
            rs.getString("street"), rs.getInt("munic_id"), rs.getString("zipcode"), rs.getInt("num_courts"), rs.getString("line_phone"), 
            rs.getString("about"));

            rs.close(); //closing ResultSet
            stmt.close(); //closing PreparedStatement
            data.closeConnection(); //closing Connection

            return curClub;

        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                data.closeConnection();
            } catch (Exception e) {
                
            }

        }
		
	}

    public int findID(String clname) throws Exception{
        DB data = new DB();
		Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT idusers FROM users WHERE type='1' AND name=?";

        try {
            
            con = data.getConnection();
            stmt = con.prepareStatement(sql);

            // setting parameter
            stmt.setString(1, clname);

            rs = stmt.executeQuery();

            if ( !rs.next() ) {
                rs.close(); //closing ResultSet
                stmt.close(); //closing PreparedStatement
				return 0;
            }
            int spid = rs.getInt("idusers");
            rs.close(); //closing ResultSet
            stmt.close(); //closing PreparedStatement
            data.closeConnection(); //closing Connection

            return spid;
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                data.closeConnection();
            } catch (Exception e) {
                
            }

        }

    }

    public String getMunicipalityName(int munic_id) throws Exception{
        DB data = new DB();
		Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT mun_name FROM municipality WHERE mun_id=?";

		try {
            
            con = data.getConnection();
            stmt = con.prepareStatement(sql);

            // setting parameter
            stmt.setInt(1, munic_id);

            rs = stmt.executeQuery();

            if ( !rs.next() ) {
                rs.close(); //closing ResultSet
                stmt.close(); //closing PreparedStatement
				return null;
            }

            String munName = rs.getString("mun_name");
            rs.close(); //closing ResultSet
            stmt.close(); //closing PreparedStatement
            data.closeConnection(); //closing Connection

            return munName;

        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                data.closeConnection();
            } catch (Exception e) {
                
            }

        }
    }

    public SportsClub(int user_id, String name, String street, String town, int munic_id) {
        super(user_id, name, street, town, munic_id);
    }
    



    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public List<SportsClub> popularClubs() throws Exception {
        
        List<SportsClub> club_list = new ArrayList<SportsClub>();

        DB data = new DB();
		Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT idusers FROM users where type = 1 limit 5";

		try {
            
            con = data.getConnection();
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();


            // setting parameter
            while(rs.next()){

                int club_id = rs.getInt("idusers");

                SportsClub spr = new SportsClub();
                SportsClub club = spr.findClub(club_id);
                club_list.add(club);

            }

            rs.close(); //closing ResultSet
            stmt.close(); //closing PreparedStatement
            data.closeConnection(); //closing Connection

            return club_list;

        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                data.closeConnection();
            } catch (Exception e) {
                
            }

        }
		
	}




}