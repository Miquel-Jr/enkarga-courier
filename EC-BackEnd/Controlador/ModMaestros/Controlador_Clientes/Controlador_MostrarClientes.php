<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Clientes.php");

$Model_Clientes = new Model_Clientes();

if ($Model_Clientes->mostrarClientes()) {

  $data = $Model_Clientes->mostrarClientes();
} else {

  $data = array(
    "response" => 1,
    "message" => "No existen registros."
  );
}

header('Content-type: application/json; charset=utf-8');
echo json_encode($data);
