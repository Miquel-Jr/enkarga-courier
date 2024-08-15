<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Proveedor.php");

$Model_Proveedor = new Model_Proveedor();


if (isset($_POST['_idProveedor'])) {

  //GUARDAR PARAMETROS EN VARIABLES
  $idProveedor = $_POST['_idProveedor'];
  $idEstado = $_POST['_idEstado'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Proveedor->actualizarEstadoProveedor($idProveedor, $idEstado)) {
    $msg = array(
      "response" => 1,
      "message" => "Estado actualizado correctamente"
    );

    // MENSAJE A MOSTRAR NO ENCUENTRA RESULTADOS    

  } else {
    $msg = array(
      "response" => 0,
      "message" => "Ingrese correctamente los datos"
    );
  }

  // MENSAJE A MOSTRAR SI NO SE REALIZA LA CONSULTA    

} else {

  $msg = array(
    "response" => 0,
    "message" => "Parametros no encontrados"
  );
}

header('Content-type: application/json; charset=utf-8');

//array_push($datos,$msg);
echo json_encode($msg);
