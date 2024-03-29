package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import utility.MacUnzipComponent;
import utility.PropertiesComponent;
import utility.WindowsUnzipComponent;
import beans.User;

public class RegistSlideServlet extends HttpServlet{

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{

		request.setCharacterEncoding("UTF-8");

		//保持されているユーザー情報を取得する
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String userId = user.getUser_id();

		//iterator用のintとos判別用のos
		int i=0;
		String os=null;
		String fileName=null;

		//ここ直してください。
		String appRootPath =  new PropertiesComponent().referProperties("appRootPath");
//		String appRootPath = "C:/Users/tanese kenta/awaretweet/";
		File path = new File(appRootPath + "slide/"+userId);

		DiskFileItemFactory factory   = new DiskFileItemFactory();
		factory.setRepository(path);
		factory.setSizeThreshold(1024);

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(-1); //-1は無限
		upload.setHeaderEncoding("utf-8");

		try {
			List<FileItem> list = upload.parseRequest(request);
		    Iterator<FileItem> iterator = list.iterator();

		    while(iterator.hasNext()){
		      FileItem fileItem = iterator.next();
		      if(i==0){
		        	os=fileItem.getString();
		        	byte[] bytes= os.getBytes("iso-8859-1");
		    		os = new String(bytes, "utf-8");
		        	i++;
		      }
		      else if (!fileItem.isFormField()){
		          fileName = fileItem.getName();
		          if ((fileName != null) && (!fileName.equals(""))){
		            fileItem.write(new File(path + "/" + fileName));

		            i++;
		          }
		      }

		    }

		  }catch (FileUploadException e) {
		    e.printStackTrace();
		  }catch (Exception e) {
			  e.printStackTrace();
		  }
		 if(os.equals("win")){
         	System.out.println(os);
         	WindowsUnzipComponent unzip = new WindowsUnzipComponent();
         	unzip.unzip(userId, path + "/" + fileName, appRootPath + "slide/"+userId);
         }else{
         	System.out.println(os);
         	MacUnzipComponent unzip = new MacUnzipComponent();
         	unzip.unzip(userId, path + "/" + fileName, appRootPath + "slide/"+userId);
         }
		session.setAttribute("user",user);
		getServletContext().getRequestDispatcher("/jsp/community/MoveTopServlet").forward(request, response);
	}

}
