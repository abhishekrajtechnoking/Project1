package com.technoking.route;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Route {

	public static void main(String[] args) {

		  try {

			URL url = new URL("http://devapp.ticketgoose.com/bookbustickets/rest/json/2.0/route?username=javatest&password=123456");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");


			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));

			String output="";
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
				
				String parse=output.toString();
				String route=output;
				
				try {
					Object obj=new JSONParser().parse(parse);
					JSONObject jo=(JSONObject)obj;
					//String route=(String) jo.get("route");
					String hg=(String) jo.get("code");
					System.out.println((String) jo.get("code"));
					System.out.print((String) jo.get("message"));
					
					JSONArray ja1=(JSONArray)jo.get("routes");
					for(Object routes:ja1) {
						System.out.println("ROUTES::"+routes);
						
						JSONObject json=(JSONObject)routes;
						String to=(String)json.get("toStationCode");
						System.out.println("TO STATION CODE--"+to);
						
						String from=(String)json.get("fromStationCode");
						System.out.println("FROM STATION CODE--"+from);
					}
					
					/*
					 * JSONArray ja1=(JSONArray)jo.get("routes"); Iterator itr1=ja1.iterator();
					 * while(itr1.hasNext()) { Object keys=itr1.next();
					 * System.out.println("route value :"+keys.toString());
					 * 
					 * JSONObject json=(JSONObject)keys; String
					 * to=(String)json.get("toStationCode");
					 * System.out.println("T0 STATION CODE--"+to.toString());
					 * 
					 * String from=(String)json.get("fromStationCode");
					 * System.out.println("FROM STATION CODE--"+from.toString()); }
					 */
					
					/*
					 * JSONArray ja2=(JSONArray)jo.get("toStationCode"); Iterator
					 * itr2=ja1.iterator(); while(itr2.hasNext()) { Object keys=itr2.next();
					 * //Object value=ja.get((int) keys);
					 * 
					 * System.out.println(keys.toString()); }
					 */
					
				/*	
					
					Set set=jo.keySet();
					Iterator itr=set.iterator();
					while(itr.hasNext()) {
						String keys=(String)itr.next();
						String value=(String)jo.get(keys).toString();
						System.out.println(keys);
						System.out.println(value);
					}*/
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			conn.disconnect();

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		 }
	}

}
