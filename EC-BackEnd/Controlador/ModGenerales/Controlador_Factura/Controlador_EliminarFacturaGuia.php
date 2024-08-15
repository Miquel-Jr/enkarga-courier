<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Factura.php");

$Model_Factura = new Model_Factura();

if (isset($_POST['_idFactura'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idFactura = $_POST['_idFactura'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS
  $consulta = $Model_Factura->eliminarGuiaFactura($idFactura);

  if ($consulta) {
    $data = array(
      "response" => 1,
      "message" => "Guias Factura eliminada correctamente"
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
