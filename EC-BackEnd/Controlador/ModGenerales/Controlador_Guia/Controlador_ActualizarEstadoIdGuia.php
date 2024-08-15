<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Guia.php");

$Model_Guia = new Model_Guia();

if (isset($_POST['_idGuia']) && isset($_POST['_idEstadoGuia'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idGuia = $_POST['_idGuia'];
  $idEstadoGuia = $_POST['_idEstadoGuia'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  $consulta = $Model_Guia->actualizarEstadoIdGuia($idGuia, $idEstadoGuia);

  if ($consulta) {
    $msg = array(
      "response" => 1,
      "message" => "Guia actualizada correctamente"
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
