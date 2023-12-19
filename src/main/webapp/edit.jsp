<%@page import="studentdetails.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
*{
    margin: 0;
}
main{
    background-image: url("Himalayas.jpg");
    height: 100vh;
    width: 207vh;
    background-repeat: no-repeat;
    background-size: cover;
}

section{
    width: 700px;
    height: 600px;
    border: 5px solid rgba(20, 151, 140, 0.349);;
    position: relative;
    top: 20px;
    text-align: center;
    left: 300px;
    box-shadow: 3px 0px 50px 10px rgb(20, 151, 140) ;
    border-radius: 10px;
    background-color: rgba(20, 151, 140, 0.349);
    display: flex;
    flex-direction: column;
    gap: 0px;
    justify-content: first baseline;
    align-items: center;
}
h2{
    font-size: 24px;
    padding-top: 40px;
    padding-bottom: 20px;
    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
    text-shadow: 1px 1px 1px ;
    color: rgba(255, 228, 196, 0.192);
    font-style: italic;
    text-decoration: underline;
    
    
}
#no{
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    gap: 35px;
    
}

.s{
    text-align: end;
}

input{
    background-color: rgba(240, 248, 255, 0.479);
    border: none;
    padding: 2px;
}

a{
    text-decoration: none;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-size: large;
    text-align: center;
}


</style>
</head>
<body>
    <main>
        <section>
            <h2>Signup</h2>
             <% Student s = (Student) request.getAttribute("students"); %>
		<form action="update" method = "post" enctype="multipart/form-data">
           <div id="no">
           <div class="s">
                    <label for="u_id">Student Id :</label>
                    <input type = "number" name = "id" id="u_id" readonly="true" value=<%= s.getId()  %>>
                </div>
                <div class="s">
                    <label for="u_fname">Student Username :</label>
                    <input type="text" name="name" id="u_fname" value=<%= s.getName() %> >
                </div>
                <div class="s" >
                    <label for="conpassword"> Password :</label>
                    <input type="password" name="password" id="conpassword" value=<%= s.getPassword() %> >
                </div>
                <div class="s">
                    <label for="studid">Student EmailId :</label>
                    <input type="email" name="email" id="studid"  value=<%= s.getEmail() %> >
                </div>
                <div class="s">
                    <label for="Location">Location :</label>
                    <input type="text" name="location" id="Location" value=<%= s.getLocation() %> >
                </div>
                <div class="s">
                    <label for="phone">Phone Number :</label>
                    <input type="number" name="phoneno" id="phoneno" value=<%= s.getPhoneNo() %> >
                </div>
                <div class="s">
                    <label for="image"></label>
                    <input type="file" name="image" id="image" >
                </div> 
                 <input type = "submit">

           </div>
           </form>
        </section>
    </main>
    
</body>
</html>