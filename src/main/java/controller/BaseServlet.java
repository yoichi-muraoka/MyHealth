package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import domain.DailyRecord;
import domain.User;

/**
 * Servlet implementation class BaseServlet
 */
@WebServlet("/user/base")
public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// セッションからユーザー情報を取得
		User user = (User) request.getSession().getAttribute("user");
		
		// DBから最新の体重を取得⇒BMI値を計算する
		Double weight = null;
		
		try {
			DailyRecord record = DaoFactory.createDailyRecordDao().findLatestRecord(user.getId());
			weight = record != null ? record.getWeight() : null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Double bmi = null;
		if(weight != null && weight > 0) {
			double height = user.getHeight() / 100; // 身長をメートルに変換
			bmi = weight / (height * height);
			bmi = Math.floor(bmi * 100) / 100; // 小数点第二位までにする
		}
		
		String bmiMessage;
		if(bmi == null) {
			bmiMessage = "判定なし";
		}
		else if(bmi < 18.5) {
			bmiMessage = "痩せ気味";
		}
		else if(bmi < 25) {
			bmiMessage = "適正";
		}
		else {
			bmiMessage = "太り気味";
		}
		
		request.setAttribute("weight", weight);
		request.setAttribute("bmi", bmi);
		request.setAttribute("bmiMessage", bmiMessage);
		request.getRequestDispatcher("/WEB-INF/view/user/base.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// セッションからユーザーのIDを取得
		User user = (User) request.getSession().getAttribute("user");
		int id = user.getId();
		
		// フォームから身長を取得
		double height = Double.parseDouble(request.getParameter("height"));
		
		// データベースに登録
		try {
			DaoFactory.createUserDao().updateHeight(id, height);
			user.setHeight(height); // セッション内の身長にも反映
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(request.getContextPath() + "/user/base");
	}

}
