<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR GUIA DETALLE

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA GUIA DETALLE
===========================================*/

class Model_Guia_Detalle
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
    CONSULTA: LISTADO GUIA DETALLE - GUIA
  ===========================================*/

  function mostrarGuiaDetallePorGuia($idGuia)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * FROM guia_detalle WHERE id_guia = ?";
    $params = array($idGuia);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: LISTADO GUIA DETALLE
  ===========================================*/

  function mostrarGuiaDetalle($idGuiaDetalle)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * FROM guia_detalle WHERE id_guia_detalle = ?";
    $params = array($idGuiaDetalle);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: LISTADO GUIA DETALLE
  ===========================================*/

  function mostrarGuiaDetalles($idGuiaDetalles)
  {
    $idsArray = explode(',', $idGuiaDetalles);
    $placeholders = implode(',', array_fill(0, count($idsArray), '?'));
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * FROM guia_detalle WHERE id_guia_detalle IN ($placeholders)";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $idsArray);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: REGISTRAR GUIA DETALLE
  ===========================================*/

  function registrarGuiaDetalle($idGuia, $descripcion, $cantidad, $unidad, $peso)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO `guia_detalle` (`id_guia_detalle`, `id_guia`, `descripcion`, `cantidad`, `unidad`, `peso`) VALUES (NULL, ?, ?, ?, ?, ?)";

    // Ejecutar la consulta con los parámetros
    $params = array($idGuia, $descripcion, $cantidad, $unidad, $peso);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_id();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR GUIA DETALLE
  ===========================================*/

  function actualizarGuiaDetalle($idGuiaDetalle, $descripcion)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "UPDATE guia_detalle SET descripcion = ? WHERE id_guia_detalle = ? ";

    // Ejecutar la consulta con los parámetros
    $params = array($descripcion, $idGuiaDetalle);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR GUIA DETALLE - ID GUIA
  ===========================================*/

  function actualizarGuiaDetalleIdGuia($idGuia, $idGuiaDetalle)
  {
    $idsArray = explode(',', $idGuiaDetalle);
    $placeholders = implode(',', array_fill(0, count($idsArray), '?'));
    // Preparar la consulta SQL con sentencia preparada
    $sql = "UPDATE guia_detalle SET id_guia = $idGuia WHERE id_guia_detalle IN ($placeholders) ";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $idsArray);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR GUIA DETALLE
  ===========================================*/

  function eliminarGuiaDetalle($idGuiaDetalle)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "DELETE FROM guia_detalle WHERE id_guia_detalle = ? ";

    // Ejecutar la consulta con los parámetros
    $params = array($idGuiaDetalle);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }
}
