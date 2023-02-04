<%-- 
    Document   : login
    Created on : 18-Dec-2022, 6:15:07 PM
    Author     : bilal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>
<%@page import="java.io.*;" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous" />
<!--    <link rel="stylesheet" href="CSS/style.css" />-->
    <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body class="bg-back">
    <!--include nav bar page here -->

    <nav class="navbar navbar-expand-lg navbar-dark navbar-bg sticky-top shadow-5-strong">
      <div class="container">
        <img class="navbar-heading rounded" src="img/logo2.jfif" alt="Logo" width="30" height="24"
          class="d-inline-block align-text-top" />
        <a class="navbar-brand p-2 fw-bolder" href="#!">Build and Furnish</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
            class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fw-bolder">
            <li class="nav-item"><a class="nav-link" aria-current="page" href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
            <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Manage</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Manage account</a></li>
              <li><a class="dropdown-item" href="#">Manage bookings</a></li>
            </ul>
          </ul>
        </div>
      </div>
    </nav>

    <section class="mt-5 mb-5">
  <div class="ccontainer-fluid">
    <div class="row mt-3">
      <div class="col-lg-4"></div>
      <div class="col-lg-4 mt-5">
        <fieldset class="border p-3 bg-light rounded-3">
          <legend class="heading"><strong>Login </strong></legend>
           <% String email=(String)request.getAttribute("email"); %>
                        <% String password=(String)request.getAttribute("password"); %>
                        <% String message=(String)request.getAttribute("message"); %>
                        <% String either=(String)request.getAttribute("data"); %>
                        <% String type=(String)request.getAttribute("type"); %>
                        <% String action="LoginServlet?user_email="+email; %>
          <form method="post" action=<%=action %> >
                    <div class="form-group mt-3">
                      <input type="radio" name="type" value="user"> User &nbsp &nbsp &nbsp
                      <input type="radio" name="type" value="worker"> Worker &nbsp &nbsp &nbsp
<!--                      <input type="radio" name="admin"> Admin -->
                    </div>
                    <hr class="white">
                    <div class="form-group">
                       
                       <% if(either!=null){%>
                       <h4><%=either%></h4><br>
                       <%}%> 
                      <label>E-mail </label>
                      <input type="text" name="email" class="form-control" <%if(email!=null){%>value=<%=email%><%}%>/>
                    </div>
                    <div class="form-group">
                      <label>Password </label>
                      <input type="password" name="password" class="form-control" <%if(password!=null){%>value=<%=password%><%}%>/>
                    </div>
                    <% if(message!=null){
                       out.println("<a href=VarifyServlet?email="+email+"&type="+type+">"+message+"</a>");
                    }%>
                    <div class="form-group">
                      <input type="submit" value="Login" class=" mt-3 btn btn-danger">
                      <input type="reset" value="Reset" class="mt-3 btn btn-light">
                    </div>
                    <div class="form-group mt-3">
                      <p class="text-center text-muted mt-5 mb-0">Don't have an account?<a href="CreateUser.jsp"
                        class="fw-bold text-body"><u>Register here</u></a></p>
                    </div>
           </form>
        </fieldset>
      </div>
      <div class="col-lg-4"></div>
    </div>
  </div>
</section>


 
     
        <footer class="black-section footerHome" id="footer">
            <div class="footer fw-bolder mt-5"><br>
                <div class="container-fluid">
                    <p>© Copyright 2022 </p>
                    <p>Build and Furnish</p>
                </div>
            </div>
        </footer>
  

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
    crossorigin="anonymous"></script>
</body>

</html>