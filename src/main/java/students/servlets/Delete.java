package students.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import students.dao.StudentDao;
@WebServlet("/delete")
public class Delete extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int id = Integer.parseInt(req.getParameter("id"));
	StudentDao dao = new StudentDao();
	HttpSession session = req.getSession();
	String name = (String) session.getAttribute("name");
	
	
		if(name != null ) {
			dao.deleteStudent(id);
			req.setAttribute("students", dao.getAllStudent());
			RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
			dispatcher.include(req, resp);
		}
		else {
			req.setAttribute("message", "Login Required");
			RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
			dispatcher.include(req, resp);
		}
	
	}

}
