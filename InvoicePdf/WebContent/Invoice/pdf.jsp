<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.BufferedInputStream,
java.io.File,java.io.FileInputStream,
java.io.IOException,
javax.servlet.ServletException,
javax.servlet.ServletOutputStream,
javax.servlet.annotation.WebServlet,
javax.servlet.http.HttpServlet,
javax.servlet.http.HttpServletRequest,
javax.servlet.http.HttpServletResponse,
 	java.io.FileOutputStream,
java.io.StringReader,

com.itextpdf.text.Document,
com.itextpdf.text.PageSize,
com.itextpdf.text.html.simpleparser.HTMLWorker,
com.itextpdf.text.pdf.PdfWriter,com.itextpdf.tool.xml.XMLWorkerHelper,
com.itextpdf.text.Paragraph,com.itextpdf.text.Chunk
"
%>

<%@ page import="java.io.*" %> 
	 <%@ page import="com.itextpdf.text.*" %> 
	 <%@ page import="com.itextpdf.text.pdf.*" %> 
	<%@include file="invoice.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>pdf</title>
</head>
<body>
	<form action="#" method="post">
	<%
	
		try{
			
			String srNo="123";
			String tktNo="1234aqw";
			String sectors="gdfsh";
			String flt="indigo";
			String pxNo="548";
			String type="jnl84";
			String cls="1";
			String otTx="548";
			String kGst="548";
			String yqTx="548";
			String bagCh="548";
			String melCh="548";
			String seatCh="548";
			String splServCh="548";
			String sCh="548";
			
			
			Document document = new Document();
	         PdfWriter.getInstance(document, new FileOutputStream("F:/Transaction2.pdf"));
	         document.open();
			
			  Font mySizeSpecification=new Font();
	            mySizeSpecification.setSize(8);
				Font mySizeSpecification1=new Font();
	            mySizeSpecification1.setSize(10);
				Font mySizeSpecification12=new Font();
	            mySizeSpecification12.setColor(BaseColor.WHITE);
			 
			 HTMLWorker htmlWorker = new HTMLWorker(document);
		      String str1 = "<html><head></head><body><header><div><h6>"+
		    		"<table>"+
		      			"<tr><td>Invoice Number:<br>Travel Boutique Online(A Unit of Tek Travels Pvt Ltd)<br>"+
		      			"Regd Office: E-78, South Extn Part-I, New Delhi 110049<br>Corp Off :Plot No 728, Udyog vihar Phase-V,Gurgaon 122016<br>"+
		      			"Email: info@travelboutiqueonline.com<br>Web :www.travelboutiqueonline.com"+
		      			"Gurugram<br>Phone: 1244998999<br>CI Number : U74999DL2006PTC155233"+
		      			"PAN : AACCT6259K<br>GST State : Haryana<br>GSTIN : 06AACCT6259K1ZZ"+
		      			"</td><td></td><td style='text-align:right'>Invoice Date:24/06/2019<br><br>PNR Number:ASHE1234<br>BTB TRAVEL TECH PVT LTD<br>"+
		      			"206 A RAKH COMPLEX ASIYAN<br>DIGHA<br>ROAD PATNA<br>Phone:7543041221<br>PAN:AAICB0695B<br>GST State:Bihar "+
		      			"</td></tr>"+
		      			
		      "</table><br>Travel Date:"+
		        "</h6>"+
		        "</div></header></body><br></html>";
		      htmlWorker.parse(new StringReader(str1));
			

			 
	         PdfPTable table1 = new PdfPTable(16);
			 table1.setWidthPercentage(110);
			 PdfPCell table_cell = new PdfPCell();
	         table_cell.setPadding(6);
	         table_cell.setUseBorderPadding(true);
	 
	         table_cell=new PdfPCell(new Phrase("Sr.No",mySizeSpecification1));
			 table1.addCell(table_cell);
	         table_cell=new PdfPCell(new Phrase("Ticket No",mySizeSpecification1));
			 table1.addCell(table_cell);
	         table_cell=new PdfPCell(new Phrase("Sectors",mySizeSpecification1));
			 table1.addCell(table_cell);
	         table_cell=new PdfPCell(new Phrase("Flight",mySizeSpecification1));
	         table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("PAX No",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("Type",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("Class",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("Fare",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("OT Tax",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("K3/GST",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("YQ Tax",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("Baggage Ch.",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("Meal Ch.",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("Seat Ch.",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("Special Service Charges",mySizeSpecification1));
			 table1.addCell(table_cell);
			 table_cell=new PdfPCell(new Phrase("S Charges",mySizeSpecification1));
			 table1.addCell(table_cell);
			 
			 
	            table_cell=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(tktNo,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(sectors,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(flt,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(pxNo,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(type,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(cls,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(otTx,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(kGst,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(yqTx,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(bagCh,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(melCh,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(seatCh,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(splServCh,mySizeSpecification));
	            table1.addCell(table_cell);
	            table_cell=new PdfPCell(new Phrase(sCh,mySizeSpecification));
	            table1.addCell(table_cell);
	            
	            table_cell=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	            table1.addCell(table_cell);

	                document.add(table1);
	                
	                String str2 = "<html><head></head><body><div>"+
	    		    		"<table>"+
	    		      			"<tr><td><h5>Remarks:<br>*** Voidation Rs 500All Penalties as per fare rules<h5>"+
	    		      			"</td><td></td><td style='text-align:right'><h6>"+
	    		      			"Gross :       3698.00<br>"+
	    		      			"Less            Commission Earned :           41.47<br>"+
	    		      			"Add            Tra Fee :           0.00<br>"+
	    		      			"Add            TDS Deducted :           2.07<br>"+
	    		      			"Add            CGST @0.00% :           0.00<br>"+
	    		      			"Add            SGST @0.00% :           0.00<br>"+
	    		      			"Add            IGST@18.00% :           0.00<br>"+
	    		      			"Less            Amount Paid By Agent Credit Card :     0.00<br>"+
	    		      			"Net Amount:        3659.00<br>"+
	    		      			"</h6></td></tr>"+
	    		      			
	    		      "</table><br>:"+
	    		        "</div></body><br></html>";
	    		      htmlWorker.parse(new StringReader(str2));
	    		      
	    		      
	    		      String str3 = "<html><head></head><body><div>"+
		    		    	"<h3 style='text-align:center;'>GST Details</h3><br>"+
						"</div></body></html>";
					      htmlWorker.parse(new StringReader(str3));
	    		      
	    		      PdfPTable table2 = new PdfPTable(7);
	    				 table2.setWidthPercentage(110);
	    				 PdfPCell table_cel2 = new PdfPCell();
	    		         table_cel2.setPadding(6);
	    		         table_cel2.setUseBorderPadding(true);
	    		         
	    		         
	    		         table_cel2=new PdfPCell(new Phrase("Service Description",mySizeSpecification1));
	    				 table2.addCell(table_cel2);
	    				 table_cel2=new PdfPCell(new Phrase("SAC    ",mySizeSpecification1));
	    				 table2.addCell(table_cel2);
	    				 table_cel2=new PdfPCell(new Phrase("Taxable Value  ",mySizeSpecification1));
	    				 table2.addCell(table_cel2);
	    				 table_cel2=new PdfPCell(new Phrase("CGST @ 0.00% ",mySizeSpecification1));
	    				 table2.addCell(table_cel2);
	    				 table_cel2=new PdfPCell(new Phrase("SGST @ 0.00%",mySizeSpecification1));
	    				 table2.addCell(table_cel2);
	    				 table_cel2=new PdfPCell(new Phrase("IGST @ 18.00% ",mySizeSpecification1));
	    				 table2.addCell(table_cel2);
	    				 table_cel2=new PdfPCell(new Phrase("Total GST",mySizeSpecification1));
	    				 table2.addCell(table_cel2);
	    				 

	    		            table_cel2=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	    		            table2.addCell(table_cel2);
	    		            table_cel2=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	    		            table2.addCell(table_cel2);
	    		            table_cel2=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	    		            table2.addCell(table_cel2);
	    		            table_cel2=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	    		            table2.addCell(table_cel2);
	    		            table_cel2=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	    		            table2.addCell(table_cel2);
	    		            table_cel2=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	    		            table2.addCell(table_cel2);
	    		            table_cel2=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	    		            table2.addCell(table_cel2);
	                	
	    				 document.add(table2);
	    				 
	    				 String str4 = "<br><html><head></head><body><div>"+
	 		    		    	"<h3 style='text-align:center;'>Passenger GST Details</h3><br>"+
	 						"</div></body></html>";
	 					      htmlWorker.parse(new StringReader(str4));
	 	    		      
	 	    		      PdfPTable table3 = new PdfPTable(6);
	 	    				 table3.setWidthPercentage(110);
	 	    				 PdfPCell table_cel3 = new PdfPCell();
	 	    		         table_cel3.setPadding(6);
	 	    		         table_cel3.setUseBorderPadding(true);
	 	    		         
	 	    		         
	 	    		         table_cel3=new PdfPCell(new Phrase("Lead Pax Name",mySizeSpecification1));
	 	    				 table3.addCell(table_cel3);
	 	    				 table_cel3=new PdfPCell(new Phrase("GST Number ",mySizeSpecification1));
	 	    				 table3.addCell(table_cel3);
	 	    				 table_cel3=new PdfPCell(new Phrase("GST Company Contact ",mySizeSpecification1));
	 	    				 table3.addCell(table_cel3);
	 	    				 table_cel3=new PdfPCell(new Phrase("GST Company Address ",mySizeSpecification1));
	 	    				 table3.addCell(table_cel3);
	 	    				 table_cel3=new PdfPCell(new Phrase("GST Company Email  ",mySizeSpecification1));
	 	    				 table3.addCell(table_cel3);
	 	    				 table_cel3=new PdfPCell(new Phrase("GST Company Name ",mySizeSpecification1));
	 	    				 table3.addCell(table_cel3);
	 	    				 
	 	    				 

	 	    		            table_cel3=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	 	    		            table3.addCell(table_cell);
	 	    		            table_cel3=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	 	    		            table3.addCell(table_cell);
	 	    		            table_cel3=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	 	    		            table3.addCell(table_cell);
	 	    		            table_cel3=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	 	    		            table3.addCell(table_cell);
	 	    		            table_cel3=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	 	    		            table3.addCell(table_cell);
	 	    		            table_cel3=new PdfPCell(new Phrase(srNo,mySizeSpecification));
	 	    		            table3.addCell(table_cell);
	 	    		            
	 	                	
	 	    				 document.add(table3);
	 	    				 
	 	    				 
	 	    				String str5 = "<br><br><html><head></head><body><div>"+
		 		    		    	"<h5>Invoice Status :Paid<br>Billed by : Travel Boutique Online<br>Ticketed by : RAHUL KUMAR</h5><br>"+
		 						"</div></body></html>";
		 					      htmlWorker.parse(new StringReader(str5));
		 					      
		 					     String str6 = "<br><br><html><head></head><body><div>"+
				 		    		    	"<ul>"+
				 		    		    		"<li><h4>Terms & Conditions :</h4></li>"+
		 					     				"<li><h6>This is computer generated invoice signature not required.</li>"+
		 					     				"<li All Cases Disputes are subject to New Delhi Jurisdiction.</li>"+
		 					     				"<li>Refunds Cancellations are subject to Airline's approval.</li>"+
		 					     				"<li>Kindly check all details carefully to avoid unnecessary complications.</li>"+
		 					     				"<li>CHEQUE : Must be drawn in favour of 'TRAVEL BOUTIQUE ONLINE'.</li>"+
		 					     				"<li>LATE PAYMENT : Interest @ 24% per annum will be charged on all outstanding bills after due date.</li>"+
		 					     			"</h6></ul>"+
				 						"</div></body></html>";
				 					      htmlWorker.parse(new StringReader(str6));
	 	    				 
	    				 
					out.print("convert to pdf");
					//response.sendRedirect("pdf1.jsp");
					 document.close();
					//response.sendRedirect("invoice.jsp");
	         }catch(Exception ex){
	     out.print(ex);
	         
	         }    
	%>
	
	</form>
</body>
</html>