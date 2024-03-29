package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Tweet;
import beans.User;
import controller.ViewSlideManager;

public class ViewSlideServlet extends HttpServlet{

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

			//保持されているユーザー情報を取得する
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			String userId = user.getUser_id();

			String slideName = request.getParameter("slide_name");
			String author = request.getParameter("author");

			if(author == null){
				author = user.getUser_id();
			}

			//対象ディレクトリのJPEGをとってくる
			ViewSlideManager viewSlideManager = new ViewSlideManager();
			File[] jpegList = viewSlideManager.getJpegList(author, slideName);

			//スライドのツイート
			ArrayList<Tweet> list = viewSlideManager.getSlideTweetList(author,slideName);

			System.out.println(list.size());


			request.setAttribute("tweetList",list);
			request.setAttribute("jpeg-list", jpegList);
			session.setAttribute("user", user);
			request.setAttribute("slideName", slideName);
			request.setAttribute("author", author);
			getServletContext().getRequestDispatcher("/jsp/community/viewslide.jsp").forward(request, response);
	}
}
