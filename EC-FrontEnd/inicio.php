<!DOCTYPE html>
<html lang="en">

<head>

  <!--TITULO DE LA VISTA -->
  <title>Sistema EC - Encarka Courier S.A.C.</title>

  <!--***************************************
         INCLUIR CONTENIDO GENERAL DEL HEAD 
     ***************************************-->
  <?php include_once "Elementos/head.php"; ?>

  <!--MIS ESTILOS-->
  <link rel="stylesheet" href="Inicio/inicio.css">
</head>

<body onload="deshabilitaRetroceso()">

  <!--***************************************
         CONTENIDO GENERAL DE LA PAGINA
    ***************************************-->

  <?php session_start(); ?>
  <?php include_once "Elementos/barraNavegacion.php"; ?>

  <div id="contenido" class="col-12 col-lg-9 col-xl-10">
    <div class="tab-content" id="nav-tabContent">
      <div class="tab-pane fade show active" id="cuerpo" role="tabpanel">

        ...

      </div>

    </div>
  </div>

  <?php include_once "Elementos/scripts.php"; ?>

  <!--MIS ARCHIVOS JS-->
  <script src="Bootstrap/js/moment.min.js"></script>
  <script src="Inicio/Inicio.js" language="Javascript"></script>
</body>

</html>