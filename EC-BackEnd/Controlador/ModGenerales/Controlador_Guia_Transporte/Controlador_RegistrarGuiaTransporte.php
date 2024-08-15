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
  $proveedor = $_POST['_idProveedor'];
  $numeroGuia = $_POST['_numeroGuia'];
  $idEstadoGuiaTransporte = $_POST['_idEstadoGuiaTransporte'];
  $numeroFactura = $_POST['_numeroFactura'];
  $origen = $_POST['_origen'];
  $destino = $_POST['_destino'];
  $descripcion = $_POST['_descripcion'];
  $cantidadBulto = $_POST['_cantidadBulto'];
  $observaciones = $_POST['_observaciones'];
  $reparto = $_POST['_reparto'];
  $subtotal = $_POST['_subtotal'];
  $igv = $_POST['_igv'];
  $total = $_POST['_total'];
  $fechaDespacho = $_POST['_fechaDespacho'];
  $tipoTransporte = $_POST['_tipoTransporte'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS
  $consulta = $Model_Guia_Transporte->registrarGuiaTransporte($idGuia, $proveedor, $numeroGuia, $idEstadoGuiaTransporte, $numeroFactura, $origen, $destino, $descripcion, $cantidadBulto, $observaciones, $reparto, $subtotal, $igv, $total, $fechaDespacho, $tipoTransporte);
  
  if ($consulta){
    $msg = array(
      "response" => 1,
      "id_guia_transporte" => $consulta,
      "message" => "Guia Transporte registrada correctamente"
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
