<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="dist/css/stylelog.css">
    <script src=" JS/scripts.js"></script>

    <title>PetCare</title>
    <!--Fuentes-->

    <!--iconos font awesome-->
    <script src="https://kit.fontawesome.com/4a0ceb78c8.js" crossorigin="anonymous"></script>



</head>

<body>
 <!-- Encabezado de la web-->
 <header>
    <div class="container-fluid encabezado">    
     <nav>
        <div class="row">

            <div class="col-4">
              <a class="navbar-brand" href=>
                 <img src="dist/img/media/logo.png" alt="" id="logo">
             </a>
            </div>

            <div class="col-8">
               <ul class="navbar-nav list-group-horizontal list-group-flush list-inline ml-auto">
                    <li class="nav-item list-group-item list-inline-item elementoMenu">
                        <a class="nav-link active " aria-current="page" href="#">Inicio</a>
                    </li>
                    <li class="nav-item list-group-item list-inline-item elementoMenu">
                         <a class="nav-link active " aria-current="page" href="#">Nosotros</a>
                    </li>
                    <li class="nav-item list-group-item list-inline-item elementoMenu">
                        <a class="nav-link active " aria-current="page" href="#">Servicios</a>
                    </li>

                    <li class="nav-item dropdown list-group-item list-inline-item elementoMenu">
                        <a class="nav-link dropdown-toggle " href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Acceso</a>
                        <ul class="dropdown-menu list-inline">
                            <li class="elementoMenu"><a class="dropdown-item list-inline-item " href="#">Sign up</a></li>
                            <li class="elementoMenu"><a class="dropdown-item list-inline-item " href="#">Log in</a></li>
                        </ul>
                    </li>
                    <li class="nav-item list-group-item list-inline-item elementoMenu">
                        <a class="nav-link active " aria-current="page" href="#">Contacto</a>
                    </li>
                </ul>
            </div>
        </div>

        </nav>

        <div class="row">
            <div class="col-12 tituloEncabezado">PetCare</div>
            <div class="col-12 subtituloEncabezado">Todo lo que tu mascota necesita</div>
        </div>
    </div>
</header>

<!-- Sección sobre nosotros-->
<section id="nosotros">
<div class="container-fluid nosotros">
    <div class="row">
        <div class="col-12 "><h2 class="text-center tituloSeccion">Sobre nosotros</h2></div>
    </div>
    <div class="row seccion">
      
        <div class="col-6">
            <p class="subtitulo">Conoce a nuestro equipo de profesionales:</p>
            <img src="dist/img/media/equipo.jpeg" class="imGal" alt="equipo_PetCare">
            <p class="textoImg">¡Estan aquí para ayudarte a tí y a tu mascota!</p>

        </div>
        <div class="col-6 ">
            <p class="texto">Somos un equipo de profesionales veterinarios, con más de 20 años de experiencia en el sector, por lo que sabemos que es lo que necesitan los dueños de mascotas hoy en día. Recibe recordatorios de desparasitaciones, vacunas, visitas al veterinario o peluquero, mantén un registro médico completo, realiza un seguimiento de la higiene y compártelo todo con sus cuidadores.</p>
        </div>

    </div>
</div>
</section>

