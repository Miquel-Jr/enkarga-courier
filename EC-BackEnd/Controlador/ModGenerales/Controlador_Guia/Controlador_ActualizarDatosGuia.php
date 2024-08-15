<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Guia.php");

$Model_Guia = new Model_Guia();

if (isset($_POST['_idGuia'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idGuia = $_POST['_idGuia'];
  $serie = $_POST['_serieGuia'];
  $numero = $_POST['_numeroGuia'];
  $fechaEmision = $_POST['_fechaEmision'];
  $idTransportista = $_POST['_idTransportista'];
  $idCliente = $_POST['_idCliente'];
  $ordenCompra = $_POST['_ordenCompra'];
  $cotizacion = $_POST['_cotizacion'];
  $remitente = $_POST['_remitente'];
  $direccionRemitente = $_POST['_direccionRemitente'];
  $destinatario = $_POST['_destinatario'];
  $direccionDestinatario = $_POST['_direccionDestinatario'];
  $largoGuia = $_POST['_largoGuia'];
  $anchoGuia = $_POST['_anchoGuia'];
  $altoGuia = $_POST['_altoGuia'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  $consulta = $Model_Guia->actualizarDatosGuia($serie, $numero, $fechaEmision, $idTransportista, $idCliente, $ordenCompra, $cotizacion, $remitente, $direccionRemitente, $destinatario, $direccionDestinatario, $largoGuia, $anchoGuia, $altoGuia, $idGuia);
  if ($consulta) {
    $msg = array(
      "response" => 1,
      "message" => "Guia actualizada correctamente"
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
