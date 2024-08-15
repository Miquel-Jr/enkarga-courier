<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR SEGUIMIENTO GUIA

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA SEGUIMIENTO GUIA
===========================================*/

class Model_Seguimiento_Guia
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
    CONSULTA: REGISTRAR SEGUIMIENTO GUIA
  ===========================================*/

  function registrarSeguimientoGuia($idGuia, $numeroGuia, $actividad, $detalle, $idPersonal)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO `seguimiento_guia` (`id_seguimiento_guia`, `id_guia`, `numero_guia`, `actividad`, `detalle`, `id_usuario`)
     VALUES (NULL, ?, ?, ?, ?, ?)";

    // Ejecutar la consulta con los parámetros
    $params = array($idGuia, $numeroGuia ,$actividad, $detalle, $idPersonal);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: SEGUIMIENTO GUIA
  ===========================================*/

  function mostrarSeguimientoGuia($numeroGuia)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT sg.id_seguimiento_guia, sg.numero_guia, CONCAT(p.nombres, ' ', p.apellidos) usuario, sg.actividad, sg.detalle, sg.fecha_registro
    FROM seguimiento_guia sg 
    INNER JOIN personal p ON p.id_personal = sg.id_usuario
    WHERE sg.numero_guia = ? 
    ORDER BY sg.fecha_registro DESC";

    // Ejecutar la consulta con los parámetros
    $params = array($numeroGuia);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: LISTADO SEGUIMIENTO GUIA
  ===========================================*/

  function listadoSeguimientoGuia()
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT numero_guia FROM seguimiento_guia GROUP BY numero_guia ORDER BY fecha_registro DESC";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }
}
