<%-- 
    Document   : LandingPage
    Created on : 19-Dec-2022, 3:01:45 PM
    Author     : bilal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <title>Landing page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS v5.2.1 -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous"/>
  <!--CSS stylesheet-->
  <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body class="landing-page">

  <!--Navbar section-->
  <nav class="navbar navbar-expand-lg navbar-dark navbar-bg shadow-5-strong">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <img class="navbar-heading rounded" src="img/logo2.jfif" alt="Logo" width="30px" height="24px"
        class="d-block align-text-top" />
        Build and Furnish
      </a>
    </div>
  </nav>
    <!-- <div class="container-fluid">
      <img class="navbar-heading rounded" src="/img/logo2.jfif" alt="Logo" width="30px" height="24px"
        class="d-block align-text-top" />
      <a class="navbar-brand fw-bolder" href="#!">Build and Furnish</a>
    </div> -->

  <main>
    <section class="mb-5">
      <div class="row text-white">
        <div class="col-lg-4 ">
<!--           <img src="img/loginImage.jpg" height="600vh" width="800vw" alt="">  -->
        </div>
        <div class="col-lg-4 mt-5">
          <fieldset class="navbar-bg mb-5">
            <div class="px-3 py-3 mx-3 my-3 text-center mb-3">
              <h3>
                <legend class="fw-bold px-4">To continue on our website login or register</legend>
              </h3>
            </div>
            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center mt-5">
              <a class="btn btn-primary btn-md px-4 me-sm-3" href="CreateUser">Create an account</a>
              <a class="btn btn-light btn-md px-4" href="login">Login</a>
            </div>
            <div class="row mt-4 px-3 py-3 mx-3 my-3 text-center mb-3">
              <h3 class="fw-bold px-4"><em>Want to get hired?</em></h3>
              <div class="d-flex justify-content-center gap-3 d-sm-flex justify-content-sm-center mt-3 ">
                <a class="btn btn-primary btn-md px-4 me-sm-2" href="CreateWorker">Join now</a>
              </div>
            </div>
          </fieldset>
        </div>
        <div class="col-lg-4">
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
  <!-- Bootstrap JavaScript Libraries -->

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
    </script>
</body>
</html>
