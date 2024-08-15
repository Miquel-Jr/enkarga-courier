<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR NOTA DE CREDITO

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA NOTA DE CREDITO
===========================================*/

class Model_Nota_Credito
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
    CONSULTA: CARGAR NOTA CREDITO - ID FACTURA
  ===========================================*/

  function cargarNotaCreditoIdFactura($idFactura)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * FROM nota_credito WHERE id_factura = ?";
    $params = array($idFactura);
    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: LISTADO NOTA CREDITO
  ===========================================*/

  function cargarListadoNotaCredito()
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT nc.id_nota_credito, nc.serie_nota_credito, nc.numero_nota_credito, nc.fecha_nota_credito, nc.total, nc.fecha_registro, 
    f.serie_factura, f.numero_factura, nc.base_imponible, nc.igv, nc.total, nc.id_factura
    FROM nota_credito nc
    INNER JOIN factura f ON f.id_factura = nc.id_factura";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }
  /*===========================================
    CONSULTA: REGISTRAR NOTA CREDITO
  ===========================================*/

  function registrarNotaCredito($idFactura, $fechaNotaCredito, $serie, $numero, $baseImponible, $igv, $total)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO nota_credito (id_factura, fecha_nota_credito, serie_nota_credito, numero_nota_credito, base_imponible, igv, total) VALUES(?, ?, ?, ?, ?, ?, ?)";
    $params = array($idFactura, $fechaNotaCredito, $serie, $numero, $baseImponible, $igv, $total);
    // Ejecutar la consulta con los fechaNotaCredito
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: ELIMINAR NOTA CREDITO
  ===========================================*/

  function eliminarNotaCredito($idNotaCredito)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "DELETE FROM nota_credito WHERE id_nota_credito = ?";
    $params = array($idNotaCredito);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR DATOS NOTA CREDITO
  ===========================================*/

  function actualizarNotaCredito($idFactura, $fechaNotaCredito, $serie, $numero, $baseImponible, $igv, $total, $idNotaCredito)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "UPDATE nota_credito SET id_factura = ?, fecha_nota_credito = ?, serie_nota_credito = ?, numero_nota_credito = ?, base_imponible = ?, igv = ?, total = ?
    WHERE id_nota_credito = ?";
    $params = array($idFactura, $fechaNotaCredito, $serie, $numero, $baseImponible, $igv, $total, $idNotaCredito);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }
}
