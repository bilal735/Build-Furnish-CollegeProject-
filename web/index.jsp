<%-- 
    Document   : index.jsp
    Created on : 19-Dec-2022, 10:46:46 PM
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
  <title>Build and Furnish</title>
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
//            String your_email=request.getParameter("your_email");
       // HttpSession session=request.getSession();
        try{
                   String url="jdbc:mysql://localhost:3306/collproject?useSSL=false&amp";
                   String user="bilal";
                   String pass="root";
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con=DriverManager.getConnection(url,user,pass);
                   Statement st=con.createStatement();
                 // out.println("<h1>ok</h1>");
                   String q="";
               if(type.equals("user")){
                   q="SELECT login_status FROM ulogin_status_table WHERE(email='"+email+"');";
               }else if(type.equals("worker")){
                   q="SELECT login_status FROM login_status_table WHERE(email='"+email+"');";
               }
               ResultSet rs=st.executeQuery(q);            
            if(rs.next()){
                result=rs.getInt("login_status");
            }
        }catch(Exception e){
                e.printStackTrace();
        }
    %>
    
  <!--Navbar section-->
  <section>
    <nav class="navbar navbar-expand-lg navbar-dark navbar-bg sticky-top shadow-5-strong">
      <div class="container">
        <img class="navbar-heading rounded" src="img/logo2.jfif" alt="Logo" width="30" height="24"
          class="d-inline-block align-text-top" />
        <a class="navbar-brand p-2 fw-bolder" href="#!">Build and Furnish</a>
        <form class="d-flex searchb" role="search" action="SearchServlet" >
                <input class="form-control me-2" type="search" placeholder="Search" name="text" aria-label="Search">
                <button class="btn btn-outline-dark text-white" type="submit">Search</button>
        </form>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
            class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fw-bolder">
            <li class="nav-item"><a class="nav-link active" aria-current="page" href="index">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
            <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
            <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                aria-expanded="false">Manage</a>
              <ul class="dropdown-menu">
                  <%String Fetch="FetchProfile?email="+email+"&type="+type; %>
                <li><a class="dropdown-item" href=<%=Fetch%>>Profile</a></li>
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
  </section>

  <%if(result==1){%>
                <header class="bg-img">
                  <div class="container px-5">
                    <div class="row gx-5 justify-content-center">
                      <div class="col-lg-6">
                        <div class="text-center my-5">
                          <div class="row">
                            <h1 class="display-5 fw-bolder text-black mb-2"><em>"Making your vision Become a reality !!"</em></h1>
                          </div>
                        </div>
                      </div>
                    </div>
                </header>

              <main>
                <section class="black-section">
                  <section class="black-section" id="about">
                    <h1 class="h2-heading mt-4"><em>Who are we ?</em></h1>
                   
                    <div class="mt-3 m-2 px-5 py-5 cover">
                      <img src="img/aboutimg.webp" height="300px" width="900px" alt="">
                    </div>
                    <div class="about-p mx-2 my-2">
                      <p>
                        Our mission is to help increase income opportunities for constractors, Workers and plumbers.
                      </p>

                      <p>
                        India has nearly 70 million construction workers - masons, painters, welders, electricians, plumbers,
                        crane
                        operators, JCB operators, bar benders - doing short gigs across a wide spectrum of projects. Many sectors
                        use
                        them - Real Estate, Factory construction, Power Plants, Infrastructure, etc. More than 30% of these
                        workers
                        are migrant and nomadic.
                      </p>

                      <p>
                        Our mission is to help make this labour market transparent and efficient, thereby helping Contractors find
                        workers more easily, and workers find jobs more conveniently. This venture has the potential to deliver
                        significant social impact and that remains a driving motivation for our team.
                      </p>
                    </div>
                    <section class="black-section mt-5">
                      <div class="row mx-2 my-2">
                        <div class="col-lg-3 mt-5">
                          <img src="img/different.png" height="80%" width="100%" alt="">
                        </div>
                        <div class="col-lg-9">
                          <div class="mt-4 p-4">
                            <h4>What make's us different !</h4>
                            <ol class="mt-5 li-different">
                              <li>Easy, Convenient and Smart procurement for all things construction – services and materials</li>
                              <li>Complete transparency in the procurement cycle</li>
                              <li>An integrated system that manages various contractors, subcontractors and building material
                                suppliers.
                              </li>
                              <li>Access to a large base of SME contractors across India</li>
                              <li>Access to a large base of construction material suppliers across India</li>
                              <li>Easy and impactful Daily Project Reporting and Construction Management</li>
                              <li>One website for all things construction – subcontracting, material procurement, worker hiring,
                                project
                                reporting</li>
                            </ol>
                          </div>
                        </div>
                      </div>

                    </section>
                  </section>
                  <section class="black-section mt-5">
                    <div class="row mx-2 my-2">
                      <div class="col-lg-8 text-p">
                        <h4 class="h2-heading mt-2">THE TOP 5 SKILLS GOOD WORKERS POSSESS</h4>
                        <p class="mt-4"> It can be challenging to find talented workers.Here are few important skills good workers
                          should possess :-
                        </p>
                        <ol>
                          <li>
                            <p><b> Experience </b>– A good construction worker will have several years of experience working on
                              construction sites. Construction is a hands-on profession, and in many cases, the best candidate will
                              have
                              several years of relevant experience. </p>
                          </li>
                          <li>
                            <p><b> Strength / Endurance </b>– Throughout the course of a day, the average construction worker may
                              have
                              to
                              lift or
                              push heavy objects or machinery. People who aren’t physically strong, or lack endurance, may have
                              trouble
                              completing routine construction duties. </p>
                          </li>
                          <li>
                            <p><b>Timeliness </b> – For projects to be completed on time, duties must be completed according to a
                              specific
                              schedule. Therefore, workers should be punctual, arriving at the job site at the appointed time, every
                              time.
                            </p>
                          </li>
                          <li>
                            <p><b> Cooperativeness </b>– Often, construction staff work with other contractors as part of a team.
                              Therefore,
                              interpersonal skills are integral to the success of any project. </p>
                          </li>
                          <li>
                            <p><b> Management / Math knowledge </b> – To some extent, construction staff need to be aware of
                              budgeting
                              and
                              math. Some may be required to shop for necessary project materials without going over budget. Others
                              will
                              need to take measurements and make mathematical conversions. </p>
                          </li>
                        </ol>
                      </div>
                      <div class="col-lg-4 cover">
                        <img class="mt-5" src="img/about2.jpg" height="400vh" width="380vh" alt="">
                      </div>
                    </div>

                  </section>
                </section>
             

                <section class="white-features mt-5" id="features">
                  <div class="container-fluid">
                    <div class="row">
                      <div class="feature-box col-lg-4">
                        <svg class="wide" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                          ! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. 
                          <path
                            d="M323.4 85.2l-96.8 78.4c-16.1 13-19.2 36.4-7 53.1c12.9 17.8 38 21.3 55.3 7.8l99.3-77.2c7-5.4 17-4.2 22.5 2.8s4.2 17-2.8 22.5l-20.9 16.2L512 316.8V128h-.7l-3.9-2.5L434.8 79c-15.3-9.8-33.2-15-51.4-15c-21.8 0-43 7.5-60 21.2zm22.8 124.4l-51.7 40.2C263 274.4 217.3 268 193.7 235.6c-22.2-30.5-16.6-73.1 12.7-96.8l83.2-67.3c-11.6-4.9-24.1-7.4-36.8-7.4C234 64 215.7 69.6 200 80l-72 48V352h28.2l91.4 83.4c19.6 17.9 49.9 16.5 67.8-3.1c5.5-6.1 9.2-13.2 11.1-20.6l17 15.6c19.5 17.9 49.9 16.6 67.8-2.9c4.5-4.9 7.8-10.6 9.9-16.5c19.4 13 45.8 10.3 62.1-7.5c17.9-19.5 16.6-49.9-2.9-67.8l-134.2-123zM96 128H0V352c0 17.7 14.3 32 32 32H64c17.7 0 32-14.3 32-32V128zM48 352c-8.8 0-16-7.2-16-16s7.2-16 16-16s16 7.2 16 16s-7.2 16-16 16zM544 128V352c0 17.7 14.3 32 32 32h32c17.7 0 32-14.3 32-32V128H544zm64 208c0 8.8-7.2 16-16 16s-16-7.2-16-16s7.2-16 16-16s16 7.2 16 16z" />
                        </svg>
                        <h3 class="feature-title">Easy to hire </h3>
                        <p>Convinient booking</p>
                      </div>
                      <div class="feature-box col-lg-4">
                        <svg class="wide" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                          ! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. 
                          <path
                            d="M374.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 178.7l-57.4-57.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l80 80c12.5 12.5 32.8 12.5 45.3 0l160-160zm96 128c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 402.7 86.6 297.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l128 128c12.5 12.5 32.8 12.5 45.3 0l256-256z" />
                        </svg>
                        <h3 class="feature-title">Trustworthy</h3>
                        <p>Authenticated users and workers</p>
                      </div>

                      <div class="feature-box col-lg-4">
                        <svg class="wide" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                          ! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. 
                          <path
                            d="M173.8 5.5c11-7.3 25.4-7.3 36.4 0L228 17.2c6 3.9 13 5.8 20.1 5.4l21.3-1.3c13.2-.8 25.6 6.4 31.5 18.2l9.6 19.1c3.2 6.4 8.4 11.5 14.7 14.7L344.5 83c11.8 5.9 19 18.3 18.2 31.5l-1.3 21.3c-.4 7.1 1.5 14.2 5.4 20.1l11.8 17.8c7.3 11 7.3 25.4 0 36.4L366.8 228c-3.9 6-5.8 13-5.4 20.1l1.3 21.3c.8 13.2-6.4 25.6-18.2 31.5l-19.1 9.6c-6.4 3.2-11.5 8.4-14.7 14.7L301 344.5c-5.9 11.8-18.3 19-31.5 18.2l-21.3-1.3c-7.1-.4-14.2 1.5-20.1 5.4l-17.8 11.8c-11 7.3-25.4 7.3-36.4 0L156 366.8c-6-3.9-13-5.8-20.1-5.4l-21.3 1.3c-13.2 .8-25.6-6.4-31.5-18.2l-9.6-19.1c-3.2-6.4-8.4-11.5-14.7-14.7L39.5 301c-11.8-5.9-19-18.3-18.2-31.5l1.3-21.3c.4-7.1-1.5-14.2-5.4-20.1L5.5 210.2c-7.3-11-7.3-25.4 0-36.4L17.2 156c3.9-6 5.8-13 5.4-20.1l-1.3-21.3c-.8-13.2 6.4-25.6 18.2-31.5l19.1-9.6C65 70.2 70.2 65 73.4 58.6L83 39.5c5.9-11.8 18.3-19 31.5-18.2l21.3 1.3c7.1 .4 14.2-1.5 20.1-5.4L173.8 5.5zM272 192c0-44.2-35.8-80-80-80s-80 35.8-80 80s35.8 80 80 80s80-35.8 80-80zM1.3 441.8L44.4 339.3c.2 .1 .3 .2 .4 .4l9.6 19.1c11.7 23.2 36 37.3 62 35.8l21.3-1.3c.2 0 .5 0 .7 .2l17.8 11.8c5.1 3.3 10.5 5.9 16.1 7.7l-37.6 89.3c-2.3 5.5-7.4 9.2-13.3 9.7s-11.6-2.2-14.8-7.2L74.4 455.5l-56.1 8.3c-5.7 .8-11.4-1.5-15-6s-4.3-10.7-2.1-16zm248 60.4L211.7 413c5.6-1.8 11-4.3 16.1-7.7l17.8-11.8c.2-.1 .4-.2 .7-.2l21.3 1.3c26 1.5 50.3-12.6 62-35.8l9.6-19.1c.1-.2 .2-.3 .4-.4l43.2 102.5c2.2 5.3 1.4 11.4-2.1 16s-9.3 6.9-15 6l-56.1-8.3-32.2 49.2c-3.2 5-8.9 7.7-14.8 7.2s-11-4.3-13.3-9.7z" />
                        </svg>
                        <h3 class="feature-title">Guaranteed work</h3>
                        <p>Best service in time </p>
                      </div>
                    </div>
                  </div>
                </section>


                

                <div class="row align-items-center mt-5">
                  <h2 class="services-section mb-5">Our Services</h2>
                </div>
                <section class="white-section" id="services">
                  <div class="container-fluid">
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="card text-center">
                          <img src="img/c1.jpg" class="card-img-top" alt="contractor">
                          <div class="card-body">
                            <h5 class="card-title">Contractors</h5>
                            <p class="card-text">Search our skills database to find professional contractor profiles local to your
                              area right now.</p>
                            <%String fetchworker="FetchWorkers?type=contractor"; %>
                            <a class="btn btn-primary"  href=<%=fetchworker%> >Hire now</a>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="card text-center">
                          <img
                            src="https://www.plumbingbyjake.com/wp-content/uploads/2015/11/VIGILANT-plumber-fixing-a-sink-shutterstock_132523334-e1448389230378.jpg"
                            class="card-img-top" alt="contractor">
                          <div class="card-body">
                            <h5 class="card-title">Plumbers</h5>
                            <p class="card-text">Search our skills database to find professional plumber profiles local to your
                              area right now.</p>
                            <a href="FetchWorkers?type=plumber" class="btn btn-primary">Hire now</a>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="card text-center">
                          <img
                            src="https://initiafy-website-images.s3.amazonaws.com/wordpress-upload/2016/11/Hero-Whose-Responsibility-Are-Contract-Workers-.jpg"
                            class="card-img-top" alt="contractor">
                          <div class="card-body">
                            <h5 class="card-title">Labour</h5>
                            <p class="card-text">Search our skills database to find skillfull labour profiles local to
                              your area right now.</p>
                            <a href="FetchWorkers?type=labour" class="btn btn-primary">Hire now</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </section>



                
                <section class="white-section text-black mt-5">
                  <div class="container-fluid mt-4 mb-3">
                    <div class="row">
                      <div class="text-center">
                        <h3 class="fw-bolder text-white">What people say about us</h3>
                      </div>
                    </div>
                    <div class="container-fluid mt-5 mb-5">
                      <div class="row g-2">
                        <div class="col-md-4">
                          <div class="card p-3 text-center px-4">
                            <div class="user-image">
                              <img src="https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"
                                class="rounded-circle" width="80">
                            </div>
                            <div class="user-content">
                              <h5 class="mb-2 mt-2">Bruce Hardy</h5>
                              <p class="mt-2">The whole team was a huge help with putting things together for our company
                                and brand. We will be hiring them again in the near future for additional work!</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="card p-3 text-center px-4">
                            <div class="user-image">
                              <img
                                src="https://image.shutterstock.com/mosaic_250/2780032/1606121245/stock-photo-happy-young-indian-woman-blogger-applicant-teacher-sit-at-home-office-look-at-camera-doing-online-1606121245.jpg"
                                class="rounded-circle" width="80">
                            </div>
                            <div class="user-content">
                              <h5 class="mb-2 mt-2">Rachael Smith</h5>
                              <p class="mt-2">Thank you for putting together such a great product. We loved working with you
                                and the whole team, and we will be recommending you to others!</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="card p-3 text-center px-4">
                            <div class="user-image">
                              <img
                                src="https://media.istockphoto.com/id/1009749608/photo/young-woman-portrait-in-the-city.jpg?s=612x612&w=0&k=20&c=nBmdXrCkI6Zz-J1EkCGQAamaYlZeIOQAtKunC4WMT-U="
                                class="rounded-circle" width="80">
                            </div>
                            <div class="user-content">
                              <h5 class="mb-2 mt-2">Liza Duncan</h5>
                              <p class="mt-2">Amazed to see such a great initiative. We loved working with you
                                and the whole team, and we will be recommending you to others!</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    </div>
                </section>


                
                <section class="">
                  <div class="container px-5 my-5 px-5" id="feedback-section">
                    <div class="row">
                      <div class="row gx-5 justify-content-center">
                        <div class="col-lg-6">
                          <div class="text-center mb-5 text-bg-white">
                            <h2 class="h2-heading fw-bolder">Get in touch</h2>
                            <p class="h2-heading lead mb-0">We'd love to have your feedback</p>
                          </div>
                          <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                             Name input
                            <div class="form-floating mb-3">
                              <input class="form-control" id="name" type="text" placeholder="Enter your name..." />
                              <label for="name">Full name</label>
                            </div>
                             Email address input
                            <div class="form-floating mb-3">
                              <input class="form-control" id="email" type="email" placeholder="name@example.com" />
                              <label for="email">Email address</label>
                            </div>
                             Phone number input
                            <div class="form-floating mb-3">
                              <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" />
                              <label for="phone">Phone number</label>
                            </div>
                             Message input
                            <div class="form-floating mb-3">
                              <input class="form-control" id="feedback" type="text" placeholder="Enter your message" />
                              <label for="text">Feedback</label>
                                </div>
                             Submit Button
                            <div class="d-grid"><button class="btn btn-primary btn-lg" id="submitButton"
                                type="submit">Submit</button></div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                  </section>


              


                  <section>
                    <div class="container-fluid">
                      <div class="row">
                        <div class="text-center">
                          <h3 class="fw-bolder text-white">Contact us</h3>
                          <p class="text-white">Our Team</p>
                        </div>
                      </div>
                      <div class="row">
                        <div class="card-group">
                          <div class="col-lg-4">
                            <div class="card opacity-25 card-contact">
                              <div class="card-body">
                                <h5 class="card-title">Tasmiha Waris Khan</h5>
                                <p class="card-text text-center">E-mail :- tasmihakh@gmail.com</p>
                              </div>
                            </div>
                          </div>
                          <div class="col-lg-4">
                            <div class="card opacity-25 card-contact">
                              <div class="card-body">
                                <h5 class="card-title">Mohd Bilal</h5>
                                <p class="card-text text-center">E-mail :- bilalstp@gmail.com</p>
                              </div>
                            </div>
                          </div>
                          <div class="col-lg-4">
                            <div class="card opacity-25 card-contact">
                              <div class="card-body">
                                <h5 class="card-title">Mohd Azam</h5>
                                <p class="card-text text-center">E-mail :- azammoh@gmail.com</p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </section>
                </main>
 <%}else{%>
        <h1 class="display-5 fw-bolder text-white mb-2">something went wrong kindly relogin</h1>
        <a href="login" >please click here</a>
 <%}%>
   <!--Footer -->
  
    
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
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
    </script>
</body>

</html>


