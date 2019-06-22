package com.technoking.invoice;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pdf")
public class InvoicePdf extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		
		// you  can get your base and parent from the database
        String base = "e1";
        String parent = "e2";
        String filename = "Inventario.pdf";    //my own filename
// you can  write http://localhost
        String filepath = "E:/";                                //located on Local C harddisk

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
 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	

}
