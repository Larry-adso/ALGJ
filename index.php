<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

<head>
  <title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Poppins:300,300i,400,500,600,700,800,900,900i%7CPT+Serif:400,700">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/fonts.css">
  <link rel="stylesheet" href="style.css">
  <style>
    .ie-panel {
      display: none;
      background: #212121;
      padding: 10px 0;
      box-shadow: 3px 3px 5px 0 rgba(0, 0, 0, .3);
      clear: both;
      text-align: center;
      position: relative;
      z-index: 1;
    }

    html.ie-10 .ie-panel,
    html.lt-ie-10 .ie-panel {
      display: block;
    }
  </style>
</head>

<body>
  <div class="ie-panel"><a href="http://windows.microsoft.com/en-US/internet-explorer/"><img src="images/ie8-panel/warning_bar_0000_us.jpg" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."></a></div>
  <div class="preloader">
    <div class="preloader-body">
      <div class="cssload-container">
        <div class="cssload-speeding-wheel"></div>
      </div>
      <p>Loading...</p>
    </div>
  </div>
  <div class="page">
    <!-- Page Header-->
    <header class="section page-header">
      <!-- RD Navbar-->
      <div class="rd-navbar-wrap">
        <nav class="rd-navbar rd-navbar-classic" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-lg-device-layout="rd-navbar-static" data-xl-layout="rd-navbar-static" data-xl-device-layout="rd-navbar-static" data-lg-stick-up-offset="46px" data-xl-stick-up-offset="46px" data-xxl-stick-up-offset="46px" data-lg-stick-up="true" data-xl-stick-up="true" data-xxl-stick-up="true">
          <div class="rd-navbar-main-outer">
            <div class="rd-navbar-main">
              <!-- RD Navbar Panel-->
              <div class="rd-navbar-panel">
                <!-- RD Navbar Toggle-->
                <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap"><span></span></button>
                <!-- RD Navbar Brand-->
                <div class="rd-navbar-brand"><a href="index.html"><img class="brand-logo-light" src="images/logo-default1-140x57.png" alt="" width="140" height="57" srcset="images/logo-default-280x113.png 2x" /></a></div>
              </div>
              <div class="rd-navbar-main-element">
                <div class="rd-navbar-nav-wrap">
                  <!-- RD Navbar Nav-->
                  <ul class="rd-navbar-nav">
                    <li class="rd-nav-item active"><a class="rd-nav-link" href="index.php">INICIO</a>
                    </li>
                    <li class="rd-nav-item"><a class="rd-nav-link" href="about-us.php">SOBRE NOSOTROS</a>
                    </li>
                    <li class="rd-nav-item"><a class="rd-nav-link" href="contacts.php">CONTACTENOS</a>
                    </li>
                  </ul><a class="button button-white button-sm" href="modulo_larry/PHP/login.php">Iniciar Sesión</a>
                </div>
              </div><a class="button button-white button-sm" href="modulo_larry/PHP/login.php">Iniciar Sesión</a>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- Swiper-->
    <section class="section section-lg section-main-bunner section-main-bunner-filter text-center">
      <div class="main-bunner-img" style="background-image: url(&quot;images/contador.jpg&quot;); background-size: cover;"></div>
      <div class="main-bunner-inner">
        <div class="container">
          <div class="box-default">
            <h1 class="box-default-title">Gestión laboral con precisión:</h1>
            <div class="box-default-decor"></div>
            <p class="big box-default-text">Simplifica el cálculo, optimiza la administración y libera tiempo para lo que realmente importa: ¡Nóminas sin complicaciones, resultados con excelencia!</p>
          </div>
        </div>
      </div>
    </section>
    <div class="bg-gray-1">
      <section class="section-transform-top">
        <div class="container">
          <div class="box-booking">
            <form class="rd-form rd-mailform booking-form">
              <div>
                <p class="booking-title">Nombre</p>
                <div class="form-wrap">
                  <input class="form-input" id="booking-name" type="text" name="name" data-constraints="@Required">
                  <label class="form-label" for="booking-name">Tu nombre</label>
                </div>
              </div>
              <div>
                <p class="booking-title">Telefono</p>
                <div class="form-wrap">
                  <input class="form-input" id="booking-phone" type="text" name="phone" data-constraints="@Numeric">
                  <label class="form-label" for="booking-phone">Tu numero de telefono</label>
                </div>
              </div>
              <div>
                <p class="booking-title">Fecha actual</p>
                <div class="form-wrap form-wrap-icon"><span class="icon mdi mdi-calendar-text"></span>
                  <input class="form-input" id="booking-date" type="text" name="date" data-constraints="@Required" data-time-picker="date">
                </div>
              </div>
              <div>
                <p class="booking-title">Fecha ultimo pago</p>
                <div class="form-wrap form-wrap-icon"><span class="icon mdi mdi-calendar-text"></span>
                  <input class="form-input" id="booking-date" type="text" name="date" data-constraints="@Required" data-time-picker="date">
                </div>
              </div>
              <div>
                <button class="button button-lg button-gray-600" type="submit">Procesar</button>
              </div>
            </form>
          </div>
        </div>
      </section>
    </div>
    <!-- Featured Offers-->
    <section class="section section-lg bg-default">
      <div class="container">
        <div class="row justify-content-center text-center">
          <div class="col-md-9 col-lg-7 wow-outer">
            <div class="wow slideInDown">
              <h2>Lo que nuestro software te ofrece</h2>
              <p class="text-opacity-80">Nuestro software de nóminas simplifica la gestión del personal, desde el cálculo de salarios hasta la generación de informes. Olvídate de los errores y las complicaciones administrativas. Con nosotros, la gestión laboral es fácil y precisa.</p>
            </div>
          </div>
        </div>
        <div class="row row-20 row-lg-30">
          <div class="col-md-6 col-lg-4 wow-outer">
            <div class="wow fadeInUp">
              <div class="product-featured">
                <div class="product-featured-figure"><img src="images/contador2.jpg" alt="" width="370" height="395" />
                  <div class="product-featured-button"></div>
                </div>
                <div class="product-featured-caption">
                  <h4><a class="product-featured-title" href="#">Cálculo preciso y automatizado</a></h4>

                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 wow-outer">
            <div class="wow fadeInUp">
              <div class="product-featured">
                <div class="product-featured-figure"><img src="images/contador3.jpg" alt="" width="370" height="395" />
                  <div class="product-featured-button"></div>
                </div>
                <div class="product-featured-caption">
                  <h4><a class="product-featured-title" href="#">Gestión eficiente de registros de empleados</a></h4>

                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 wow-outer">
            <div class="wow fadeInUp">
              <div class="product-featured">
                <div class="product-featured-figure"><img src="images/contador1.jpg" alt="" width="370" height="395" />
                  <div class="product-featured-button"></div>
                </div>
                <div class="product-featured-caption">
                  <h4><a class="product-featured-title" href="#">Informes detallados para cumplimiento normativo</a></h4>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <footer class="section footer-minimal context-dark">
      <div class="container wow-outer">
        <div class="wow fadeIn">
          <div class="row row-60">
            <div class="col-12"><a href="index.html"><img src="images/logo-default1-140x57.png" alt="" width="140" height="57" srcset="images/logo-default-280x113.png 2x" /></a></div>
            <div class="col-12">
              <ul class="footer-minimal-nav">
                <li><a href="#">Menu</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="contacts.html">Contacts</a></li>
                <li><a href="#">Gallery</a></li>
                <li><a href="about-us.html">About</a></li>
              </ul>
            </div>
            <div class="col-12">
              <ul class="social-list">
                <li><a class="icon icon-sm icon-circle icon-circle-md icon-bg-white fa-facebook" href="#"></a></li>
                <li><a class="icon icon-sm icon-circle icon-circle-md icon-bg-white fa-instagram" href="#"></a></li>
                <li><a class="icon icon-sm icon-circle icon-circle-md icon-bg-white fa-twitter" href="#"></a></li>
                <li><a class="icon icon-sm icon-circle icon-circle-md icon-bg-white fa-youtube-play" href="#"></a></li>
                <li><a class="icon icon-sm icon-circle icon-circle-md icon-bg-white fa-pinterest-p" href="#"></a></li>
              </ul>
            </div>
          </div>
          <p class="rights"><span>&copy;&nbsp; </span><span class="copyright-year"></span><span>&nbsp;</span><span>Pesto</span><span>.&nbsp;</span><span>All Rights Reserved.</span><span>&nbsp;</span><a href="#">Privacy Policy</a>. Design&nbsp;by&nbsp;<a href="https://www.templatemonster.com">Templatemonster</a></p>
        </div>
      </div>
    </footer>
  </div>
  <div class="snackbars" id="form-output-global"></div>
  <script src="js/core.min.js"></script>
  <script src="js/script.js"></script>
   
</body>

</html>