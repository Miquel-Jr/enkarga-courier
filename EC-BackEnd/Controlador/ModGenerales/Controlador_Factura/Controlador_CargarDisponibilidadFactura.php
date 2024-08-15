<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Factura.php");

$Model_Factura = new Model_Factura();

if (isset($_POST['_serie']) && isset($_POST['_numero'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $serie = $_POST['_serie'];
  $numero = $_POST['_numero'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Factura->cargarDisponibilidadFactura($serie, $numero)) {

    $data = $Model_Factura->cargarDisponibilidadFactura($serie, $numero);
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
