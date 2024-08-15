<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Nota_Credito.php");

$Model_Nota_Credito = new Model_Nota_Credito();

if ($Model_Nota_Credito->cargarListadoNotaCredito()) {

  $data = $Model_Nota_Credito->cargarListadoNotaCredito();
} else {

  $data = array(
    "response" => 1,
    "message" => "No existen registros."
  );
}

header('Content-type: application/json; charset=utf-8');
echo json_encode($data);
