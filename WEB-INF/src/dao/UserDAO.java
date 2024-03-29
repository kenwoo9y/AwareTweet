package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utility.DriverAccessor;
import utility.PasswordEncryption;
import beans.User;

public class UserDAO extends DriverAccessor{


	public User selectUserByIdPass(String userId, String password) {
		// TODO Auto-generated method stub
		Connection con = null;
		con = createConnection();
		try{

			String sql="select * from user where id = (?) and password = (?) ";

			//PreparedStatementの利用
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1,userId);
			stmt.setString(2,password);
			ResultSet rs = stmt.executeQuery();

			rs.first();

			User user = new User();
			user.setUser_id(rs.getString("id"));
			user.setUser_name(rs.getString("name"));
			user.setUser_password(rs.getString("password"));

			stmt.close();
			rs.close();
			con = null;

			return user;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}finally{

		}
	}

	public void insertUser(String userId, String userName, String password) {
		Connection con = null;
		con = createConnection();
		try{
			String sql="insert into user values (?, ?, ?);";

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1,userId);
			stmt.setString(2,userName);
			stmt.setString(3,password);
			stmt.executeUpdate();

			stmt.close();
			con = null;

		}catch(SQLException e){
			e.printStackTrace();
		}finally{

		}

	}

	public int selectUserCountById(String userId) {

		Connection con = null;
		con = createConnection();

		try{
			String sql = "select count(1) from user where id = ?;";

			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, userId);

			ResultSet rs=stmt.executeQuery();
			rs.first();

			int count = rs.getInt("count(1)");

			stmt.close();
			rs.close();
			con = null;
			return count;
		}catch(SQLException e){
			e.printStackTrace();
			//0だとcount(1)とかぶる
			return 2;
		}finally{

		}

	}

	public void updateUserNamePassById(String userId, String userName,
			String password) {
		Connection con = null;
		con = createConnection();
		try{
			String sql = "update user set name = ?, password = ? where id = ?; ";
			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, userName);
			stmt.setString(2, password);
			stmt.setString(3, userId);
			stmt.executeUpdate();

			stmt.close();
			con = null;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{

		}

	}


}
