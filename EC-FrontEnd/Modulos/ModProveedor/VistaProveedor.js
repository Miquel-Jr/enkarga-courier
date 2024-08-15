async function obtenerDatosProveedores() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Proveedor/Controlador_MostrarProveedores.php",
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

async function actualizarEstadoProveedor($proveedor) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Proveedor/Controlador_ActualizarEstadoProveedor.php",
      type: "POST",
      data: $proveedor,
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
