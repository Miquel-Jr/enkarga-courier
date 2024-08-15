<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Personal.php");

$Model_Personal = new Model_Personal();


if (isset($_POST['_idPersonal'])) {


  //GUARDAR PARAMETROS EN VARIABLES

  $idPersonal = $_POST['_idPersonal'];
  $nombres = $_POST['_nombres'];
  $apellidos = $_POST['_apellidos'];
  $tipoDocumento = $_POST['_tipoDocumento'];
  $numeroDocumento = $_POST['_numeroDocumento'];
  $correo = $_POST['_correo'];
  $fechaNacimiento = $_POST['_fechaNacimiento'];
  $idDistrito = $_POST['_distrito'];
  $direccion = $_POST['_direccion'];
  
  $telefono = !empty($_POST['_telefono']) ? $_POST['_telefono'] : null;
  $celular = !empty($_POST['_celular']) ? $_POST['_celular'] : null;
  
  $idEstado = $_POST['_idEstado'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Personal->actualizarPersonal($idPersonal, $nombres, $apellidos, $correo, $fechaNacimiento, $idDistrito, $tipoDocumento, $numeroDocumento, $direccion, $telefono, $celular, $idEstado)) {
    $msg = array(
      "response" => 1,
      "message" => "Actualizacion correcta"
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
