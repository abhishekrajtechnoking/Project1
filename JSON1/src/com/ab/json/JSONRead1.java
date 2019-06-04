package com.ab.json;

import java.io.FileReader;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class JSONRead1 {

	public static void main(String[] args)throws Exception {
		 Object obj = new JSONParser().parse(new FileReader("JSONExample.json"));
		 JSONObject jo=(JSONObject)obj;
		 
		 String name=(String)jo.get("name");
		 System.out.println(name);
	}

}
