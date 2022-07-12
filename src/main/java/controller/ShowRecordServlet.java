package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import domain.DailyRecord;
import domain.User;

/**
 * Servlet implementation class ShowRecordServlet
 */
@WebServlet("/user/showRecord")
public class ShowRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ユーザーの「日々の記録」を取得
		User user = (User) request.getSession().getAttribute("user");
		
		List<DailyRecord> records = null;
		try {
			records = DaoFactory.createDailyRecordDao().findNewerRecords(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("records", records);
		request.getRequestDispatcher("/WEB-INF/view/user/record.jsp").forward(request, response);
	}

}
