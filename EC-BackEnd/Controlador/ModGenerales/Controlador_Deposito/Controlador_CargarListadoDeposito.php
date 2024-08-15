<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Deposito.php");

$Model_Deposito = new Model_Deposito();

if ($Model_Deposito->cargarListadoDeposito()) {

  $data = $Model_Deposito->cargarListadoDeposito();
  
} else {

  $data = array(
    "response" => 1,
    "message" => "No existen registros."
  );
}
header('Content-type: application/json; charset=utf-8');

//array_push($datos,$msg);
echo json_encode($data);
