<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Empresa.php");

$Model_Empresa = new Model_Empresa();

if ($Model_Empresa->mostrarEmpresa()) {

  $array = $Model_Empresa->mostrarEmpresa();
} else {

  $array = array(
    "response" => 0,
    "message" => "Informacion no encontrada"
  );
}

header('Content-type: application/json; charset=utf-8');
echo json_encode($array);
