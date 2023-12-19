package students.servlets;
import studentdetails.dto.Student;
import students.dao.StudentDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/signup")
@MultipartConfig(maxFileSize=1024*1024*5)
public class SignUp extends HttpServlet
{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String name = req.getParameter("name");
	String password = req.getParameter("password");
	String location = req.getParameter("location");
	long phoneno = Long.parseLong(req.getParameter("phoneno"));
	String email = req.getParameter("email");
	byte [] image = req.getPart("image").getInputStream().readAllBytes();
	Student stud =  new Student();
	stud.setName(name);
	stud.setPassword(password);
	stud.setLocation(location);
	stud.setPhoneNo(phoneno);
	stud.setEmail(email);
	stud.setImage(image);
	StudentDao dao = new StudentDao();
		 Student result = dao.saveStudent(stud);
			if(result != null) {
				req.setAttribute("id", result.getId());
				req.setAttribute("name", result.getName());
				RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
				dispatcher.include(req, resp);
				
			}
			else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("signup.jsp");
				dispatcher.include(req, resp);
			}
		
		
		}

	
}

