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
  $cliente = $_POST['_cliente'];
  $fechaVencimiento = $_POST['_fechaVencimiento'];
  $tipoCredito = $_POST['_tipoCredito'];
  $ordenServicio = $_POST['_ordenServicio'];
  $baseImponible = $_POST['_baseImponible'];
  $igv = $_POST['_igv'];
  $subtotal = $_POST['_subtotal'];
  $detraccion = $_POST['_detraccion'];
  $total = $_POST['_total'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS
  $consulta = $Model_Factura->registrarFactura($serie, $numero, $cliente, $fechaVencimiento, $tipoCredito, $ordenServicio, $baseImponible, $igv, $subtotal, $detraccion, $total);

  if ($consulta) {
    $data = array(
      "response" => 1,
      "id_factura" => $consulta,
      "message" => "Factura registrada correctamente"
    );
    // MENSAJE A MOSTRAR NO ENCUENTRA RESULTADOS    

  } else {

    $data = array(
      "response" => 0,
      "message" => "Ingrese correctamente los datos"
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
