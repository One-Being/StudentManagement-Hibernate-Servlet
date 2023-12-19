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
   background-color: darkcyan;
    height: 100vh;
    width: 207vh;
    background-repeat: no-repeat;
    background-size: cover;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

section{
    width: 700px;
    height: 450px;
    border: 5px solid rgba(20, 151, 140, 0.349);;
    position: relative;
    top: 100px;
    text-align: center;
    left: 300px;
    box-shadow: 3px 0px 50px 10px rgb(20, 92, 151) ;
    border-radius: 30px;
    background-color: rgba(5, 26, 65, 0.349);
    display: flex;
    flex-direction: column;
    gap: 20px;
    justify-content: first baseline;
    align-items: center;
    
    animation-name: starter;
    animation-duration: 2s;
}
@keyframes starter {
    from{
       position: relative;
       top: -400px;
       background-color: azure;
      
       
       
    }
    to{
        position: relative;
        top: 100px;
        
        display: flex;
    }
}

h2{
    font-size: 24px;
    padding-top: 40px;
    padding-bottom: 20px;
    
    
    
}
#ff{
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    gap: 50px;
    
}

.dd{
    text-align: end;
    position: relative;
    left: -20px;

}

input{
    background-color: rgba(240, 248, 255, 0.479);
    border: none;
    padding: 2px;
    border-radius: 5px;
}

a{
    text-decoration: none;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-size: large;
    text-align: center;
    color: tomato;
}

a:active{
    color: yellow;
    
}

#cc{
    position: absolute;
    left: 42.5%;
    top: 20px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-transform: capitalize;
    animation-name: startf;
    animation-duration: 3s;
    
}
@keyframes startf {
    from{
        position: absolute;
        top: -400px;
        display: inline;
       
        
        
     }
     to{
         position: absolute;
         top: 20px;
         display: inline;
         
     }
}

</style>
</head>
<body>

<%String name =(String)request.getAttribute("name"); %>
<%String message =(String)request.getAttribute("message"); %>
<%if(name!=null ){ %>
<div id = "cc"><h1>Hello<%=" "+name %></h1>
<% } %>
<% if(message!= null){ %>
<h1><%= message %></h1>
<% } %></div>
 <main>
        <section>
            <h2>Student Login</h2>
          <form action="login" method="post">
            <div id="ff">
                <div class="dd">
                    <label for="u_fname"> Username :</label>
                    <input type="text" name="name" id="u_fname"  >
                </div>
                <div class="dd">
                    <label for="studid" > EmailId :</label>
                    <input type="email" name="user_email" id="studid" >
                </div>
                <div class="dd">
                    <label for="newpassword">Password :</label>
                    <input type="password" name="password" id="newpassword" >
                </div>
                <input type="submit">
               
                <a href="signup.jsp">Doesn't  Have  Account?Create Account</a>
               </div>
          </form>
        </section>
    </main>
</body>
</html>