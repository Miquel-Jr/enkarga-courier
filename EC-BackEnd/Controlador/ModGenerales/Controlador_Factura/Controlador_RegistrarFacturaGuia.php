<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Factura.php");

$Model_Factura = new Model_Factura();

if (isset($_POST['_idFactura']) && isset($_POST['_guias'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idFactura = $_POST['_idFactura'];
  $guias = $_POST['_guias'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  foreach ($guias as $guia) {
    $idGuiaFactura = $guia['id_guia_factura'] ?? NULL;
    $idGuia = $guia['id_guia'];
    $consulta = $Model_Factura->registrarGuiaFactura($idGuiaFactura, $idGuia, $idFactura);
  }
  if ($consulta) {
    $data = array(
      "response" => 1,
      "message" => "Guias Factura registrada correctamente"
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