<!-- info sobre los servicios que presta la web-->
<section id="servicios">
  <div class="container-fluid servicios">
    <div class="row">
        <div class="col-12 "><h2 class="text-center tituloSeccion azul">Servicios</h2></div>
    </div>
    <div class="row seccion">
        <div class=" col-4 card">
          <img class="card-img-top" src="dist/img/media/general.jpg" alt="Seguimiento_vacunas">
            <div class="card-body">
                <p class="texto-card">Información general</p>
            </div>
        </div>
        <div class=" col-4 card">
          <img class="card-img-top" src="dist/img/media/peso.jpg" alt="Seguimiento_peso">
            <div class="card-body">
                <p class="texto-card">Seguimiento de peso</p>
            </div>
        </div>
        <div class=" col-4 card">
          <img class="card-img-top" src="dist/img/media/citas.jpg" alt="Seguimiento_citas">
            <div class="card-body">
                <p class="texto-card">Seguimiento citas veterinarias</p>
            </div>
        </div>  
        <div class=" col-4 card" >
          <img class="card-img-top" src="dist/img/media/vacunacion.jpg" alt="Seguimiento_medicacion">
            <div class="card-body">
                <p class="texto-card">Calendario de vacunación</p>
            </div>
        </div>
        <div class=" col-4 card">
          <img class="card-img-top" src="dist/img/media/tratamiento.jpg" alt="Seguimiento_vacunas">
            <div class="card-body">
                <p class="texto-card">Seguimiento de tratamiento</p>
            </div>
        </div>
        <div class=" col-4 card">
          <img class="card-img-top" src="dist/img/media/desparasitario.jpg" alt="Seguimiento_vacunas">
            <div class="card-body">
                <p class="texto-card">Control de desparasitación</p>
            </div>
        </div>
        <div class=" col-4 card">
          <img class="card-img-top" src="dist/img/media/alimentacion.jpg" alt="Seguimiento_vacunas">
            <div class="card-body">
                <p class="texto-card">Alimentación</p>
            </div>
        </div>
        <div class=" col-4 card">
          <img class="card-img-top" src="dist/img/media/analisis.jpg" alt="Seguimiento_vacunas">
            <div class="card-body">
                <p class="texto-card">Ánalisis y pruebas de imagen </p>
            </div>
        </div>         
    </div>
      
  </div>

</section>

<!-- Sección de contacto-->
<section id="contacto">
<div class="container-fluid nosotros">
    <div class="row">
        <div class="col-12 "><h2 class="text-center tituloSeccion">Envíanos un mensaje:</h2></div>
    </div>
    <div class="row seccion">
      
        <div class="col formulario">
            <p class="textoCont">¿Tienes dudas? Envíanos un mensaje y nuestro equipo se pondrá en contacto contigo lo más rápido posible</p>
            <form>
                <div class="row seccion ">
                    <div class="col-3">
                    <label for="etiquetaFormulario">Nombre</label>
                      <input type="text" class="form-control" placeholder="María">
                    </div>

                    <div class="col-3">
                    <label for="email">Apellido</label>
                      <input type="text" class="form-control" placeholder="Pérez">
                    </div>
                </div>

                <div class="row seccion">
                    <div class="col-3">
                        <label for="email">Dirección email</label>
                        <input type="email" class="form-control" id="Input1" placeholder="name@example.com">
                    </div>

                    <div class="col-3">
                        <label for="exampleFormControlSelect1">¿Cuántas mascotas tienes?</label>
                        <select class="form-control" id="exampleFormControlSelect1">
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5 o más</option>
                        </select>
                    </div>

                </div> 

                <div class="row seccion">
                    <div class="col-6">
                    <label for="exampleFormControlTextarea1">Cuéntanos lo que necesites:</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div> 
                </div>  

                <div class="row seccion">
                    <div class="col-6">
                      <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                      <label class="form-check-label" for="defaultCheck1">
                        Acepto el envío de información por parte del equipo de PetCare
                    </label>
                    </div>
                <div class="row seccion">
                    <div class="col-1">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </div>
                    
                </div>
                </div>

            </form>

        </div>

    </div>
</div>
</section>


<!-- Footer de la web, donde aparece los iconos de RRSS-->
<footer id="footer" class=" text-center text-white">
  <div class="container p-4 pb-0">

    <section class="mb-4">
      <!-- Facebook -->
      <a class="btn  btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-facebook-f"></i
      ></a>

    <!-- Instagram -->
      <a class="btn  btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-instagram"></i
      ></a>

      <!-- Google -->
      <a class="btn btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-google"></i
      ></a>

      <!-- Linkedin -->
      <a class="btn  btn-floating m-1" href="#!" role="button"
        ><i class="fab fa-linkedin-in"></i
      ></a>

    </section>

  </div>
 
  <div class="text-center p-3 subFooter">
    © 2023 Copyright:
    <a class="text-white" href="">Petcare.com</a>
  </div>
  
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>