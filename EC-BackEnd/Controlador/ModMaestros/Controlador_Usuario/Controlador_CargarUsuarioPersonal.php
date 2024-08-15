<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Usuario.php");

$Model_Usuario = new Model_Usuario();

if (isset($_POST['_idPersonal'])) {

  $idPersonal = $_POST['_idPersonal'];

  if ($Model_Usuario->cargarUsuarioPersonal($idPersonal)) {

    $data = $Model_Usuario->cargarUsuarioPersonal($idPersonal);
  } else {

    $data = array(
      "response" => 0,
      "message" => "Informacion no encontrada"
    );
  }
} else {

  $data = array(
    "response" => 0,
    "message" => "Parametros no encontrados"
  );
}

header('Content-type: application/json; charset=utf-8');
echo json_encode($data);
