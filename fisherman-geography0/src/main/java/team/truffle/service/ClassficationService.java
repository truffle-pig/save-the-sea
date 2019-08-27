package team.truffle.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class ClassficationService {
	
	public String classifyFish() {
		ProcessBuilder processBuilder = null;
		Process process = null;
		
		try {
		    String osType = "window";
		    
		    if (osType.toLowerCase().indexOf("window") > -1) {
		    	//배치파일 안 명령어
		    	//@echo off
		    	//chcp 65001
		    	//"F:\anaconda3\Scripts\activate" YOLOdark 
		    	//&& cd C:\Users\youwa\YOLOdark\darkflow 
		    	//&& "F:\anaconda3\python" "C:\Users\youwa\YOLOdark\darkflow\flow" 
		    	//--labels labels.txt 
		    	//--pbLoad "C:\Users\youwa\YOLOdark\darkflow\built_graph\my-tiny-yolo.pb" 
		    	//--metaLoad "C:\Users\youwa\YOLOdark\darkflow\built_graph\my-tiny-yolo.meta" 
		    	//--imgdir "C:\Users\youwa\YOLOdark\darkflow\last_image_data_colab" 
		    	//--json
		        processBuilder = new ProcessBuilder("CMD", "/c", "C:/Users/youwa/YOLOdark/darkflow/classifyFish.bat");
		    } 

		    processBuilder.redirectErrorStream(true);
		    process = processBuilder.start();
		     
		    BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), "UTF-8"));
		    String line = null;
		     
		    while ((line = br.readLine() ) != null) {
		        System.out.println(line);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		//위 배치파일로 생성된 json파일이 위치한곳
		return "C:\\Users\\youwa\\YOLOdark\\darkflow\\last_image_data_colab\\out";
	}
	
}
