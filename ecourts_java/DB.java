package ecourts_java;

// import com.mysql.jdbc.Statement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class DB {

	private final String dbServer = "195.251.249.131";
	private final String dbServerPort = "3306";
	private final String dbName = "ismgroup7";
	private final String dbusername = "ismgroup7";
	private final String dbpassword = "he2kt6";
	
	private Connection con = null;

	/**
	 * Establishes a connection with the database, initializes and returns the
	 * Connection object.
	 *
	 * @return Connection, the Connection object
	 * @throws Exception
	 */
	public Connection getConnection() throws Exception {

		try {

			// Dynamically load the driver's class file into memory
			Class.forName("com.mysql.jdbc.Driver").newInstance();

		} catch (Exception e) {

			throw new Exception("MySQL Driver error: " + e.getMessage());
		}

		/*
		 * Establish a connection with the database and initializes the Connection
		 * object (con)
		 */

		try {

			con = DriverManager.getConnection("jdbc:mysql://" + dbServer + ":" + dbServerPort + "/" + dbName,
					dbusername, dbpassword);
			// Step 3 -> returns the connection object
			return con;

		} catch (Exception e) {

			// throw Exception if any error occurs
			throw new Exception("Could not establish connection with the Database Server: " + e.getMessage());
		}
	} // End of getConnection

	/*
	 * this method closes the connection with the database
	 * 
	 */
	public void closeConnection() throws SQLException {

		try {

			// if connection is (still) open
			if (con != null)
				con.close(); // close the connection to the database to end database session

		} catch (SQLException e) {

			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		}

	}// end of closeConnection

	
	/*
	 * this method will delete an account from our database
	 */
	public void deleteAcc(String phone) throws Exception {
		DB database = new DB();
		try {
			Connection con = database.getConnection();
			String SQL = "DELETE FROM account WHERE phone = ?";
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, phone);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new Exception("Could not delete account from the database: " + e.getMessage());
		}
		try {
			database.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// end of deleteAcc

		/* get municipality from DataBase method */
	public String getMunicipality(String phone) {
		DB database = new DB();
		Statement statement = null;
		ResultSet results = null;
		String mun = "nothing returned"; // municipality
		String municipality = null;
		String SQL = "SELECT municipality FROM account WHERE phone = ?";
		PreparedStatement pstmt;
		try {
			Connection con = database.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, phone);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				mun = rs.getString("municipality");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			database.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mun;
	}// end of getMunicipality


	/* get notifications from DataBase and insert them in a list method */
	public List<String> getNotifications(String phone) {
		DB database = new DB();
		List<String> notifications = new ArrayList<String>();
		Statement statement = null;
		ResultSet results = null;
		String not = "nothing returned";
		String notification = null;
		String SQL = "SELECT notification FROM notification WHERE phone = ?";
		PreparedStatement pstmt = null;
		
			Connection con = null;
			try {
				con = database.getConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				pstmt = con.prepareStatement(SQL);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				pstmt.setString(1, phone);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ResultSet rs = null;
			try {
				rs = pstmt.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				while (rs.next()) {
					not = rs.getString("notification");
					notifications.add(not);
				 
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//end of getNotifications
		return notifications;
	}
		
		public List<String> getFriends( String phone) {
			DB database= new DB();
			List<String> friendList= new ArrayList<String>();
			Statement statement = null;
			ResultSet results = null;
			String not = "nothing returned";
			String friends = null;
			String SQL ="SELECT friendphone FROM  friends WHERE phone = ?";
			PreparedStatement pstmt;
			try {
				Connection con = database.getConnection();
				pstmt = con.prepareStatement(SQL);
				pstmt.setString(1,phone);
			    ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					not = rs.getString("friendphone");
					friendList.add(not);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		try {
			database.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return friendList;
	}// end of getNotifications

	

	
	public void insertFriend(String phone, String friendphone) {

		DB database = new DB();
		Connection con = null;
		try {
			con = database.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String SQL = "INSERT INTO friends (phone, friendphone)" + "VALUES(?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(SQL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstmt.setString(1, phone);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstmt.setString(2, friendphone);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			int row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				
		try {
			database.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
	
