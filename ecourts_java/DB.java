package ecourts_java;

// import com.mysql.jdbc.Statement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;


public class DB {

	private final String dbServer = "127.0.0.1";
	private final String dbServerPort = "3306";
	private final String dbName = "account";
	private final String dbusername = "exception";
	private final String dbpassword = "123";
	
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
	 * this method will insert an account to our database
	 * 
	 */
	// public void insertAcc(Account ac) throws Exception {
	// 	try {
	// 		DB database = new DB();
	// 		Connection con = database.getConnection();
	// 		String SQL = "INSERT INTO account(phone, name, surname, password, " + "municipality, gender, birthdate) "
	// 				+ "VALUES(?,?,?,?,?,?,?)";
	// 		PreparedStatement pstmt = con.prepareStatement(SQL);

	// 		pstmt.setString(1, ac.getPhone());
	// 		pstmt.setString(2, ac.getName());
	// 		pstmt.setString(3, ac.getSurname());
	// 		pstmt.setString(4, ac.getPassword());
	// 		pstmt.setString(5, ac.getMunicipality());
	// 		pstmt.setString(6, ac.getGender());
	// 		pstmt.setString(7, ac.getBirthdate());

	// 		pstmt.executeUpdate();
	// 		JOptionPane.showMessageDialog(null, "Your profile has been created!");
			
	// 		database.closeConnection();
	// 	} catch (Exception e) {
	// 		throw new Exception("Could not insert account to the database: " + e.getMessage());
	// 	}

	// }// end of insertAcc

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

	/* get password from DataBase method */
	public String getPassword(String phone) {
		DB database = new DB();
		Statement statement = null;
		ResultSet results = null;
		String pass = "nothing returned";
		String password = null;
		String SQL = "SELECT password FROM account WHERE phone = ?";
		PreparedStatement pstmt;
		try {
			Connection con = database.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, phone);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				pass = rs.getString("password");
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
		return pass;
	}

	/* get name from DataBase method */
	public String getName(String phone) {
		DB database = new DB();
		Statement statement = null;
		ResultSet results = null;
		String nm = "nothing returned"; // name
		String name = null;
		String SQL = "SELECT name FROM account WHERE phone = ?";
		PreparedStatement pstmt;
		try {
			Connection con = database.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, phone);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				nm = rs.getString("name");
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
		return nm;
	}// end of getName

	/* get surname from DataBase method */
	public String getSurname(String phone) {
		DB database = new DB();
		Statement statement = null;
		ResultSet results = null;
		String sn = "nothing returned"; // surname
		String surname = null;
		String SQL = "SELECT surname FROM account WHERE phone = ?";
		PreparedStatement pstmt;
		try {
			Connection con = database.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, phone);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				sn = rs.getString("surname");
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
		return sn;
	}// end of getSurname

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

	/* get gender from DataBase method */
	public String getGender(String phone) {
		DB database = new DB();
		Statement statement = null;
		ResultSet results = null;
		String gend = "nothing returned"; // gender
		String gender = null;
		String SQL = "SELECT gender FROM account WHERE phone = ?";
		PreparedStatement pstmt;
		try {
			Connection con = database.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, phone);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				gend = rs.getString("gender");
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
		return gend;
	}// end of getGender

	/* get birthdate from DataBase method */
	public String getBirthdate(String phone) {
		DB database = new DB();
		Statement statement = null;
		ResultSet results = null;
		String bd = "nothing returned"; // birthdate
		String birthdate = null;
		String SQL = "SELECT birthdate FROM account WHERE phone = ?";
		PreparedStatement pstmt;
		try {
			Connection con = database.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, phone);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bd = rs.getString("birthdate");
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
		return bd;
	}// end of getBirthdate

	/* get state from DataBase method */
	public String getState(String phone) {
		DB database = new DB();
		Statement statement = null;
		ResultSet results = null;
		String state = null;
		String SQL = "SELECT state FROM account WHERE phone = ?";
		PreparedStatement pstmt;
		try {
			Connection con = database.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, phone);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				state = rs.getString("state");
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
		return state;
	}// end of getState

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

	

	
			/*insert new notification in database method*/
		public void addNotification(String phone, String notification)  {
			
				DB database = new DB();
				Connection con = null;
				try {
					con = database.getConnection();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String SQL = "INSERT INTO notification (phone, notification)" + "VALUES(?,?)";
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
					pstmt.setString(2, notification);
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
		
	
		/*update password in database method*/
		public void updatePassword(String phone, String newpassword) {

		String SQL = "UPDATE account SET password = ? WHERE phone = ?";
		PreparedStatement pstmt = null;
		DB database = new DB();
		Connection connection = null;
		try {
			connection = database.getConnection();
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1, newpassword);
			pstmt.setString(2, phone);
			pstmt.executeUpdate();
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

	}// end of updatePassword

	/* update municipality in database method */
	public void updateMunicipality(String phone, String newmunicipality) {
		String SQL = "UPDATE account SET municipality = ? WHERE phone = ?";
		PreparedStatement pstmt = null;
		DB database = new DB();
		Connection connection = null;
		try {
			connection = database.getConnection();
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1, newmunicipality);
			pstmt.setString(2, phone);
			pstmt.executeUpdate();
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

	}// end of updateMunicipality

	/* update name in database method */
	public void updateName(String phone, String newname) {
		String SQL = "UPDATE account SET name = ? WHERE phone = ?";
		PreparedStatement pstmt = null;
		DB database = new DB();
		Connection connection = null;
		try {
			connection = database.getConnection();
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1, newname);
			pstmt.setString(2, phone);
			pstmt.executeUpdate();
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

	}// end of updateName

	/* update surname in database method */
	public void updateSurname(String phone, String newsurname) {
		String SQL = "UPDATE account SET surname = ? WHERE phone = ?";
		PreparedStatement pstmt = null;
		DB database = new DB();
		Connection connection = null;
		try {
			connection = database.getConnection();
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1, newsurname);
			pstmt.setString(2, phone);
			pstmt.executeUpdate();
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

	}// end of updateName

	/* update state in database method */
	public void updateState(String phone, String newstate) {
		String SQL = "UPDATE account SET state = ? WHERE phone = ?";
		PreparedStatement pstmt = null;
		DB database = new DB();
		Connection connection = null;
		try {
			connection = database.getConnection();
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1, newstate);
			pstmt.setString(2, phone);
			pstmt.executeUpdate();
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

	}// end of updateState
	
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
	
