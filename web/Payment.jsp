<%-- 
    Document   : Payment
    Created on : 21-Dec-2022, 3:58:59 PM
    Author     : bilal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Payments</title>
  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous"/>
  <!--CSS stylesheet-->
  <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body class="bg-back">
    <% 
        String schedule_from=request.getParameter("schedule_from");
            String schedule_till=request.getParameter("schedule_till");
            String service=request.getParameter("specialization");
            String text_area=request.getParameter("text_area");
            String your_address=request.getParameter("address");
            String email=request.getParameter("email");
            String name=request.getParameter("name");
            
    %>

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
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="index">Home</a></li>
<!--                    <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>-->
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
        <section class="mt-5">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-5 payment_form">
                        <form method="post" action="">
                            <fieldset class="border p-3 bg-light rounded-3">
                                <legend class="heading"><strong> Payment

                                    </strong></legend>

                                <hr class="white">
                                <div class="form-group mt-2 mb-2">
                                    <label for="name"> <strong>Select payment method</strong></label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault"
                                        id="flexRadioDefault1">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Pay after work
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault"
                                        id="flexRadioDefault2">
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        Pay online
                                    </label>
                                </div>
                                <div class="d-flex justify-content-center mt-4">
                                    <% String q="InsertAppointment?email="+(String)request.getParameter("email")+"&name="+(String)request.getParameter("name")+"&your_address="+(String)request.getParameter("address")+"&specialization="+(String)request.getParameter("specialization")+"&text_area="+(String)request.getParameter("text_area")+"&schedule_from="+(String)request.getParameter("schedule_from")+"&schedule_till="+(String)request.getParameter("schedule_till"); %>
                                    <a href=<%=q%>><button type="button"
                                            class="btn btn-danger btn-block btn-md gradient-custom-4 text-body-white">Done
                                        </button></a>
                                    <input type="reset" value="Reset" class="btn btn-light ">
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    <div class="col-lg-7 container-fluid px-3 py-3 ml-3 align-items-center" id="payment">
                        <img src="img/Qr.png" alt="" height="auto" width="auto">
                    </div>
                </div>
            </div>
        </section>


    </main>





    <footer class="black-section footerHome" id="footer">
            <div class="footer fw-bolder mt-5"><br>
                <div class="container-fluid">
                    <p>© Copyright 2022 </p>
                    <p>Build and Furnish</p>
                </div>
            </div>
        </footer>

   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
    </script>
</body>

</html>