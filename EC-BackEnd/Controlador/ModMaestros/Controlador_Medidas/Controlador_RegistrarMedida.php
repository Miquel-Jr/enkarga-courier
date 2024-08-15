<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Medidas.php");

$Model_Medidas = new Model_Medidas();


if (isset($_POST['_medida'])) {


  //GUARDAR PARAMETROS EN VARIABLES
  $medida = $_POST['_medida'];
  $abreviatura = $_POST['_abreviatura'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Medidas->registrarMedida($medida, $abreviatura)) {
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
