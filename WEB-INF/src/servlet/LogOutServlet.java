package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutServlet extends HttpServlet{

	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		doPost(request,response);
	}

		public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{

		    HttpSession session = request.getSession(false);


		    if (session!=null) {

		    session.invalidate();
		    }

		    response.sendRedirect(response.encodeRedirectURL("./login.jsp"));

		}
	}
