<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Seguimiento_Guia.php");

$Model_Seguimiento_Guia = new Model_Seguimiento_Guia();

if (isset($_POST['_numeroGuia'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $numeroGuia = $_POST['_numeroGuia'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Seguimiento_Guia->mostrarSeguimientoGuia($numeroGuia)) {

    $data = $Model_Seguimiento_Guia->mostrarSeguimientoGuia($numeroGuia);
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
