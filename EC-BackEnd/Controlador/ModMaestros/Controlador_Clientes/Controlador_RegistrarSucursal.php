<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Clientes.php");

$Model_Clientes = new Model_Clientes();


if (isset($_POST['_idCliente'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idCliente = $_POST['_idCliente'];
  $sucursales = $_POST['_sucursales'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  foreach ($sucursales as $sucursal) {
    $idClienteSucursal = $sucursal['id_cliente_sucursal'] ?? NULL;
    $ruc = $sucursal['ruc'];
    $razonSocial = $sucursal['razonSocial'];
    $idDistrito = $sucursal['idDistrito'];
    $direccion = $sucursal['direccion'];
    $Model_Clientes->registrarSucursal($idClienteSucursal, $idCliente, $ruc, $razonSocial, $idDistrito, $direccion);
  }

  $msg = array(
    "response" => 1,
    "message" => "Cliente Sucursal registrado"
  );
} else {

  $msg = array(
    "response" => 0,
    "message" => "Parametros no encontrados"
  );
}

header('Content-type: application/json; charset=utf-8');

//array_push($datos,$msg);
echo json_encode($msg);
