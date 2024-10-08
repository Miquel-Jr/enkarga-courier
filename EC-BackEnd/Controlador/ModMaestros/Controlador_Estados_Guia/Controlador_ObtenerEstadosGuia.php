<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Estados_Guia.php");

$Model_Estados_Guia = new Model_Estados_Guia();

if ($Model_Estados_Guia->mostrarEstadosGuia()) {

  $array = $Model_Estados_Guia->mostrarEstadosGuia();
} else {

  $array = array(
    "response" => 0,
    "message" => "Informacion no encontrada"
  );
}

header('Content-type: application/json; charset=utf-8');
echo json_encode($array);
