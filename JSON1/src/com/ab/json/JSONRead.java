package com.ab.json;

import java.io.FileReader;
import java.util.Iterator;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class JSONRead {

	public static void main(String[] args) throws Exception {
		
		 Object obj = new JSONParser().parse(new FileReader("JSON.json"));
		 JSONObject jo=(JSONObject)obj;
		
		 Set keys = jo.keySet();
         Iterator itr = keys.iterator();
         while(itr.hasNext()) {
         	 String key = (String)itr.next();
             String value = (String)jo.get(key).toString();
             System.out.println("key : "+key);
             System.out.println(" value :"+value);
         }

	}

}
