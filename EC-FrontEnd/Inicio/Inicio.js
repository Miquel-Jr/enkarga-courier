/*==========================================================

ACCIONES A REALIZAR AL CARGAR LA PAGINA

1) Verificar que el usuario haya iniciado sesion.
    -Se evaluan que los parametros usuario y password sean validos
    
2) Si la sesion es valida ajustar los menues lateral y superior segun 
el tamaño de la pantalla.

==========================================================*/

var original = window.innerWidth;
var intervalo = setInterval("", 1000);

$(document).ready(function () {
  if (
    sessionStorage.usuario != undefined &&
    sessionStorage.password != undefined
  ) {
    validarPerfiles();
  } else {
    window.location = "index.php";
  }
});

$(window).resize(function () {
  if (window.innerWidth > 991) {
    // ## agregar clase
    $("#barraIzq").addClass("show");
  } else {
    // ## eliminar clase
    $("#barraIzq").removeClass("show");
  }
});

/*==========================================================

  VALIDAR PERFILES

==========================================================*/

function validarPerfiles() {
  // Perfil Administracion
  if (sessionStorage.id_perfil === "1") {
    ventanaPrincipal();
  } else {
    const accesos = JSON.parse(sessionStorage.accesos);
    var sessionLog = false;
    Object.keys(accesos).map((item) => {
      if (item === "clientes" && accesos[item] == "1" && !sessionLog) {
        sessionLog = true;
        ventanaClienteListar();
      } else if (item === "proveedor" && accesos[item] == "1" && !sessionLog) {
        sessionLog = true;
        ventanaProveedorListar();
      } else if (item === "personal" && accesos[item] == "1" && !sessionLog) {
        sessionLog = true;
        ventanaPersonalListar();
      } else if (
        item === "operaciones" &&
        accesos[item] == "1" &&
        !sessionLog
      ) {
        sessionLog = true;
        ventanaGuiaListar();
      } else if (
        item === "contabilidad" &&
        accesos[item] == "1" &&
        !sessionLog
      ) {
        sessionLog = true;
        ventanaFacturaListar();
      }
    });
  }
}

/*==========================================================

FUNCION DESHABILITAR RETROCESO
>>deshabilitaRetroceso()

Funcion que deshabilitar el boton retroceder del navegador.

==========================================================*/

function deshabilitaRetroceso() {
  window.location.hash = "no-back-button";
  window.location.hash = "Again-No-back-button"; //chrome
  window.onhashchange = function () {
    window.location.hash = "no-back-button";
  };
}

/*==========================================================

FUNCION LIMPIAR SESION
>>limpiarSesion()

Funcion que permite borrar los datos de la sesion almacenada en el sessionStorage

==========================================================*/

function limpiarSesion() {
  $.ajax({
    url: "./Elementos/Accesos.php",
    type: "POST",
    data: {},
    dataType: "json",
    error: function (error) {
      console.error(error);
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
      Swal.fire({
        position: "center",
        title: "<strong>Se esta cerrando la session <strong>",
        showConfirmButton: false,
        imageUrl: "Elementos/E-Loading.gif",
        imageWidth: 200,
        imageHeight: 200,
        timer: 2000,
      }).then((result) => {
        if (result.isDismissed) {
          sessionStorage.clear();
          window.location = "index.php";
        }
      });
    },
  });
}

/*==========================================================

FUNCION PARA MOSTRAR HORARIO LOCAL

==========================================================*/

function clock() {
  var time = new Date(),
    hours = time.getHours(),
    minutes = time.getMinutes(),
    seconds = time.getSeconds();

  document.querySelectorAll(".clock")[0].innerHTML =
    harold(hours) + ":" + harold(minutes) + ":" + harold(seconds);

  function harold(standIn) {
    if (standIn < 10) {
      standIn = "0" + standIn;
    }
    return standIn;
  }
}

/*==========================================================

FUNCION PARA MOSTRAR MENSAJE

==========================================================*/

function mostrarMensajeOpcion(tipo, msj) {
  switch (tipo) {
    case "exito":
      $(".toast").html("<i class='fas fa-check fa-lg pr-2'></i>" + msj);
      $(".toast").css("background-color", "#00c851");
      $(".toast").toast("show");
      $(".toast").addClass("visualizar");
      break;
    case "error":
      $(".toast").html("<i class='fas fa-times fa-lg pr-2'></i>" + msj);
      $(".toast").css("background-color", "#ff3547");
      $(".toast").toast("show");
      $(".toast").addClass("visualizar");
      break;
    case "advertencia":
      $(".toast").html("<i class='fas fa-exclamation fa-lg pr-2'></i>" + msj);
      $(".toast").css("background-color", "#fb3");
      $(".toast").toast("show");
      $(".toast").addClass("visualizar");
      break;
  }
}

/*==========================================================

FUNCION PARA LLAMAR A LA VISTA PRINCIPAL

==========================================================*/

