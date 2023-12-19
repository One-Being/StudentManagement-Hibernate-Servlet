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
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student Details</title>
    <style>
        html, body {
            height: 100%;
        }

        body {
            margin: 0;
            background: linear-gradient(45deg, #49a09d, #5f2c82);
            font-family: sans-serif;
            font-weight: 100;
        }

        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        table {
            width: 800px;
            border-collapse: collapse;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 15px;
            background-color: rgba(255,255,255,0.2);
            color: #fff;
        }

        th {
            text-align: left;
        }

        thead {
            th {
                background-color: #55608f;
                text-transform: uppercase;
            }
        }

        tbody {
            tr {
                &:hover {
                    background-color: rgba(255,255,255,0.3);
                }
            }
            td {
                position: relative;
                &:hover {
                    &:before {
                        content: "";
                        position: absolute;
                        left: 0;
                        right: 0;
                        top: -9999px;
                        bottom: -9999px;
                        background-color: rgba(255,255,255,0.2);
                        z-index: -1;
                    }
                }
            }
        }

        a {
            text-decoration: none;
        }

        button {
            padding: 10px;
            background-color: rgb(82,113,146);
            color: white;
        }
        #al{
        	position: absolute;
        	left: 1270px;
        	
        }
    </style>

</head>
<body>
    <%
        List<Student> students = (List<Student>) request.getAttribute("students");
    %>
	 <div id="al">
            <a href="logout"><button>Logout</button></a>
        </div>
    <div class="container">
        <table align="center">
            <thead>
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
            </thead>
            <tbody>
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
            </tbody>
        </table>
       
    </div>
</body>
</html>
