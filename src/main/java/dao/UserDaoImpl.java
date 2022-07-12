package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.mindrot.jbcrypt.BCrypt;

import domain.User;

public class UserDaoImpl implements UserDao {

	private DataSource ds;

	public UserDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public User findByEmail(String email) throws Exception {
		User user = null;
	    try (Connection con = ds.getConnection()) {
	      String sql = "SELECT * FROM users WHERE email = ?";
	      PreparedStatement stmt = con.prepareStatement(sql);
	      stmt.setString(1, email);
	      ResultSet rs = stmt.executeQuery();
	      if (rs.next()) {
	        user = mapToUser(rs);
	      }
	    } catch (Exception e) {
	      throw e;
	    }
	    return user;
	}

	@Override
	public User findByEmailAndPass(String email, String pass) throws Exception {
		User user = findByEmail(email);
		if(user == null) {
			System.out.println("Emailアドレスが登録されていない");
			return null;
		}
		
		if(!BCrypt.checkpw(pass, user.getPass())) {
			System.out.println("パスワードが間違っている");
			return null;
		}
		
		return user;
	}

	@Override
	public void insert(User user) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		
	}
	
	@Override
	public void updateHeight(int id, double height) throws Exception {
	    try (Connection con = ds.getConnection()) {
	      String sql = "UPDATE users SET height = ? WHERE id = ?";
	      PreparedStatement stmt = con.prepareStatement(sql);
	      stmt.setDouble(1, height);
	      stmt.setInt(2, id);
	      stmt.executeUpdate();
	    } catch (Exception e) {
	      throw e;
	    }
	}

	protected User mapToUser(ResultSet rs) throws Exception {
		User user = new User();
		user.setId(rs.getInt("id"));
		user.setName(rs.getString("name"));
		user.setHeight(rs.getDouble("height"));
		user.setEmail(rs.getString("email"));
		user.setPass(rs.getString("pass"));
		return user;
	}

}
