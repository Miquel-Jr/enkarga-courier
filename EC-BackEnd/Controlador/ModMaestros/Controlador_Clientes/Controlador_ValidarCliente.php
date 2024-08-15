<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Clientes.php");

$Model_Clientes = new Model_Clientes();


if (isset($_POST['_tipoDocumento']) && isset($_POST['_numeroDocumento'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $tipoDocumento = $_POST['_tipoDocumento'];
  $numeroDocumento = $_POST['_numeroDocumento'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Clientes->validarClientes($tipoDocumento, $numeroDocumento)) {

    $data = $Model_Clientes->validarClientes($tipoDocumento, $numeroDocumento);

    // MENSAJE A MOSTRAR NO ENCUENTRA RESULTADOS    

  } else {

    $data = array(
      "response" => 0,
      "message" => "No existen registros"
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
