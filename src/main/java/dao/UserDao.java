package dao;

import domain.User;

public interface UserDao {
	
	// 重複するメールアドレスの確認用
	User findByEmail(String email) throws Exception;
	
	// ログイン認証用
	User findByEmailAndPass(String email, String pass) throws Exception;
	
	// ユーザー登録
	void insert(User user) throws Exception;
	
	// 身長の変更用
	void updateHeight(int id, double height) throws Exception;

}
