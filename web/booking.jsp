<%-- 
    Document   : booking
    Created on : 20-Dec-2022, 10:57:49 PM
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
    <title>Appointment details</title>
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
            <a class="navbar-brand p-2 fw-bolder" href="index">Build and Furnish</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fw-bolder">
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="index2.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">Manage</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="Profile.html">Profile</a></li>
                            <li><a class="dropdown-item" href="Appointments.html">Appointments</a></li>
                        </ul>
                </ul>
            </div>
        </div>
    </nav>

    <main>
        <section class="mt-5 mb-5">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4 mt-3">
                <% String q="Payment?email="+(String)request.getParameter("email")+"&name="+(String)request.getParameter("name")+"&specialization="+(String)request.getParameter("specialization"); %>
                        <form method="post" action="<%=q%>">
                            <fieldset class="border p-3 bg-light rounded-3">
                                <legend class="heading"><strong>Appointment details

                                    </strong></legend>

                                <hr class="white">
                                <div class="form-group mt-2 mb-2">
                                    <label for="name"> <strong>Contractor</strong></label>
                                </div>
                                <div class="form-group">
                                    <label>Schedule From</label>
                                    <input type="date" name="schedule_from" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>Schedule Till</label>
                                    <input type="date" name="schedule_till" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" name="address" class="form-control" />
                                </div>
                                <div class="form-group mt-3">
                                    <div class="input-group">
                                        <span class="input-group-text">Required for </span>
                                        <textarea class="form-control" aria-label="With textarea" name="text_area"></textarea>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center mt-4">
                                    <input type="submit" value="Proceed To Payment" class=" mt-3 btn btn-danger">
                                    <input type="reset" value="Reset" class="btn btn-light ">
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    <div class="col-lg-4"></div>
                </div>
            </div>
        </section>
    </main>


    <footer>
        <section>
            <div class="footer fw-bolder"><br>
                <div class="container-fluid">
                    <p>© Copyright 2022 </p>
                    <p>Build and Furnish</p>
                </div>
            </div>
        </section>
    </footer>

     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
    </script>
</body>

</html>
