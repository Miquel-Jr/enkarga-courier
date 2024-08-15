<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR DEPOSITO

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA DEPOSITO
===========================================*/

class Model_Deposito
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
    CONSULTA: CARGAR DEPOSITO ID FACTURA
  ===========================================*/

  function cargarDepositoIdFactura($idFactura)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * FROM factura_deposito WHERE id_factura = ?";
    $params = array($idFactura);
    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: LISTADO FACTURA DEPOSITO
  ===========================================*/

  function cargarListadoDeposito()
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT f.serie_factura, f.numero_factura, fd.fecha_deposito, fd.entidad_bancaria, fd.forma_pago,  fd.numero_centro, fd.numero_operacion,
    fd.fecha_registro, fd.id_factura_deposito, f.id_factura, f.id_estado_factura
    FROM factura_deposito fd
    INNER JOIN factura f ON f.id_factura = fd.id_factura";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }
  /*===========================================
    CONSULTA: REGISTRAR FACTURA
  ===========================================*/

  function registrarDeposito($idFactura, $fechaDeposito, $entidadBancaria, $formaPago, $numeroCentro, $numeroOperacion)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO factura_deposito (id_factura, fecha_deposito, entidad_bancaria, forma_pago, numero_centro, numero_operacion) VALUES(?, ?, ?, ?, ?, ?)";
    $params = array($idFactura, $fechaDeposito, $entidadBancaria, $formaPago, $numeroCentro, $numeroOperacion);
    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: ELIMINAR FACTURA DEPOSITO
  ===========================================*/

  function eliminarFacturaDeposito($idFacturaDeposito)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "DELETE FROM factura_deposito WHERE id_factura_deposito = ?";
    $params = array($idFacturaDeposito);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR DATOS FACTURA DEPOSITO
  ===========================================*/

  function actualizarFacturaDeposito($idFactura, $fechaDeposito, $entidadBancaria, $formaPago, $numeroCentro, $numeroOperacion, $idFacturaDeposito)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "UPDATE factura_deposito SET id_factura = ?, fecha_deposito = ?, entidad_bancaria = ?, forma_pago = ?, numero_centro = ?, numero_operacion = ?
    WHERE id_factura_deposito = ?";
    $params = array($idFactura, $fechaDeposito, $entidadBancaria, $formaPago, $numeroCentro, $numeroOperacion, $idFacturaDeposito);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }
}
