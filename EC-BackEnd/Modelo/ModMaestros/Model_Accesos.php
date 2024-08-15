<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR ACCESOS

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA ACCESOS
===========================================*/

class Model_Accesos
{

  private $_conexion;

  public function __construct()
  {
    $this->_conexion = new conexion();
  }

  public function retornar_SELECT()
  {
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: VALIDAR ACCESO - PERSONAL
  ===========================================*/

  function validarAccesosPersonal($idPersonal)
  {
    $sql = "SELECT clientes, proveedor, personal, operaciones, contabilidad FROM acceso WHERE id_personal = ?";
    $params = array($idPersonal);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: REGISTRAR ACCESO - PERSONAL
  ===========================================*/

  function registrarAccesos($idPersonal, $clientes, $proveedor, $personal, $operaciones, $contabilidad)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO `acceso` (`id_acceso`,`clientes`, `proveedor`, `personal`, `operaciones`, `contabilidad`, `id_personal`) VALUES (NULL, ?, ?, ?, ?, ?, ?)";

    // Ejecutar la consulta con los parámetros
    $params = array($clientes, $proveedor, $personal, $operaciones, $contabilidad, $idPersonal);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR ACCESO - PERSONAL
  ===========================================*/

  function actualizarAccesos($idPersonal, $clientes, $proveedor, $personal, $operaciones, $contabilidad)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "UPDATE acceso SET clientes = ?, proveedor = ?, personal = ?, operaciones = ?, contabilidad = ? WHERE id_personal = ?";

    // Ejecutar la consulta con los parámetros
    $params = array($clientes, $proveedor, $personal, $operaciones, $contabilidad, $idPersonal);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }
}
