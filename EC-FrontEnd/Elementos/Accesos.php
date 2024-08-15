<?php
session_start();

// Comprobar si se ha enviado un valor desde sessionStorage
if (isset($_POST['datos'])) {
  // Obtener los datos de sessionStorage enviados desde el cliente
  $datos = $_POST['datos'];

  // Almacenar los datos en la variable de sesión de PHP
  $_SESSION['clientes'] = $datos["clientes"];
  $_SESSION['proveedor'] = $datos["proveedor"];
  $_SESSION['personal'] = $datos["personal"];
  $_SESSION['operaciones'] = $datos["operaciones"];
  $_SESSION['contabilidad'] = $datos["contabilidad"];
  echo json_encode($_SESSION);
} else {
  session_destroy();
  echo json_encode($_SESSION);
}
header('Content-type: application/json; charset=utf-8');

//array_push($datos,$msg);