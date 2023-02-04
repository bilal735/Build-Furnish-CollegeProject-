<%-- 
    Document   : Appointments
    Created on : 20-Dec-2022, 2:24:52 PM
    Author     : bilal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.lang.*" %>
<%@page import="UserTableClass.UserTable" %>
<%@page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.IOException" %>
<%@page import="java.io.IOException" %>
<%@page import="jakarta.servlet.*" %>
<%@page import="jakarta.servlet.ServletException" %>
<%@page import="jakarta.servlet.http.HttpServlet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="jakarta.servlet.http.HttpSession;" %>

<!doctype html>
<html lang="en">

<head>
    <title>Appointment details</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS v5.2.1 -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous"/>
  <!--CSS stylesheet-->
  <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body class="bg-back">
    <%
        int result=-1;
        String email=(String)session.getAttribute("email");
            String type=(String)session.getAttribute("type");
       // HttpSession session=request.getSession();
        try{
           
       
              //  ServletContext context=getServletContext();
                   String url="jdbc:mysql://localhost:3306/collproject?useSSL=false&amp";
                   String user="bilal";
                   String pass="root";
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con=DriverManager.getConnection(url,user,pass);
                   Statement st=con.createStatement();
                 // out.println("<h1>ok</h1>");
               String q="";
               String fetch="";
               if(type.equals("user")){
                   q="SELECT login_status FROM ulogin_status_table WHERE(email='"+email+"');";
                   fetch="SELECT * FROM uuser_table WHERE(email='"+email+"');";
               }else if(type.equals("worker")){
                   q="SELECT login_status FROM login_status_table WHERE(email='"+email+"');";
                   fetch="SELECT * FROM user_table WHERE(email='"+email+"');";
               }
               ResultSet rs=st.executeQuery(q);  
              // ResultSet fdata=st.fetchData(st,fetch);  
               
            if(rs.next()){
                result=rs.getInt("login_status");
            }
        }catch(Exception e){
                e.printStackTrace();
        }
    %>
    <main>
        <!--Navbar section-->
        <nav class="navbar navbar-expand-lg navbar-dark navbar-bg sticky-top shadow-5-strong">
            <div class="container">
                <img class="navbar-heading rounded" src="img/logo2.jfif" alt="Logo" width="30px" height="24px"
                    class="d-inline-block align-text-top" />
                <a class="navbar-brand p-2 fw-bolder" href="index">Build and Furnish</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fw-bolder">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="index">Home</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="index2.html">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="index2.html">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="index2.html">Services</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">Manage</a>
                            <ul class="dropdown-menu">
                                 <li><a class="dropdown-item" href="Profile.html">Profile</a></li>
                                    <%String Appoi="Appointments?email="+email+"&type="+type; %>
                                 <li><a class="dropdown-item" href=<%=Appoi%>>Appointments</a></li>
                                   <%String logout="logout?email="+email+"&type="+type; %>
                                 <li><a class="dropdown-item" href=<%=logout%>>Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <main>
            <section class="white-features container px-5 py-5 mx-5 my-5 appointment">
                <div class="row container-fluid">
                    <div>
                        <h1>Your Appointment Details </h1>
                    </div>
                   <div>
                        <table class="table mt-4">
                            <thead>
                                <tr>
                                    <th scope="col">SERIAL NO.</th>
                                    <th scope="col">NAME</th>
                                    <th scope="col">EMAIL</th>
                                    <th scope="col">MOBILE NUMBER</th>
                                    <th scope="col">SCHEDULE_FROM</th>
                                    <th scope="col">SCHEDULE_TO</th>
                                    <th scope="col">ADDRESS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Example of entry-->
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Tasmiha</td>
                                    <td>tasmihakh@gmail.com</td>
                                    <td>123456</td>
                                    <td>21-12-2022</td>
                                    <td>23-12-2022</td>
                                    <td>Hazratganj</td>
                                    
                                </tr>
                        </table>
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</body>

</html>