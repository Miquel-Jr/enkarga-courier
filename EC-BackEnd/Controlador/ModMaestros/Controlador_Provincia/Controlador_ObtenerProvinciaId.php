<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Provincia.php");

$Model_Provincia = new Model_Provincia();


if (isset($_POST['_idProvincia'])) {

    //GUARDAR PARAMETROS EN VARIABLES

    $idProvincia = $_POST['_idProvincia'];

    //MENSAJE A MOSTRAR SI ENCUENTRA RESULTADOS

    if ($Model_Provincia->mostrarProvinciaXIdProvincia($idProvincia)) {

        $data = $Model_Provincia->mostrarProvinciaXIdProvincia($idProvincia);

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
