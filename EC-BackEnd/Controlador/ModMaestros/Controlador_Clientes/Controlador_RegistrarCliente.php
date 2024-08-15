<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Clientes.php");

$Model_Clientes = new Model_Clientes();


if (isset($_POST['_tipoDocumento']) && isset($_POST['_numeroDocumento'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $nombres = $_POST['_nombres'];
  $apellidos = $_POST['_apellidos'];
  $correo = $_POST['_correo'];
  $tipoDocumento = $_POST['_tipoDocumento'];
  $numeroDocumento = $_POST['_numeroDocumento'];
  $telefono = !empty($_POST['_telefono']) ? $_POST['_telefono'] : null;
  $celular = !empty($_POST['_celular']) ? $_POST['_celular'] : null;

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  $consulta = $Model_Clientes->registrarCliente($nombres, $apellidos, $correo, $tipoDocumento, $numeroDocumento, $telefono, $celular);

  if ($consulta) {
    $msg = array(
      "response" => 1,
      "id_cliente" => $consulta,
      "message" => "Cliente registrado correctamente"
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
