package servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.PropertiesComponent;
import beans.Tweet;
import beans.User;
import controller.LoginManager;
import controller.TweetManager;


public class TweetServlet extends HttpServlet{

	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{

		request.setCharacterEncoding("UTF-8");

		String comment=request.getParameter("comment");


		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String commenter = user.getUser_id();


		String avatorPath = user.getAvator_path();

		TweetManager tweetManager=new TweetManager();

		tweetManager.insertTweet(commenter,comment,avatorPath);

		LoginManager loginManager = new LoginManager();

		ArrayList<Tweet> list = loginManager.selectTweet();

        request.setAttribute("tweetList",list);
        request.setAttribute("user", user);

        response.sendRedirect("./MoveTopServlet");


		}
	}
