package students.servlets;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import studentdetails.dto.Student;
import students.dao.StudentDao;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.util.Base64;

@WebServlet("/generatePDF")
public class PdfGenerator extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 int id = Integer.parseInt(request.getParameter("id"));
    	 String name = request.getParameter("name");
    	response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename="+name+".pdf");
        
        try (OutputStream out = response.getOutputStream()) {
            generatePDF(out,id);
            System.out.println("started");
        } catch (DocumentException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating PDF");
        }
    }

    private void generatePDF(OutputStream out,int id) throws DocumentException, MalformedURLException, IOException {
        Document document = new Document();
        PdfWriter.getInstance(document, out);

        document.open();

        // Add user details to the PDF
        addContent(document,id);

        document.close();
    }

    private void addContent(Document document,int id) throws DocumentException, MalformedURLException, IOException {
      
        StudentDao dao = new StudentDao();
        Student students = dao.findbyId(id);
       document.add(new Paragraph("Student ID: " + students.getId()));
            document.add(new Paragraph("Name: " + students.getName()));
            document.add(new Paragraph("Email: " + students.getEmail()));
            document.add(new Paragraph("Contact: "+ students.getPhoneNo()));
            document.add(new Paragraph("Location: "+ students.getLocation()));
            document.add(new Paragraph("Image :")); 
            byte [] byteArray =  students.getImage();
            Image img = Image.getInstance(byteArray);
            img.scaleToFit(200, 200);
            document.add(img);
        
    }
}
