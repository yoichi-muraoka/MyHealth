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
@WebServlet("/user/editRecord")
public class EditRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User user = (User) request.getSession().getAttribute("user");
			Integer id = Integer.parseInt(request.getParameter("id"));
			DailyRecord record = DaoFactory.createDailyRecordDao().findById(id, user.getId());
			request.setAttribute("record", record);
			request.getRequestDispatcher("/WEB-INF/view/user/saveRecord.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/user/showRecord");
		}
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
			DaoFactory.createDailyRecordDao().update(record);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(request.getContextPath() + "/user/showRecord");
	}

}
