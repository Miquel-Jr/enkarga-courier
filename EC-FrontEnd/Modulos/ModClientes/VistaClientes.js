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

async function cargarEstados() {
  const datos = await obtenerEstados();
  if (datos.response == "0") {
    const boxEstado = "<option value='' disabled>Elegir Estado</option>";
    $("#estado").html(boxEstado);
  } else {
    let boxEstado = "";
    for (const estado of datos) {
      boxEstado += `
          <option value=${estado.id_estado}>
            ${estado.descripcion}
          </option>
        `;
    }
    $("#estado").html(boxEstado);
  }
}

async function obtenerTipoDocumento() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_TipoDocumento/Controlador_ObtenerTipoDocumento.php",
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

async function cargarTipoDocumentos() {
  const datos = await obtenerTipoDocumento();
  if (datos.response == "0") {
    const boxTipoDocumento =
      "<option value='' disabled>Elegir Tipo Documento</option>";
    $("#tipoDocumento").html(boxTipoDocumento);
  } else {
    let boxTipoDocumento = "";
    for (const estado of datos) {
      boxTipoDocumento += `
            <option value=${estado.tipo_documento}>
              ${estado.descripcion}
            </option>
          `;
    }
    $("#tipoDocumento").html(boxTipoDocumento);
  }
}

async function obtenerDepartamento() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Departamento/Controlador_ObtenerDepartamento.php",
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

async function cargarDepartamento(id_departamento) {
  const datos = await obtenerDepartamento();
  if (datos.response == "0") {
    const boxDepartamento =
      "<option value='' selected disabled>Elegir Departamento </option>";
    $("#departamento").html(boxDepartamento);
  } else {
    let boxDepartamento = `<option value='' ${
      id_departamento ? "" : "selected"
    } disabled>Elegir Departamento </option>`;
    boxDepartamento = boxDepartamento.concat(
      datos
        .map(
          (departamento) => `
      <option value="${departamento.id_departamento}" ${
            id_departamento === departamento.id_departamento ? "selected" : ""
          }>
        ${departamento.descripcion}
      </option>
    `
        )
        .join("")
    );
    $("#departamento").html(boxDepartamento);
  }
  $("#departamento").select2();
}

async function obtenerProvincia($provincia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Provincia/Controlador_ObtenerProvincia.php",
      type: "POST",
      data: $provincia,
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

async function obtenerProvinciaId($provincia) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Provincia/Controlador_ObtenerProvinciaId.php",
      type: "POST",
      data: $provincia,
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

async function cargarProvincia(idDepartamento, idProvincia) {
  if (!idDepartamento) {
    const boxProvincia =
      "<option value='' selected disabled>Elegir Provincia </option>";
    $("#provincia").html(boxProvincia);
    $("#provincia").select2();
    return true;
  }

  const datos = await obtenerProvincia({
    _idDepartamento: idDepartamento,
  });
  if (datos.response == "0") {
    const boxProvincia = "<option value='' disabled>Elegir Provincia </option>";
    $("#provincia").html(boxProvincia);
  } else {
    let selected = idProvincia ? "" : "selected";
    let boxProvincia = `<option value='' ${selected} disabled>Elegir Provincia </option>`;
    for (const provincia of datos) {
      if (idProvincia === provincia.id_provincia) {
        boxProvincia += `
          <option selected
           value=${provincia.id_provincia}>
            ${provincia.descripcion}
          </option>
        `;
      } else {
        boxProvincia += `
          <option value=${provincia.id_provincia}>
            ${provincia.descripcion}
          </option>
        `;
      }
    }
    $("#provincia").html(boxProvincia);
  }
  $("#departamento").select2();
  $("#provincia").select2();
}

async function obtenerDistrito($distrito) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Distrito/Controlador_ObtenerDistrito.php",
      type: "POST",
      data: $distrito,
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

async function obtenerDistritoId($distrito) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Distrito/Controlador_ObtenerDistritoId.php",
      type: "POST",
      data: $distrito,
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

async function cargarDistrito(idProvincia, idDistrito) {
  if (!idProvincia) {
    const boxDistrito =
      "<option value='' selected disabled>Elegir Distrito </option>";
    $("#distrito").html(boxDistrito);
    $("#distrito").select2();
    return true;
  }
  const datos = await obtenerDistrito({
    _idProvincia: idProvincia,
  });
  if (datos.response == "0") {
    const boxDistrito = "<option value='' disabled>Elegir Distrito </option>";
    $("#distrito").html(boxDistrito);
  } else {
    let selected = idDistrito ? "" : "selected";
    let boxDistrito = `<option value='' ${selected} disabled>Elegir Distrito </option>`;
    for (const distrito of datos) {
      if (idDistrito === distrito.id_distrito) {
        boxDistrito += `
          <option selected value=${distrito.id_distrito}>
            ${distrito.descripcion}
          </option>
        `;
      } else {
        boxDistrito += `
          <option value=${distrito.id_distrito}>
            ${distrito.descripcion}
          </option>
        `;
      }
    }
    $("#distrito").html(boxDistrito);
  }
  $("#distrito").select2();
}

async function cargarDatosListadoClientes() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_MostrarClientes.php",
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

async function cargarDatosListadoClientesSucursales() {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_MostrarClientesSucursales.php",
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

async function cargarDatosCliente($cliente) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_CargarCliente.php",
      type: "POST",
      data: $cliente,
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

async function validarCliente($cliente) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_ValidarCliente.php",
      type: "POST",
      data: $cliente,
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

async function actualizarCliente($cliente) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_ActualizarCliente.php",
      type: "POST",
      data: $cliente,
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

async function actualizarEstadoCliente($cliente) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_ActualizarEstadoCliente.php",
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

async function mostradoListadoSucursal($cliente) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_MostrarListadoSucursal.php",
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

async function eliminarListadoSucursal($cliente) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_EliminarSucursal.php",
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

async function registrarListadoSucursalCliente($cliente) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: "../EC-BackEnd/Controlador/ModMaestros/Controlador_Clientes/Controlador_RegistrarSucursal.php",
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