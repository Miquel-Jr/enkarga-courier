async function cargarEstadosGuia() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Estados_Guia/Controlador_ObtenerEstadosGuia.php",
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

async function cargarEstadosGuiaTransporte() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Estados_Guia/Controlador_ObtenerEstadosGuiaTransporte.php",
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

async function cargarListadoGuia($filtros) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia/Controlador_MostrarGuias.php",
      type: "POST",
      data: $filtros,
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

async function cargarListadoGuiaVigentes() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia/Controlador_MostrarGuiasVigentes.php",
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

async function actualizarEstadoIdGuia($guia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia/Controlador_ActualizarEstadoIdGuia.php",
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

async function actualizarDatosGuia($guia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia/Controlador_ActualizarDatosGuia.php",
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

async function cargarDatosGuia($guia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia/Controlador_CargarGuia.php",
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

async function cargarDatosClientesActivos() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_MostrarClientesActivos.php",
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

async function cargarDatosTransportistasActivos() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Personal/Controlador_MostrarTransportistasActivos.php",
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

async function cargarDatosDepartamentos() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Departamento/Controlador_ObtenerDepartamento.php",
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

async function cargarDatosProvincia($departamento) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Provincia/Controlador_ObtenerProvincia.php",
      type: "POST",
      data: $departamento,
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

async function cargarDatosProvinciaId($provincia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Provincia/Controlador_ObtenerProvinciaId.php",
      type: "POST",
      data: $provincia,
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

async function cargarDatosDistrito($provincia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Distrito/Controlador_ObtenerDistrito.php",
      type: "POST",
      data: $provincia,
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

async function cargarDatosDistritoId($distrito) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Distrito/Controlador_ObtenerDistritoId.php",
      type: "POST",
      data: $distrito,
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

async function cargarDatosProductosActivos() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Producto/Controlador_MostrarProductosActivos.php",
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

async function registrarGuia($guia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia/Controlador_RegistrarGuia.php",
      type: "POST",
      data: $guia,
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

async function registrarGuiaDetalle($guiaDetalle) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Detalle/Controlador_RegistrarGuiaDetalle.php",
      type: "POST",
      data: $guiaDetalle,
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

async function actualizarIdGuiaEntradaProducto($guiaDetalle) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Entrada_Producto/Controlador_ActualizarIdGuiaEntradaProducto.php",
      type: "POST",
      data: $guiaDetalle,
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

async function eliminarGuiaDetalle($guiaDetalle) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Detalle/Controlador_EliminarGuiaDetalle.php",
      type: "POST",
      data: $guiaDetalle,
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

async function cargarGuiaDetalleIdGuia($guia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Detalle/Controlador_CargarGuiaDetalleIdGuia.php",
      type: "POST",
      data: $guia,
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

async function cargarGuiaDetalles($guiaDetalles) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Detalle/Controlador_CargarGuiaDetalles.php",
      type: "POST",
      data: $guiaDetalles,
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

async function registrarGuiaProducto($guiaDetalle) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Producto/Controlador_RegistrarGuiaProducto.php",
      type: "POST",
      data: $guiaDetalle,
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

async function eliminarGuiaProducto($guiaDetalleProducto) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Producto/Controlador_EliminarGuiaProducto.php",
      type: "POST",
      data: $guiaDetalleProducto,
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

async function eliminarGuiaProductoIdGuiaDetalle($guiaDetalle) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Producto/Controlador_EliminarGuiaProductoIdDetalle.php",
      type: "POST",
      data: $guiaDetalle,
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

async function cargarGuiaProductoDetalle($guiaDetalle) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Producto/Controlador_CargarGuiaProductoDetalle.php",
      type: "POST",
      data: $guiaDetalle,
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

async function actualizarEstadoActivoGuiaProducto($guiaDetalle) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Producto/Controlador_ActualizarEstadoActivoGuiaProducto.php",
      type: "POST",
      data: $guiaDetalle,
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

async function actualizarGuiaDetallexId($guiaDetalle) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Detalle/Controlador_ActualizarGuiaDetalle.php",
      type: "POST",
      data: $guiaDetalle,
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

async function actualizarGuiaDetallexIdGuia($guia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Detalle/Controlador_ActualizarGuiaDetalleIdGuia.php",
      type: "POST",
      data: $guia,
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

async function cargarProductosFacturasDisponibles() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Entrada_Producto/Controlador_MostrarFacturasDisponibles.php",
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

async function cargarEntradaFactura($factura) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Entrada_Producto/Controlador_CargarEntradaFactura.php",
      type: "POST",
      data: $factura,
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

async function registrarSeguimientoGuia($guia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Seguimiento_Guia/Controlador_RegistrarSeguimientoGuia.php",
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

async function cargarDatosSeguimientoGuia($guia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Seguimiento_Guia/Controlador_CargarSeguimientoGuia.php",
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

async function cargarlistadoSeguimientoGuia() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Seguimiento_Guia/Controlador_ListadoSeguimientoGuia.php",
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

async function cargarDatosGuiaTransporteIdGuia($guia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Transporte/Controlador_CargarDatosGuiaTransporteIdGuia.php",
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

async function registrarDatosGuiaTransporte($guiaTransporte) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Transporte/Controlador_RegistrarGuiaTransporte.php",
      type: "POST",
      data: $guiaTransporte,
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

async function actualizarDatosGuiaTransporte($guiaTransporte) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia_Transporte/Controlador_ActualizarGuiaTransporte.php",
      type: "POST",
      data: $guiaTransporte,
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

async function cargarReportePersonal($guiaReporte) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModGenerales/Controlador_Guia/Controlador_CargarReportePersonal.php",
      type: "POST",
      data: $guiaReporte,
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

async function cargarProveedoresActivos() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Proveedor/Controlador_MostrarProveedoresActivos.php",
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


