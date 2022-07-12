package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.UserDao;
import domain.User;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("height", 155.5); // 身長の初期値
		request.getRequestDispatcher("/WEB-INF/view/signup.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 入力値の取得
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String confPass = request.getParameter("confPass");
		String name = request.getParameter("name");
		Double height = Double.parseDouble(request.getParameter("height"));
		
		UserDao dao = DaoFactory.createUserDao();
		
		// バリデーション
		List<String> errors = new ArrayList<>();
		if(email.isBlank()) {
			errors.add("メールアドレスが未入力です。");
		}
		else {
			User tempUser = null;
			try {
				tempUser = dao.findByEmail(email);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(tempUser != null) {
				errors.add("すでに登録済みのメールアドレスです。");
			}
		}
		
		if(pass.isBlank()) {
			errors.add("パスワードが未入力です。");
		}
		else if(!pass.equals(confPass)) {
			errors.add("確認用パスワードが一致していません。");
		}
		
		if(name.isBlank()) {
			errors.add("名前が未入力です。");
		}
		
		// 入力に不備がある場合
		if(errors.size() > 0) {
			request.setAttribute("errors", errors);
			request.setAttribute("email", email);
			request.setAttribute("name", name);
			request.setAttribute("height", height);
			request.getRequestDispatcher("/WEB-INF/view/signup.jsp").forward(request, response);
			return;
		}
		
		// 入力に不備なし ⇒ 登録
		try {
			User user = new User();
			user.setEmail(email);
			user.setPass(pass);
			user.setName(name);
			user.setHeight(height);
			dao.insert(user);
			
			response.sendRedirect(request.getContextPath() + "/signupDone");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}






