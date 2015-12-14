package controller;

import java.sql.Connection;
import java.util.ArrayList;

import beans.Tweet;
import dao.TweetDAO;

public class SearchTweetManager {

	private Connection connection = null;
	
	public SearchTweetManager() {
		// TODO Auto-generated method stub
	}
	
	public ArrayList<Tweet> selectTweetByComment(String searchWord) {
		// TODO Auto-generated method stub
		TweetDAO dao = new TweetDAO();

		this.connection = dao.createConnection();

		ArrayList<Tweet> list = dao.selectTweetByComment(searchWord,this.connection);

		dao.closeConnection(this.connection);

		this.connection = null;
		
		return list;
	}


}
