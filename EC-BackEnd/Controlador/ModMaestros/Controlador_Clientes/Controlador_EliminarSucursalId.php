<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Clientes.php");

$Model_Clientes = new Model_Clientes();


if (isset($_POST['_idSucursal'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idSucursal = $_POST['_idSucursal'];
  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Clientes->eliminarSucursalId($idSucursal)) {
    $msg = array(
      "response" => 1,
      "message" => "Sucursal eliminado correctamente"
    );

    // MENSAJE A MOSTRAR NO ENCUENTRA RESULTADOS

  } else {
    $msg = array(
      "response" => 0,
      "message" => "No se pudo eliminar la sucursal"
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
