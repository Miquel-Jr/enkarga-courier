<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Seguimiento_Guia.php");

$Model_Seguimiento_Guia = new Model_Seguimiento_Guia();

if (isset($_POST['_idGuia']) && isset($_POST['_actividad']) && isset($_POST['_idPersonal'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idGuia = $_POST['_idGuia'];
  $numeroGuia = $_POST['_numeroGuia'];
  $actividad = $_POST['_actividad'];
  $detalle = $_POST['_detalle'];
  $idPersonal = $_POST['_idPersonal'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Seguimiento_Guia->registrarSeguimientoGuia($idGuia, $numeroGuia, $actividad, $detalle, $idPersonal)) {

    $msg = array(
      "response" => 1,
      "message" => "Seguimiento guia registrada correctamente"
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
