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
    $clientes = $_POST['_clientes'] ?? 0;
    $proveedor = $_POST['_proveedor'] ?? 0;
    $personal = $_POST['_personal'] ?? 0;
    $operaciones = $_POST['_operaciones'] ?? 0;
    $contabilidad = $_POST['_contabilidad'] ?? 0;

    //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

    $consulta = $Model_Accesos->registrarAccesos($idPersonal, $clientes, $proveedor, $personal, $operaciones, $contabilidad);

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
