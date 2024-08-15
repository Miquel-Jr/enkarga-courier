<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Proveedor.php");

$Model_Proveedor = new Model_Proveedor();


if (isset($_POST['_idProveedor']) && isset($_POST['_ruc']) && isset($_POST['_razonSocial'])) {

  //GUARDAR PARAMETROS EN VARIABLES
  $idProveedor = $_POST['_idProveedor'];
  $ruc = $_POST['_ruc'];
  $razonSocial = $_POST['_razonSocial'];
  $correo = $_POST['_correo'];
  $distrito = $_POST['_distrito'];
  $direccion = $_POST['_direccion'];
  $telefonoEmpresa = $_POST['_telefono'];
  $celularEmpresa = $_POST['_celular'];

  $idEstado = $_POST['_idEstado'];

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  if ($Model_Proveedor->actualizarProveedor($idProveedor, $ruc, $razonSocial, $correo, $distrito, $direccion, $telefonoEmpresa, $celularEmpresa, $idEstado)) {
    $msg = array(
      "response" => 1,
      "message" => "Transportista actualizado correctamente"
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
