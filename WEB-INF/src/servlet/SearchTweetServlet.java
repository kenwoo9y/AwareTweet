package servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.SearchTweetManager;
import beans.Tweet;
import beans.User;

public class SearchTweetServlet extends HttpServlet{

	

	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{

		request.setCharacterEncoding("UTF-8");

		String searchWord = request.getParameter("search_word");; 

		SearchTweetManager searchTweetManager = new SearchTweetManager();
		
		ArrayList<Tweet> list = searchTweetManager.selectTweetByComment(searchWord);

        request.setAttribute("tweetList",list);
		getServletContext().getRequestDispatcher("/jsp/community/viewusertweet.jsp").forward(request, response);

		}
	}
