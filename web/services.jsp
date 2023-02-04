<%-- 
    Document   : services
    Created on : 17-Dec-2022, 1:43:14 PM
    Author     : bilal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="UserTableClass.UserTable" %>
<%@page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>
<%@page import="java.io.*;" %>
 <% ArrayList<UserTable> ar=new ArrayList<>();  
  ar=(ArrayList<UserTable>)request.getAttribute("data"); 
          int ctr=0;
          int count_ctr=0;
 %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Services</title>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
  <link rel="stylesheet" href="css/style.css" />
</head>

<body class="bg-black">

    <!-- navbar -->

    <nav class="navbar navbar-expand-lg navbar-dark navbar-bg sticky-top shadow-5-strong">
      <div class="container">
        <img class="navbar-heading rounded" src="img/logo2.jfif" alt="Logo" width="30" height="24"
          class="d-inline-block align-text-top" />
        <a class="navbar-brand p-2 fw-bolder" href="index">Build and Furnish</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
            class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fw-bolder">
            <li class="nav-item"><a class="nav-link" aria-current="page" href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
            <li class="nav-item"><a class="nav-link active" href="services.html">Services</a></li>
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
  <header>
  <section>
      <div>
    <h1 class="Services-heading mt-3 mb-3">SERVICES WE OFFER</h1>
    </div>
  </section>
  </header>
  <main>
    
    <!--Contractors-->

        <section>


              <% 
//                String your_email=(String)request.getParameter("your_email");
                for(int i=0;i<ar.size();i++){
                     int count=0;
                     String specialization=(ar.get(i)).specialization;
              %>
                    <div class="section" id="contractors">
                        <legend class="sub-heading mb-3"><strong><%=specialization%></strong></legend>
                    </div>
                    <div class="row"> 
                        <div class="card-group card text-center card border-primary mb-3" style="max-width: 100rem">                
                            <%while(i<ar.size()){
                                String name=(ar.get(i)).name;
                                String email=(ar.get(i)).email;
                                String password=(ar.get(i)).password;
                                int work_experience=(ar.get(i)).work_experience;
                                    
                            %>
                                <%// if(specialization.equals("contractor")){%>
                                  <div class="card" style="max-width: 400px">
                                      <img class="card-img-top" src="img/contractor2.jfif" height="150px" width="50px" alt="contractor" />
                                      <div class="card-body card text-center">
                                        <h4 class="card-title"><%=name%></h4>
                                        <p class="card-text">
                                            Specialization:- <%=specialization%><br>
                                            Work Experience:- <%=work_experience%><br>
                                            Email:- <%=email%><br>
                                                <% count_ctr++; %>
                                        </p>
                                        <% String booking="booking?name="+name+"&email="+email+"&specialization="+specialization; %>
                                        <a class="btn btn-primary" href=<%=booking%>>Book now</a>
                                      </div>
                                  </div>
                                <%//}%>
                            <% 

                                count++;
                                if(count>3){
                                  break;
                                }
                                i++;
                            }
                            %>

                        </div>
                  </div>
              <%}%>  

         </section>  
  </main>

  <!--  footer -->
  
   <footer class="black-section" id="footer">
            <div class="footer fw-bolder mt-5"><br>
                <div class="container-fluid">
                    <p>© Copyright 2022 </p>
                    <p>Build and Furnish</p>
                </div>
            </div>
        </footer>
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
    crossorigin="anonymous"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
    crossorigin="anonymous"></script>
</body>

</html>