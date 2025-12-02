<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Deposito.php");

$Model_Deposito = new Model_Deposito();

if (isset($_POST['_fechaInicio']) && isset($_POST['_fechaFin'])) {

  //GUARDAR PARAMETROS EN VARIABLES
  $fechaInicio = $_POST['_fechaInicio'];
  $fechaFin = $_POST['_fechaFin'];

  if ($Model_Deposito->cargarListadoDeposito($fechaInicio, $fechaFin)) {

    $data = $Model_Deposito->cargarListadoDeposito($fechaInicio, $fechaFin);
    
  } else {

    $data = array(
      "response" => 1,
      "message" => "No existen registros."
    );
  }
} else {

  $data = array(
    "response" => 0,
    "message" => "Parametros no encontrados"
  );
}
header('Content-type: application/json; charset=utf-8');

//array_push($datos,$msg);
echo json_encode($data);
