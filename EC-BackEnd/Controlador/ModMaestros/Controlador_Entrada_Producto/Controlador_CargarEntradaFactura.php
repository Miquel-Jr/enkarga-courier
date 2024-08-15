<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Entrada.php");

$Model_Entrada = new Model_Entrada();


if (isset($_POST['_factura'])) {


  //GUARDAR PARAMETROS EN VARIABLES
  $factura = $_POST['_factura'];
  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Entrada->cargarEntradaFactura($factura)) {

    $array = $Model_Entrada->cargarEntradaFactura($factura);

    // MENSAJE A MOSTRAR NO ENCUENTRA RESULTADOS    

  } else {
    $array = array(
      "response" => 0,
      "message" => "Ingrese correctamente los datos"
    );
  }

  // MENSAJE A MOSTRAR SI NO SE REALIZA LA CONSULTA    

} else {

  $array = array(
    "response" => 0,
    "message" => "Parametros no encontrados"
  );
}

header('Content-type: application/json; charset=utf-8');
echo json_encode($array);
