package com.technoking.route;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;



@WebServlet("/search")
public class Search extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String date;
		try {
			date=req.getParameter("date");
			
			URL url=new URL("http://devapp.ticketgoose.com/bookbustickets/rest/json/2.0/search?username=javatest&password=123456&travelDate="+date+"&fromStationCode=72&toStationCode=76");
			HttpURLConnection con=(HttpURLConnection)url.openConnection();
			con.setDoOutput(true);
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "text/json");
			//res.setContentType("appliction/json");
			PrintWriter pw=res.getWriter();
			
			BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
			
			String output="";
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				//pw.println(output);
				
				String parse=output.toString();
				
				Object obj=new JSONParser().parse(parse);
				JSONObject jo=(JSONObject)obj;
				
				String from=(String)jo.get("fromStationCode");
				pw.println("FROM::"+from);
				
				JSONArray ja=(JSONArray)jo.get("searchResult");
				
				for(Object search:ja) {
					//pw.println(search);
					
					JSONObject jo1=(JSONObject)search;
					String deptTime=(String)jo1.get("departureTime");
					pw.println("Departure Time::"+deptTime);
					
					
					String servNum=(String)jo1.get("serviceNumber");
					pw.println("Service Number::"+servNum);
					
					String jourTime=(String)jo1.get("journeyTime");
					pw.println("Journey Time::"+jourTime);
					
					String optServTax=(String)jo1.get("operatorServiceTax");
					pw.println("Operator Service Tax::"+optServTax);
					
					Object board=(Object)jo1.get("boardingPointDetails");
					//JSONArray  arr1Check;
					if(board instanceof JSONArray) {
					JSONArray ja1=(JSONArray)jo1.get("boardingPointDetails");
					for(int i=0;i<ja1.size();i++) {
						
						JSONObject jsonobj_1 = (JSONObject)ja1.get(i);
						//JSONObject jsonobj_2 = (JSONObject) jsonobj_1.get("boardingPointDetails");
						pw.println("CODE::" +jsonobj_1.get("code"));
						pw.println("Name::" +jsonobj_1.get("name"));
						pw.println("TIME::" +jsonobj_1.get("time"));
						
					}
				}
					else if(board instanceof JSONObject) {
						
						Object brd=(Object)jo1.get("boardingPointDetails");
						JSONObject jobj1=(JSONObject)brd;
						String code=(String)jobj1.get("code");
						String name=(String)jobj1.get("name");
						String time=(String)jobj1.get("time");
						pw.println("BoardingPoint Details::"+" Code::"+code+" Name::"+name+" Time::"+time);
						 
					}
					else {
						String code=(String)jo1.get("code");
						pw.println("CODE::"+code);
						String name=(String)jo1.get("name");
						pw.println("NAME::"+name);
						String time=(String)jo1.get("time");
						pw.println("Time::"+time);
					}
					String avlSeats=(String)jo1.get("availableSeats");
					pw.println("Available Seats::"+avlSeats);
					
					String optrCode=(String)jo1.get("operatorCode");
					pw.println("Oprator Code::"+optrCode);
					
					String optrName=(String)jo1.get("operatorName");
					pw.println("Oprator Name::"+optrName);
					
					Object cancl=(Object)jo1.get("cancellationTerms");
					
					if(cancl instanceof JSONArray) {
					JSONArray ja2=(JSONArray)jo1.get("cancellationTerms");
					for(int j=0;j<ja2.size();j++) {
						pw.println("Cancelation Term::"+ja2.get(j));
					}
					
					}
					else if(cancl instanceof JSONObject) {
						
						Object brd=(Object)jo1.get("cancellationTerms");
						JSONObject can=(JSONObject)brd;
						pw.println("Cancellation Terms::"+can);
					}
					else {
						String cancel=(String)jo1.get("cancellationTerms");
						pw.println("Cancellation Terms::"+cancel);
					}
					
					Object oprtorDtls=(Object)jo1.get("operatorDetails");
					JSONObject jo3=(JSONObject)oprtorDtls;
					String adrReq=(String)jo3.get("addressRequired");
					pw.println("ADDRESS REQUIRED::"+adrReq);
					String partCanc=(String)jo3.get("partialCancelAllowed");
					pw.println("Partial Cancellation::"+partCanc);
					String altMob=(String)jo3.get("alternateMobileRequired");
					pw.println("Alternate mobile number REQUIRED::"+altMob);
					String mxSeat=(String)jo3.get("maxSeat");
					pw.println("Maximum Seat::"+mxSeat);
					String idPrf=(String)jo3.get("idProofRequired");
					pw.println("ID Proof Required::"+idPrf);
					String psngDetails=(String)jo3.get("passengerDetails");
					pw.println("Passenger Details::"+psngDetails);
					String mobTcktAllo=(String)jo3.get("mobileTicketAllowed");
					pw.println("Mobile Ticket Allowed::"+mobTcktAllo);
					
					String arvTime=(String)jo1.get("arrivalTime");
					pw.println("Arrival Time::"+arvTime);
					
					Object ratings=(Object)jo1.get("ratings");
					JSONObject jo4=(JSONObject)ratings;
					String stfPvr=(String)jo4.get("staffBehavior");
					pw.println("Staff Behaviour::"+stfPvr);
					String punch=(String)jo4.get("punctuality");
					pw.println("Punctuality::"+punch);
					String busQlt=(String)jo4.get("busQuality");
					pw.println("Bus Quality::"+busQlt);
					
					String scCode=(String)jo1.get("scheduleCode");
					pw.println("Schedule Code::"+scCode);
					
					String acBus=(String)jo1.get("acBus");
					pw.println("AC Bus::"+acBus);
					
					String busType=(String)jo1.get("busType");
					pw.println("Bus Type::"+busType);
					
					String ticketFare=(String)jo1.get("ticketFare");
					pw.println("Ticket Fare::"+ticketFare);
					
					pw.println(".............................");
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	

}
