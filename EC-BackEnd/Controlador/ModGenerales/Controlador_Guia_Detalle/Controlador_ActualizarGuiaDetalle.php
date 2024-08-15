<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Guia_Detalle.php");

$Model_Guia_Detalle = new Model_Guia_Detalle();

if (isset($_POST['_idGuiaDetalle'])) {

  //GUARDAR PARAMETROS EN VARIABLES
  $idGuiaDetalle = $_POST['_idGuiaDetalle'];
  $descripcion = $_POST['_descripcion'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  $consulta = $Model_Guia_Detalle->actualizarGuiaDetalle($idGuiaDetalle, $descripcion);

  if ($consulta) {
    $msg = array(
      "response" => 1,
      "message" =>  "Actualizacion de guia detalle correcta"
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