function ventanaPrincipal() {
  $.ajax({
    url: "Modulos/ModPrincipal/VistaPrincipal.html",
    success: function (data) {
      $("#cuerpo").html(data);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA CLIENTE - NUEVO

==========================================================*/

function ventanaClienteCrear() {
  $.ajax({
    url: "Modulos/ModClientes/NuevoCliente.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA CLIENTE - LISTADO

==========================================================*/

function ventanaClienteListar() {
  $.ajax({
    url: "Modulos/ModClientes/ListadoClientes.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA CLIENTE SUCURSAL - LISTADO

==========================================================*/

function ventanaClienteSucursalListar() {
  $.ajax({
    url: "Modulos/ModClientes/ListadoClientesSucursales.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA CLIENTE - ACTUALIZAR

==========================================================*/

function ventanaClienteActualizar() {
  $.ajax({
    url: "Modulos/ModClientes/ActualizarClientes.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PROVEEDOR - NUEVO

==========================================================*/

function ventanaProveedorCrear() {
  $.ajax({
    url: "Modulos/ModProveedor/NuevoProveedor.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PROVEEDOR - LISTADO

==========================================================*/

function ventanaProveedorListar() {
  $.ajax({
    url: "Modulos/ModProveedor/ListadoProveedor.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PROVEEDOR - ACTUALIZAR

==========================================================*/

function ventanaProveedorActualizar() {
  $.ajax({
    url: "Modulos/ModProveedor/ActualizarProveedor.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PERSONAL - NUEVO

==========================================================*/

function ventanaPersonalCrear() {
  $.ajax({
    url: "Modulos/ModPersonal/NuevoPersonal.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PERSONAL - LISTADO

==========================================================*/

function ventanaPersonalListar() {
  $.ajax({
    url: "Modulos/ModPersonal/ListadoPersonal.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PERSONAL - ACTUALIZAR

==========================================================*/

function ventanaPersonalActualizar() {
  $.ajax({
    url: "Modulos/ModPersonal/ActualizarPersonal.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PERSONAL - ACCESOS

==========================================================*/

function ventanaAccesosPersonal() {
  $.ajax({
    url: "Modulos/ModPersonal/AccesosPersonal.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PRODUCTO - NUEVO

==========================================================*/

function ventanaProductoCrear() {
  $.ajax({
    url: "Modulos/ModProductos/NuevoProducto.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PRODUCTO - LISTADO

==========================================================*/

function ventanaProductoListar() {
  $.ajax({
    url: "Modulos/ModProductos/ListadoProductos.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PRODUCTO - ACTUALIZAR

==========================================================*/

function ventanaProductoActualizar() {
  $.ajax({
    url: "Modulos/ModProductos/ActualizarProducto.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PRODUCTO - ENTRADA

==========================================================*/

function ventanaProductoRegistrarEntrada() {
  $.ajax({
    url: "Modulos/ModProductos/RegistrarEntrada.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA PRODUCTO - LISTADO ENTRADA

==========================================================*/

function ventanaProductoListarEntrada() {
  $.ajax({
    url: "Modulos/ModProductos/ListadoEntrada.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA GUIA - NUEVO

==========================================================*/

function ventanaGuiaCrear() {
  $.ajax({
    url: "Modulos/ModGuia/NuevaGuia.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA GUIA - LISTA

==========================================================*/

function ventanaGuiaListar() {
  $.ajax({
    url: "Modulos/ModGuia/ListadoGuia.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA GUIA - ACTUALIZAR

==========================================================*/

function ventanaGuiaActualizar() {
  $.ajax({
    url: "Modulos/ModGuia/ActualizarGuia.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA GUIA - SEGUIMIENTO

==========================================================*/

function ventanaGuiaSeguimiento() {
  $.ajax({
    url: "Modulos/ModGuia/SeguimientoGuia.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA REPORTE - PERSONAL

==========================================================*/

function ventanaReportePersonal() {
  $.ajax({
    url: "Modulos/ModGuia/ReportePersonal.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA CONTABILIDAD - CREAR

==========================================================*/

function ventanaFacturaCrear() {
  $.ajax({
    url: "Modulos/ModContabilidad/NuevaFactura.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA CONTABILIDAD - FACTURA - LISTADO

==========================================================*/

function ventanaFacturaListar() {
  $.ajax({
    url: "Modulos/ModContabilidad/ListadoFactura.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA CONTABILIDAD - FACTURA - ACTUALIZAR

==========================================================*/

function ventanaFacturaActualizar() {
  $.ajax({
    url: "Modulos/ModContabilidad/ActualizarFactura.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA CONTABILIDAD - FACTURA - ACTUALIZAR

==========================================================*/

function ventanaDepositoListar() {
  $.ajax({
    url: "Modulos/ModContabilidad/ListadoDeposito.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA CONTABILIDAD - NOTA DE CREDITO - LISTAR

==========================================================*/

function ventanaNotaCreditoListar() {
  $.ajax({
    url: "Modulos/ModContabilidad/ListadoNotaCredito.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

/*==========================================================

FUNCION PARA LLAMAR LA VISTA CONTABILIDAD - FACTURA TRANSPORTE - LISTAR

==========================================================*/

function ventanaGuiaFacturaListar() {
  $.ajax({
    url: "Modulos/ModContabilidad/ListadoFacturaTransporte.html",
    success: function (data) {
      $("#cuerpo").html(data);
      clearInterval(intervalo);
    },
  });
}

function obtenerMayuscula(variable) {
  variable.value = variable.value.toUpperCase();
}

function obtenerMinuscula(variable) {
  variable.value = variable.value.toLowerCase();
}

function autoCompletarCeros(variable) {
  variable.value = variable.value.toString().padStart(8, "0");
}
