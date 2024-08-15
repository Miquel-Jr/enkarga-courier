<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Usuario.php");

$Model_Usuario = new Model_Usuario();


if (isset($_POST['_usuario']) && isset($_POST['_clave'])) {


  //GUARDAR PARAMETROS EN VARIABLES

  $idPersonal = $_POST['_idPersonal'];
  $usuario = $_POST['_usuario'];
  $clave = $_POST['_clave'];
  $idPerfil = $_POST['_idPerfil'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Usuario->registrarUsuario($idPersonal, $usuario, $clave, $idPerfil)) {
    $msg = array(
      "response" => 1,
      "message" => "Registro corrrecto"
    );

    // MENSAJE A MOSTRAR NO ENCUENTRA RESULTADOS    

  } else {
    $msg = array(
      "response" => 0,
      "message" => "Ingrese correctamente los datos"
    );
  }

  // MENSAJE A MOSTRAR SI NO SE REALIZA LA CONSULTA    

} else {

  $msg = array(
    "response" => 0,
    "message" => "Parametros no encontrados"
  );
}

header('Content-type: application/json; charset=utf-8');

//array_push($datos,$msg);
echo json_encode($msg);
