<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Accesos.php");

$Model_Accesos = new Model_Accesos();


if (isset($_POST['_idPersonal'])) {

  //GUARDAR PARAMETROS EN VARIABLES

  $idPersonal = $_POST['_idPersonal'];
  $clientes = isset($_POST['_clientes']) && $_POST['_clientes'] === "true" ? 1 : 0;
  $proveedor = isset($_POST['_proveedor']) && $_POST['_proveedor'] === "true" ? 1 : 0;
  $personal = isset($_POST['_personal']) && $_POST['_personal'] === "true" ? 1 : 0;
  $operaciones = isset($_POST['_operaciones']) && $_POST['_operaciones'] === "true" ? 1 : 0;
  $contabilidad = isset($_POST['_contabilidad']) && $_POST['_contabilidad'] === "true" ? 1 : 0;

  //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

  $busqueda = $Model_Accesos->validarAccesosPersonal($idPersonal);

  if ($busqueda) {
    $consulta = $Model_Accesos->actualizarAccesos($idPersonal, $clientes, $proveedor, $personal, $operaciones, $contabilidad);
  } else {
    $consulta = $Model_Accesos->registrarAccesos($idPersonal, $clientes, $proveedor, $personal, $operaciones, $contabilidad);
  }

  if ($consulta) {
    $msg = array(
      "response" => 1,
      "message" => array($consulta)
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
