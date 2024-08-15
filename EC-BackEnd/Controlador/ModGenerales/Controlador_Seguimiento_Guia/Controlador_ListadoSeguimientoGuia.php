<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Seguimiento_Guia.php");

$Model_Seguimiento_Guia = new Model_Seguimiento_Guia();

if ($Model_Seguimiento_Guia->listadoSeguimientoGuia()) {

  $data = $Model_Seguimiento_Guia->listadoSeguimientoGuia();
} else {

  $data = array(
    "response" => 1,
    "message" => "No existen registros."
  );
}

header('Content-type: application/json; charset=utf-8');
echo json_encode($data);
