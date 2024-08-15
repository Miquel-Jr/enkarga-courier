<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Guia_Detalle.php");

$Model_Guia_Detalle = new Model_Guia_Detalle();

if (isset($_POST['_idGuia'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idGuia = $_POST['_idGuia'];
  $descripcion = $_POST['_descripcion'];
  $cantidad = $_POST['_cantidad'];
  $unidad = $_POST['_unidad'];
  $peso = $_POST['_peso'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  $consulta = $Model_Guia_Detalle->registrarGuiaDetalle($idGuia, $descripcion, $cantidad, $unidad, $peso);

  if ($consulta) {
    $msg = array(
      "response" => 1,
      "id_guia_detalle" => $consulta,
      "message" => "Detalle guia registrado correctamente"
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
