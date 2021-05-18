package com.pfa.login;
import com.pfa.connectionProvide.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class LoginDao {
	public boolean validate(String u , String p) {
		try {
			Connection connection = new ConnectionProvider().getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT id FROM users WHERE nom=? and pass=MD5(?)");
			preparedStatement.setString(1,u);
			preparedStatement.setString(2,p);
			System.out.println(preparedStatement.toString());
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) return true ;
			return false; 
		} catch (SQLException e) {
			printSQLException(e);
			return false ;
		}  catch(Exception e ) {
			return false ;
		}
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
