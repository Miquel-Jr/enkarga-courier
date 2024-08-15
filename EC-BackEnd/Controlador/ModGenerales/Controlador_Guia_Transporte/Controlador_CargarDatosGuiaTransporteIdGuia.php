<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Guia_Transporte.php");

$Model_Guia_Transporte = new Model_Guia_Transporte();

if (isset($_POST['_idGuia'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idGuia = $_POST['_idGuia'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Guia_Transporte->cargarDatosGuiaTransporteIdGuia($idGuia)) {

    $data = $Model_Guia_Transporte->cargarDatosGuiaTransporteIdGuia($idGuia);
    // MENSAJE A MOSTRAR NO ENCUENTRA RESULTADOS    

  } else {

    $data = array(
      "response" => 0,
      "message" => "No existen registros"
    );
  }
} else {

  $data = array(
    "response" => 0,
    "message" => "Parametros no encontrados"
  );
}

header('Content-type: application/json; charset=utf-8');

//array_push($datos,$msg);
echo json_encode($data);
