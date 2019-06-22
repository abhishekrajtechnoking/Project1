package com.technoking.flight;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/date")
public class FlightBooking extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
	    Date date = new Date();
        System.out.println(sdf.format(date));

        Calendar cal = Calendar.getInstance();
        String dt=sdf.format(cal.getTime());
        System.out.println("date::"+dt);
        
		/*
		 * LocalDateTime now = LocalDateTime.now(); System.out.println(dtf.format(now));
		 * 
		 * LocalDate localDate = LocalDate.now();
		 * System.out.println(DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate)
		 * );
		 * 
		 */
        // create instance of Random class 
        Random rand = new Random(); 
  
        // Generate random integers in range 0 to 999 
        int rand_int1 = rand.nextInt(1000); 
        int rand_int2 = rand.nextInt(1000); 
  
        // Print random integers 
        System.out.println("Random Integers: "+rand_int1); 
        System.out.println("Random Integers: "+rand_int2); 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}
	
	

}
