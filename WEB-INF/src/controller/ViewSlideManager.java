package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.ibm.icu.text.Transliterator;

public class ViewSlideManager {

	public ViewSlideManager(){
		
	}
	
	public File[] getJpegList(String userId, String slideName) {
		// TODO Auto-generated method stub
		String hostPath = "/Users/shu920921/Documents/workspace/";
		
		//探索するパス
		String basePath = hostPath + "AwareTweet/slide/" + userId +"/"+ slideName + "/";
		
		File file = new File(basePath);
		File[] files = file.listFiles();
		for(int i=1;i<files.length;i++){
			Path src = Paths.get(basePath + files[i].getName());
			Transliterator transliterator = Transliterator.getInstance("Katakana-Latin");
			String reName = transliterator.transliterate(files[i].getName());
			System.out.println(reName);
			Path srcRename = Paths.get(basePath + reName);
			try {
				System.out.println("変更前"+ files[i].getName());
				Files.move(src, srcRename);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		System.out.println("変更後"+files[1].getName());
		return files;
	}

}
