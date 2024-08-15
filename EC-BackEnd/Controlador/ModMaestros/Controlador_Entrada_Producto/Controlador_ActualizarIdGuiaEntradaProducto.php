<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Entrada.php");

$Model_Entrada = new Model_Entrada();


if (isset($_POST['_idGuia']) && isset($_POST['_idGuiaDetalle'])) {


  //GUARDAR PARAMETROS EN VARIABLES
  $idGuia = $_POST['_idGuia'];
  $idDetalleGuia = $_POST['_idGuiaDetalle'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Entrada->actualizarIdGuiaEntradaProducto($idGuia, $idDetalleGuia)) {
    $msg = array(
      "response" => 1,
      "message" => "Actualizacion corrrecta"
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
