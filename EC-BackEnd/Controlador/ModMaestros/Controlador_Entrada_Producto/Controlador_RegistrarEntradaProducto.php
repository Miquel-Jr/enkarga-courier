<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Entrada.php");

$Model_Entrada = new Model_Entrada();


if (isset($_POST['_proveedor']) && isset($_POST['_producto'])) {


  //GUARDAR PARAMETROS EN VARIABLES
  $idProveedor = $_POST['_proveedor'];
  $idProducto = $_POST['_producto'];
  $cantidad = $_POST['_cantidad'];
  $precio = $_POST['_precio'];
  $fechaVencimiento = $_POST['_fechaVencimiento'];
  $factura = $_POST['_factura'];
  $idUsuario = $_POST['_idUsuario'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Entrada->registrarEntradaProducto($idProveedor, $idProducto, $cantidad, $precio, $fechaVencimiento, $factura, $idUsuario)) {
    $msg = array(
      "response" => 1,
      "message" => "Registro corrrecto"
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
