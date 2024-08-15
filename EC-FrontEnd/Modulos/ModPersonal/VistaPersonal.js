async function obtenerEstados() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Estados/Controlador_ObtenerEstados.php",
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

async function cargarEstadosUsuario() {
  const datos = await obtenerEstados();
  if (datos.response == "0") {
    const boxEstado = "<option value='' disabled>Elegir Estado</option>";
    $("#estadoUsuario").html(boxEstado);
  } else {
    let boxEstado = "";
    for (const estado of datos) {
      boxEstado += `
          <option value=${estado.id_estado}>
            ${estado.descripcion}
          </option>
        `;
    }
    $("#estadoUsuario").html(boxEstado);
  }
}

async function obtenerPerfilActivo() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Perfil/Controlador_MostrarPerfilActivo.php",
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

async function obtenerPerfil() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Perfil/Controlador_MostrarPerfil.php",
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

async function cargarPerfil() {
  const datos = await obtenerPerfilActivo();
  if (datos.response == "0") {
    const boxPerfil = "<option value='' disabled>Elegir Perfil</option>";
    $("#perfil").html(boxPerfil);
  } else {
    let boxPerfil = "";
    for (const perfil of datos) {
      boxPerfil += `
          <option value=${perfil.id_perfil}>
            ${perfil.descripcion}
          </option>
        `;
    }
    $("#perfil").html(boxPerfil);
  }
}

async function obtenerUsuarioPersonal($usuario) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Usuario/Controlador_CargarUsuarioPersonal.php",
      type: "POST",
      data: $usuario,
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

async function obtenerAccesosPersonal($accesos) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Accesos/Controlador_ValidarAccesosPersonal.php",
      type: "POST",
      data: $accesos,
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
