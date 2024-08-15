<!DOCTYPE html>
<html lang="en">

<head>

  <!--TITULO DE LA VISTA -->
  <title>Sistema Web - Encarga Courier S.A.C.</title>

  <!--***************************************
		 INCLUIR CONTENIDO GENERAL DEL HEAD 
	 ***************************************-->
  <?php include_once "Elementos/head.php"; ?>

  <!--MIS ESTILOS-->
  <link rel="stylesheet" href="Index/index.css">
  <style>
    .password-container {
      position: relative;
    }

    .password-toggle-icon {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
    }

    .form-control {
      padding-right: 30px;
    }
  </style>
</head>


<body onload="verificarLogin()">

  <!--***************************************
         CONTENIDO GENERAL DE LA PAGINA
     ***************************************-->

  <div class="login">

    <!----IMAGEN CON LOGO DE LA EMPRESA--->
    <img src="Elementos/E-Logo.png" class="img-fluid mx-auto" alt="Logo de Enkarga Courier S.A.C.">

    <!----FORMULARIO DE INGRESO DE DATOS--->
    <form method="post" class="principal p-5">

      <!---- INGRESAR USUARIO---->
      <div class="md-form">
        <i class="fas fa-user prefix white-text"></i>
        <input type="text" id="ingresarUsuario" class="form-control validate white-text" name="usuario" minlength="5" maxlength="40" required pattern="[A-Za-z0-9]+" title="Letras y números. Tamaño mínimo: 5. Tamaño máximo: 40" aria-describedby="addon-wrapping">
        <label class="white-text" for="ingresarUsuario" data-error="Invalido" data-success="Correcto">Usuario</label>
      </div>

      <!---- INGRESAR CONTRASEÑA---->
      <div class="md-form">
        <i class="fas fa-lock prefix white-text"></i>
        <input type="password" id="ingresarContraseña" class="form-control validate white-text" name="password" minlength="5" maxlength="40" required>
        <span class="password-toggle-icon" onclick="visualizarPasswordLogin()"><i class="fas fa-eye"></i></span>
        <label class="white-text" for="ingresarContraseña" data-error="Invalido" data-success="Correcto">Contraseña</label>
      </div>

      <!---- BOTON INGRESAR SESION---->
      <div class="text-center">
        <input class="btn btn-md font-weight-bold" type="button" value="Iniciar Sesión" id="iniciarSesion" onClick="validar()">
      </div>

    </form>
    <small>*Antes de ingresar, por favor escribir su nombre de usuario y contraseña</small>
  </div>

  <?php include_once "Elementos/scripts.php"; ?>

  <!--MIS ARCHIVOS JS-->

  <script type="text/javascript" src="Index/index.js"></script>

  <!--FUNCION SALTO DE LINEA AL PRESIONAR EL BOTON ENTER-->
  <script>
    $("#ingresarUsuario").on('keydown', function(e) {
      if (e.which == 13) {
        document.getElementById('ingresarContraseña').focus();
        return false;
      }
    });
    $("#ingresarContraseña").on('keydown', function(e) {
      if (e.which == 13) {
        $("#iniciarSesion").trigger('click');
        return false;
      }
    });

    function visualizarPasswordLogin() {
      var x = document.getElementById("ingresarContraseña");
      if (x.type === "password") {
        x.type = "text";
      } else {
        x.type = "password";
      }
    }
  </script>

</body>

</html>