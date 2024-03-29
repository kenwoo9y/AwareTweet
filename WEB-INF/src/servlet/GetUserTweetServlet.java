package servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.GetUserTweetManager;
import beans.Tweet;
import beans.User;

public class GetUserTweetServlet extends HttpServlet{



	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{

		request.setCharacterEncoding("UTF-8");

		String commenter = request.getParameter("id");;

		GetUserTweetManager getUserTweetManager = new GetUserTweetManager();

		ArrayList<Tweet> list = getUserTweetManager.selectTweetbyCommenter(commenter);

        request.setAttribute("tweetList",list);
        request.setAttribute("author", commenter);
		getServletContext().getRequestDispatcher("/jsp/community/viewusertweet.jsp").forward(request, response);

		}
	}
