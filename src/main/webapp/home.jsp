<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.util.Base64"%>
<%@page import="studentdetails.dto.Student"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="home.css">
</head>
<body>
    <%
    List<Student> students = (List<Student>) request.getAttribute("students");
%>
 <div id="al">
        <a href="logout"><button>Logout</button></a>
    </div>
    <h1>student table</h1>
    <table class="rwd-table">
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Password</th>
        <th>Location</th>
        <th>Phoneno</th>
        <th>Email</th>
        <th>Image</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>Download PDF</th>
      </tr>
      <%
                    for(Student student: students) {
                %>
                <tr>
                    <td><%= student.getId() %></td>
                    <td><%= student.getName() %></td>
                    <td><%= student.getPassword() %></td>
                    <td><%= student.getLocation() %></td>
                    <td><%= student.getPhoneNo() %></td>
                    <td><%= student.getEmail() %></td>
                    <td><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(student.getImage()) %>" alt="Product Image"></td>
                    <td><a href="edit?id=<%= student.getId() %>">Edit</a></td>
                    <td><a href="delete?id=<%= student.getId() %>">Delete</a></td>
                    <td><button ><a href ="generatePDF?id=<%= student.getId() %>&&name=<%= student.getName() %>">Download</a></button></td>
                </tr>
                <%
                    }
                %>
      
    </table>
    
   
</body>
</html>