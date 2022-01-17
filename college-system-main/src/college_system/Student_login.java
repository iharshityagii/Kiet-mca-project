package college_system;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;

/**
 * Servlet implementation class Student_login
 */
@WebServlet("/Student_login")
public class Student_login extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email,pass;
		email=request.getParameter("email");
		pass=request.getParameter("pass");
		ServletContext sc = getServletContext();
		Database db = (Database)sc.getAttribute("dob");
		int sid = db.studentlogin(email,pass);
		if(sid!=0) {
			Student stu= db.studentDetail(sid);
			HttpSession sse = request.getSession();
			sse.setAttribute("sdetail", stu);
			response.sendRedirect("student_option.jsp");
		}
	}

}
