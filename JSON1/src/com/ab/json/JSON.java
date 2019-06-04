package com.ab.json;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;

public class JSON {

	 public static void main(String[] args) throws FileNotFoundException  
	    { 
	         
	        JSONObject jo = new JSONObject();
	        
	        jo.put("name","Abhishek");
	        jo.put("age", 23);
	       
	        PrintWriter pw = new PrintWriter("JSON1.json"); 
	        pw.print(jo); 
	          
	        pw.flush(); 
	        pw.close();
	        
	}

}
