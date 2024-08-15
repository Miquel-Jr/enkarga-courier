/*==========================================================

FUNCION VERIFICAR INICIO DE SESION DE USUARIO 
>>verificarLogin()

A traves de parametros usuario & password almacenados en el sessionStorage del navegador, se verifica que el usuario haya iniciado 
sesion para continuar en la pagina.

1) Si el parametro usuario o password es indefinido entonces se muestra el mensaje "Es necesario Iniciar Sesion"

2) Caso contrario se redirige a la pagina principal

==========================================================*/

function verificarLogin() {
  if (
    sessionStorage.usuario != undefined &&
    sessionStorage.password != undefined
  ) {
    window.location = "inicio.php";
  } else {
    console.log("Es necesario iniciar sesión");
  }
}

/*==========================================================

FUNCION VALIDAR DATOS INGRESADOS
>>validar()

1) Se almacenan en las variables user y pass los datos ingresados por el usuario y se verifica que no sean vacios, que la longitud 
del dato no sea igual a 0 y que no se haya ingresado puros espacios.

2) Se verifica que el nombre de usuario y contraseña tengan una longitud minima de 5 y maxima de 40.

3) Se verifica que los datos ingresados sean valores alfanumericos.

4)Si todo es correcto se llama a la funcion Login(), caso contrario se muestra un mensaje acorde al error.

==========================================================*/

function validar() {
  const user = $("#ingresarUsuario").val();
  const pass = $("#ingresarContraseña").val();

  if (user == null || user.length == 0 || /^\s+$/.test(user)) {
    Swal.fire({
      icon: "error",
      title: "ERROR",
      text: "El campo usuario no debe ir vacío o lleno de solamente espacios en blanco",
    });
  } else if (pass == null || pass.length == 0 || /^\s+$/.test(pass)) {
    Swal.fire({
      icon: "error",
      title: "ERROR",
      text: "El campo contraseña no debe ir vacío o lleno de solamente espacios en blanco",
    });
  } else if (user.length < 5 || user.length > 40) {
    Swal.fire({
      icon: "error",
      title: "ERROR",
      text: "Usuario: Tamaño mínimo : 5. Tamaño máximo: 40",
    });
  } else if (pass.length < 5 || pass.length > 40) {
    Swal.fire({
      icon: "error",
      title: "ERROR",
      text: "Contraseña: Tamaño mínimo: 5. Tamaño máximo: 40",
    });
  } else if (/^\w+$/.test(user) && /^\w+$/.test(pass)) {
    console.log("Validación de usuario correcta...");
    console.log("Validación de contraseña correcta...");
    Login(user, pass);
  } else {
    Swal.fire({
      icon: "error",
      title: "ERROR",
      text: "Formato  incorrecto, solo ingresar alfanumericos",
    });
  }
}

/*==========================================================

FUNCION LOGIN
>>Login(usuario, password)

Funcion que recibe los parametros usuario y password y los envia al controlador en el directorio de BackEnd para verificar si el 
usuario se encuentra en la base de datos.

1) Se almacena en el array $usuario los parametros recibidos.

2) Mediante peticiones AJAX, con el metodo POST se envia el array al controlador.

3) Si no se encuentra registros se muestra un mensaje de error.

4) Si se encuentran registros se hace lo siguiente:
    - Si la respuesta recibida es 1 (usuario valido) entonces se guarda en sessionStorage los parametros actuales (usuario y password)
    luego a los inputs se les remueve la clase "red" y se añade la clase "green" y se redirige a la pagina de inicio.
    - Si la respuesta recibida es diferente a 1 entonces a los inputs se les remueve la clase "green" y se añade la clase "red",
    luego se muestra un mensaje de error.
    
==========================================================*/

function Login(usuario, password) {
  console.log("Iniciando sesión...");
  const $usuario = {
    _username: usuario.toLowerCase(),
    _password: password.toLowerCase(),
  };
  $.ajax({
    url: "../EC-BackEnd/Controlador/Controlador_Login.php",
    type: "POST",
    data: $usuario,
    dataType: "json",
    error: function (error) {
      if (error.status == 401) {
        Swal.fire({
          icon: "warning",
          title: "Login",
          text: "Usuario y/o contraseña incorrecta",
        });
      } else {
        Swal.fire({
          icon: "error",
          title: "Error no identificado",
          text: "Contactarse con su proveedor",
        });
      }
    },
    success: function (datos) {
      if (datos.response == 1) {
        sessionStorage.setItem("usuario", usuario);
        sessionStorage.setItem("password", password);
        sessionStorage.setItem("id_personal", datos.datos.id_personal);
        sessionStorage.setItem("id_perfil", datos.datos.id_perfil);
        $("#ingresarUsuario").removeClass("red");
        $("#ingresarUsuario").addClass("green");
        $("#ingresarContraseña").removeClass("red");
        $("#ingresarContraseña").addClass("green");
        obtenerAccesos(datos.datos.id_personal);
      } else {
        $("#ingresarUsuario").removeClass("green");
        $("#ingresarUsuario").addClass("red");
        $("#ingresarContraseña").removeClass("green");
        $("#ingresarContraseña").addClass("red");

        Swal.fire({
          icon: "warning",
          title: "Login",
          text: "Usuario y/o contraseña incorrecto",
        });
      }
    },
  });
}

function obtenerAccesos(id_personal) {
  const $accesos = {
    _idPersonal: id_personal,
  };
  $.ajax({
    url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Accesos/Controlador_ValidarAccesosPersonal.php",
    type: "POST",
    data: $accesos,
    dataType: "json",
    error: function (error) {
      if (error.status == 401) {
        Swal.fire({
          icon: "warning",
          title: "Login",
          text: "Usuario y/o contraseña incorrecta",
        });
      } else {
        Swal.fire({
          icon: "error",
          title: "Error no identificado",
          text: "Contactarse con su proveedor",
        });
      }
    },
    success: function (datos) {
      if(datos.response === 0) {
        Swal.fire({
          icon: "error",
          title: "Permisos",
          text: "El usuario no cuenta con permisos para entrar al portal",
        });
        sessionStorage.clear();
      } else {
        cargarAccesos(datos);
        sessionStorage.setItem("accesos", JSON.stringify(datos));
      }
    },
  });
}

function cargarAccesos(datos) {
  const $accesos = {
    datos,
  };
  $.ajax({
    url: "./Elementos/Accesos.php",
    type: "POST",
    data: $accesos,
    dataType: "json",
    error: function (error) {
      if (error.status == 401) {
        Swal.fire({
          icon: "warning",
          title: "Login",
          text: "Usuario y/o contraseña incorrecta",
        });
      } else {
        Swal.fire({
          icon: "error",
          title: "Error no identificado",
          text: "Contactarse con su proveedor",
        });
      }
    },
    success: function () {
      Swal.fire({
        position: "center",
        title: "<strong>Cargando ...<strong>",
        showConfirmButton: false,
        imageUrl: "Elementos/E-Loading.gif",
        imageWidth: 200,
        imageHeight: 200,
        timer: 2000,
      }).then((result) => {
        if (result.isDismissed) {
          window.location = "inicio.php";
        }
      });
    },
  });
}
