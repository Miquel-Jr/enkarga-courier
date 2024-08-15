<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModGenerales/Model_Guia.php");

$Model_Guia = new Model_Guia();

if (isset($_POST['_serieGuia']) && isset($_POST['_numeroGuia'])) {

  //GUARDAR PARAMETROS EN VARIABLES

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
  $idPersonal = $_POST['_idPersonal'];
  
  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  $consulta = $Model_Guia->registrarGuia($serie, $numero, $fechaEmision, $idTransportista, $idCliente, $ordenCompra, $cotizacion, $remitente , $direccionRemitente, $destinatario, $direccionDestinatario, $largoGuia, $anchoGuia, $altoGuia, $idPersonal);

  if ($consulta) {
    $msg = array(
      "response" => 1,
      "id_guia" => $consulta,
      "message" => "Guia registrada correctamente"
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
