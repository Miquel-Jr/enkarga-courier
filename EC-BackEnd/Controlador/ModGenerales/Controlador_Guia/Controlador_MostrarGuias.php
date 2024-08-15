<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Guia.php");

$Model_Guia = new Model_Guia();

$ordenCompra = $_POST['_ordenCompra'];
$cotizacion = $_POST['_cotizacion'];
$fechaInicio = $_POST['_fechaInicio'];
$fechaFin = $_POST['_fechaFin'];

$consulta = $Model_Guia->mostrarGuias($ordenCompra, $cotizacion, $fechaInicio, $fechaFin);

if ($consulta) {

  $data = $consulta;
} else {

  $data = array(
    "response" => 1,
    "message" => "No existen registros."
  );
}

header('Content-type: application/json; charset=utf-8');
echo json_encode($data);
