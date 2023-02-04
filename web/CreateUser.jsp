<%-- 
    Document   : CreateUser
    Created on : 18-Dec-2022, 6:06:24 PM
    Author     : bilal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="UserTableClass.UserTable" %>
<%@page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>
<%@page import="java.io.*;" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Register</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous"/>
    <!--CSS stylesheet-->
    <link rel="stylesheet" href="css/style.css" type="text/css" />
  </head>
  <body class="bg-back">
    
        <nav class="navbar navbar-expand-lg navbar-dark navbar-bg shadow-5-strong">
          <div class="container">
            <img class="navbar-heading rounded" src="img/logo2.jfif" alt="Logo" width="30" height="24"
              class="d-inline-block align-text-top" />
            <a class="navbar-brand p-2 fw-bolder" href="#!">Build and Furnish</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fw-bolder">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Services</a></li>
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
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4 mt-3">
          <form method="post" action="UserRegistration">
            <fieldset class="border p-3 bg-light rounded-3">
              <legend class="heading"><strong>Create an account
                
              </strong></legend>
              <% String present=(String)request.getAttribute("present");
                            if(present!=null){
              %>
                            <%=present%>
              <%}%>
              <hr class="white">
              <div class="form-group mt-3">
                <label>NAME </label>
                <input type="text" name="user" class="form-control" />
              </div>
              <div class="form-group">
                <label>MOBILE NUMBER </label>
                <input type="text" name="mobile" class="form-control" />
              </div>
              <div class="form-group">
                <label>EMAIL-ID </label>
                <input type="email" name="email" class="form-control" />
              </div>
              <div class="form-group">
                <label>PASSWORD </label>
                <input type="password" name="password" class="form-control" />
              </div>
              <div class="form-group">
                <label>CONFIRM PASSWORD </label>
                <input type="password" name="cpassword" class="form-control" />
              </div>
              <div class="d-flex justify-content-center mt-4">
                <button type="submit"
                  class="btn btn-danger btn-block btn-lg gradient-custom-4 text-body-white">Register</button>
                  <input type="reset" value="Reset" class="btn btn-light p-3">
              </div>
              <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="login.jsp"
                  class="fw-bold text-body"><u>Login here</u></a></p>

            </fieldset>
          </form>
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

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
