<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Deposito.php");

$Model_Deposito = new Model_Deposito();

if (isset($_POST['_idFacturaDeposito'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idFacturaDeposito = $_POST['_idFacturaDeposito'];
  $idFactura = $_POST['_idFactura'];
  $fechaDeposito = $_POST['_fechaDeposito'];
  $entidadBancaria = $_POST['_entidadBancaria'];
  $formaPago = $_POST['_formaPago'];
  $numeroCentro = $_POST['_numeroCentro'];
  $numeroOperacion = $_POST['_numeroOperacion'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS
  $consulta = $Model_Deposito->actualizarFacturaDeposito($idFactura, $fechaDeposito, $entidadBancaria, $formaPago, $numeroCentro, $numeroOperacion, $idFacturaDeposito);

  if ($consulta) {
    $data = array(
      "response" => 1,
      "message" => "Deposito actualizo correctamente"
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
