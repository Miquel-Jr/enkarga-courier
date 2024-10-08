<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Personal.php");

$Model_Personal = new Model_Personal();

if ($Model_Personal->mostrarPersonal()) {

  $array = $Model_Personal->mostrarPersonal();
} else {

  $array = array(
    "response" => 0,
    "message" => "Informacion no encontrada"
  );
}

header('Content-type: application/json; charset=utf-8');
echo json_encode($array);
