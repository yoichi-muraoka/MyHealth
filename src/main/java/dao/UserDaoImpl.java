package dao;

import javax.sql.DataSource;

import domain.User;

public class UserDaoImpl implements UserDao {
	
	private DataSource ds;
	
	public UserDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public User findByEmail(String email) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

	@Override
	public User findByEmailAndPass(String email, String pass) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

	@Override
	public void updateHeight(double height) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		
	}

}
