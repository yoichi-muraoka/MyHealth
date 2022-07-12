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
 * Servlet implementation class AddRecordServlet
 */
@WebServlet("/user/addRecord")
public class AddRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		DailyRecord latestRecord = null;
		try {
			// 最新の記録(体重)を取得
			latestRecord = DaoFactory.createDailyRecordDao().findLatestRecord(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// フォームに表示させる初期値
		DailyRecord record = new DailyRecord();
		record.setId(0);
		record.setUserId(user.getId());
		record.setWalk(0);
		record.setJogging(0);
		record.setPool(0);
		record.setTraining(0);
		record.setBall(0);
		record.setOther(0);
		record.setWeight(latestRecord != null ? latestRecord.getWeight() : 55.5);
		
		request.setAttribute("record", record);
		request.setAttribute("title", "日々の記録追加");
		request.getRequestDispatcher("/WEB-INF/view/user/saveRecord.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 入力値を取得して、DailyRecordオブジェクトにまとめる
		DailyRecord record = new DailyRecord();
		record.setId(Integer.parseInt(request.getParameter("id")));
		record.setUserId(Integer.parseInt(request.getParameter("user_id")));
		record.setWalk(Integer.parseInt(request.getParameter("walk")));
		record.setJogging(Integer.parseInt(request.getParameter("jogging")));
		record.setPool(Integer.parseInt(request.getParameter("pool")));
		record.setTraining(Integer.parseInt(request.getParameter("training")));
		record.setBall(Integer.parseInt(request.getParameter("ball")));
		record.setOther(Integer.parseInt(request.getParameter("other")));
		record.setWeight(Double.parseDouble(request.getParameter("weight")));
		
		try {
			DaoFactory.createDailyRecordDao().insert(record);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(request.getContextPath() + "/user/showRecord");
	}

}
