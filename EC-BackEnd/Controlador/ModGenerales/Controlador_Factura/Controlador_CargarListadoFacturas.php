<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Factura.php");

$Model_Factura = new Model_Factura();

if ($Model_Factura->cargarListadoFacturas()) {

  $data = $Model_Factura->cargarListadoFacturas();
} else {

  $data = array(
    "response" => 1,
    "message" => "No existen registros."
  );
}
header('Content-type: application/json; charset=utf-8');

//array_push($datos,$msg);
echo json_encode($data);
