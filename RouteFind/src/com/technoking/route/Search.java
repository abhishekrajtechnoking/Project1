package com.technoking.route;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Search {

	public static void main(String[] args) {
		
		try {
			URL url=new URL("http://devapp.ticketgoose.com/bookbustickets/rest/json/2.0/search?username=javatest&password=123456&travelDate=2019-07-10&fromStationCode=72&toStationCode=76");
			HttpURLConnection con=(HttpURLConnection)url.openConnection();
			con.setDoOutput(true);
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json");
			
			BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
			
			String output="";
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
				//con.disconnect();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());;
		}
		

	}

}
