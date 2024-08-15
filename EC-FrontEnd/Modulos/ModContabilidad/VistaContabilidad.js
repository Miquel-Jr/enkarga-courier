async function obtenerEstadosFactura() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Estados/Controlador_ObtenerEstadosFactura.php",
      type: "GET",
      dataType: "json",
      success: function (datos) {
        resolve(datos); // Resuelve la promesa con los datos
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarDisponibilidadFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Factura/Controlador_CargarDisponibilidadFactura.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarGuiasFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia/Controlador_CargarGuiasFactura.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarGuiasSinFactura() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia/Controlador_CargarGuiasSinFactura.php",
      type: "GET",
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function registrarDatosFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Factura/Controlador_RegistrarFactura.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function registrarDatosGuiasFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Factura/Controlador_RegistrarFacturaGuia.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function eliminarDatosGuiasFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Factura/Controlador_EliminarFacturaGuia.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarListadoFacturas() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Factura/Controlador_CargarListadoFacturas.php",
      type: "GET",
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function eliminarFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Factura/Controlador_EliminarFactura.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarDatosFacturaId($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Factura/Controlador_CargarDatosFacturaId.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function actualizarEstadoFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Factura/Controlador_ActualizarEstadoFactura.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarDatosGuiaId($guia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia/Controlador_CargarGuiaId.php",
      type: "POST",
      data: $guia,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function actualizarFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Factura/Controlador_ActualizarFactura.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function registrarDeposito($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Deposito/Controlador_RegistrarDeposito.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function actualizarDeposito($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Deposito/Controlador_ActualizarDeposito.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function eliminarFacturaDeposito($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Deposito/Controlador_EliminarDeposito.php",
      type: "POST",
      data: $factura,
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarListadoFacturasDeposito() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Deposito/Controlador_CargarListadoDeposito.php",
      type: "GET",
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarDepositoIdFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Deposito/Controlador_CargarDepositoIdFactura.php",
      type: "POST",
      data: $factura, 
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function registrarNotaCredito($notaCredito) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Nota_Credito/Controlador_RegistrarNotaCredito.php",
      type: "POST",
      data: $notaCredito, 
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function actualizarNotaCredito($notaCredito) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Nota_Credito/Controlador_ActualizarNotaCredito.php",
      type: "POST",
      data: $notaCredito, 
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function eliminarNotaCredito($notaCredito) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Nota_Credito/Controlador_EliminarNotaCredito.php",
      type: "POST",
      data: $notaCredito, 
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarNotaCreditoIdFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Nota_Credito/Controlador_CargarNotaCreditoIdFactura.php",
      type: "POST",
      data: $factura, 
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarListadoNotaCredito() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Nota_Credito/Controlador_CargarListadoNotaCredito.php",
      type: "GET", 
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarListadoGuiaTransporte() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Transporte/Controlador_CargarListadoGuiaTransporte.php",
      type: "GET", 
      dataType: "json",
      success: function (datos) {
        resolve(datos);
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}

async function cargarListadoClienteSucursales($cliente) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_MostrarListadoClienteSucursal.php",
      type: "POST",
      data: $cliente,
      dataType: "json",
      success: function (datos) {
        resolve(datos); // Resuelve la promesa con los datos
      },
      error: function (error) {
        if (error.status == 401) {
          Swal.fire({
            icon: "error",
            title: "Error del servidor",
            text: "No se pudo establecer conexion con el servidor",
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Error no identificado",
            text: "Contactarse con su proveedor",
          });
        }
        reject(error);
      },
    });
  });
}