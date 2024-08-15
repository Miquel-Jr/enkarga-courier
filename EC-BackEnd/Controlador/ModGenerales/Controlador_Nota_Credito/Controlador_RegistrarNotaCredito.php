<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Nota_Credito.php");

$Model_Nota_Credito = new Model_Nota_Credito();

if (isset($_POST['_idFactura'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idFactura = $_POST['_idFactura'];
  $fechaNotaCredito = $_POST['_fechaNotaCredito'];
  $serieNotaCredito = $_POST['_serieNotaCredito'];
  $numeroNotaCredito = $_POST['_numeroNotaCredito'];
  $baseImponible = $_POST['_baseImponible'];
  $igv = $_POST['_igv'];
  $total = $_POST['_total'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Nota_Credito->registrarNotaCredito($idFactura, $fechaNotaCredito, $serieNotaCredito, $numeroNotaCredito, $baseImponible, $igv, $total)) {

    $msg = array(
      "response" => 1,
      "message" => "Nota de credito registrada correctamente"
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
