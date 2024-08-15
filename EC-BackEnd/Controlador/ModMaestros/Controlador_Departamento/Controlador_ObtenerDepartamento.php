<?php

//
//LLAMADA A LOS ARCHIVOS DE CONEXION A LA BD Y EL MODELO CORRESPONDIENTE AL CONTROLADOR
//
require_once(__DIR__ . "/../../../Modelo/ConexionBD.php");
require_once(__DIR__ . "/../../../Modelo/ModMaestros/Model_Departamento.php");

$Model_Departamento = new Model_Departamento();

if ($Model_Departamento->mostrarDepartamento()) {

    $array = $Model_Departamento->mostrarDepartamento();
} else {

    $array = array(
        "response" => 0,
        "message" => "Informacion no encontrada"
    );
}

header('Content-type: application/json; charset=utf-8');
echo json_encode($array);
