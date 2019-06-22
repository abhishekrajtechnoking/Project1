<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	
	<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*,java.io.BufferedInputStream,
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
com.itextpdf.text.Paragraph,com.itextpdf.text.Chunk"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
String filename = "Transaction2.pdf"; 
     String filepath = "F:/";                               

     BufferedInputStream buf = null;
     ServletOutputStream myOut = null;
     ByteArrayOutputStream baos;

     try {

         myOut = response.getOutputStream();             //Getting mistake here
         File myfile = new File(filepath + filename);

         //set response headers
         response.setContentType("application/pdf");         //I want to download a PDF file

         response.addHeader(
                 "Content-Disposition", "attachment; filename=" + filename);

         response.setContentLength((int) myfile.length());

         FileInputStream input = new FileInputStream(myfile);
         buf = new BufferedInputStream(input);
         int readBytes = 0;

         //read from the file; write to the ServletOutputStream
         while ((readBytes = buf.read()) != -1) {
             myOut.write(readBytes);
         }

     } catch (IOException ioe) {
     }
     finally {

         //close the input/output streams
         if (myOut != null) {
             myOut.close();
         }
         if (buf != null) {
             buf.close();
         }
     }
%>
	
</body>
</html>