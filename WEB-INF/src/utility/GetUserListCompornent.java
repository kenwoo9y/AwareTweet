package utility;

import java.io.File;

public class GetUserListCompornent{

	public File[] getUserList() {
		// TODO Auto-generated method stub
		String hostFullPath = "/Users/shu920921/Documents/workspace/";
	    String userListPath = hostFullPath + "AwareTweet/avator";
	    
	    File userList = new File(userListPath);
	    File[] users = userList.listFiles();
		return users;
	}
	
	
}