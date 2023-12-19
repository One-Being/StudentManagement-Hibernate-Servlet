package students.servlets;
import java.io.IOException;
import java.util.List;
import studentdetails.dto.Student;
import students.dao.StudentDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		StudentDao dao = new StudentDao();
		
		
		
			Student s = dao.findByName(name);
			List<Student> students = dao.getAllStudent();
			
			if(s.getPassword().equals(password)) {
				HttpSession session = req.getSession();
				session.setAttribute("name", name);
				session.setAttribute("password", password);
				req.setAttribute("students", students);
				RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
				dispatcher.include(req, resp);
			}
			else {
				
				req.setAttribute("message", "Invalid");
				RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
				dispatcher.include(req, resp);
			}
		
		
	}

}
