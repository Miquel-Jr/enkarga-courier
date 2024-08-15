<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR FACTURA

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA FACTURA
===========================================*/

class Model_Factura
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
    CONSULTA: DISPONIBILIDAD FACTURA
  ===========================================*/

  function cargarDisponibilidadFactura($serie, $numero)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * FROM factura WHERE serie_factura = ? AND numero_factura = ?";
    $params = array($serie, $numero);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: LISTADO FACTURA
  ===========================================*/

  function cargarListadoFacturas()
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT f.id_factura, f.serie_factura, f.numero_factura, f.orden_servicio, f.total_cobrar, 
    e.id_estado_factura, e.descripcion estado, CONCAT(c.nombres, ' ', c.apellidos) cliente, cs.ruc,
    COALESCE(cs.razon_social, '-') razon_social, f.fecha_registro, COALESCE(fd.id_factura_deposito, '') id_factura_deposito,
    COALESCE(nc.id_nota_credito, '') id_nota_credito
    FROM factura f
    INNER JOIN estado_factura e ON e.id_estado_factura = f.id_estado_factura
    INNER JOIN cliente_sucursal cs ON cs.id_cliente_sucursal = f.id_cliente_sucursal
    INNER JOIN cliente c ON c.id_cliente = cs.id_cliente
    LEFT JOIN factura_deposito fd ON fd.id_factura = f.id_factura
    LEFT JOIN nota_credito nc ON nc.id_factura = f.id_factura";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }
  /*===========================================
    CONSULTA: REGISTRAR FACTURA
  ===========================================*/

  function registrarFactura($serie, $numero, $cliente, $fechaVencimiento, $tipoCredito, $ordenServicio, $baseImponible, $igv, $subtotal, $detraccion, $total)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO factura (serie_factura, numero_factura, id_cliente_sucursal, fecha_vencimiento, tipo_credito, orden_servicio, base_imponible, igv, subtotal, detraccion, total_cobrar) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $params = array($serie, $numero, $cliente, $fechaVencimiento, $tipoCredito, $ordenServicio, $baseImponible, $igv, $subtotal, $detraccion, $total);
    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_id();
  }

  /*===========================================
    CONSULTA: ELIMINAR FACTURA
  ===========================================*/

  function eliminarFactura($idFactura)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "DELETE FROM factura WHERE id_factura = ?";
    $params = array($idFactura);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: MOSTRAR DATOS FACTURA
  ===========================================*/

  function cargarDatosFacturaId($idFactura)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * FROM factura WHERE id_factura = ?";
    $params = array($idFactura);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR DATOS FACTURA
  ===========================================*/

  function actualizarFactura($idFactura, $serie, $numero, $cliente, $fechaVencimiento, $tipoCredito, $ordenServicio, $baseImponible, $igv, $subtotal, $detraccion, $total)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "UPDATE factura SET serie_factura = ?, numero_factura = ?, id_cliente_sucursal = ?, fecha_vencimiento = ?, tipo_credito = ?, orden_servicio = ?,
    base_imponible = ?, igv = ?, subtotal = ?, detraccion = ?, total_cobrar = ?
    WHERE id_factura = ?";
    $params = array($serie, $numero, $cliente, $fechaVencimiento, $tipoCredito, $ordenServicio, $baseImponible, $igv, $subtotal, $detraccion, $total, $idFactura);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR ESTADO FACTURA
  ===========================================*/

  function actualizarEstadoFactura($idFactura, $idEstadoFactura)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "UPDATE factura SET id_estado_factura = ?
    WHERE id_factura = ?";
    $params = array($idEstadoFactura, $idFactura);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: REGISTRAR GUIA FACTURA
  ===========================================*/

  function registrarGuiaFactura($idGuiaFactura, $idGuia, $idFactura)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO guia_factura (id_guia_factura, id_guia, id_factura) VALUES (?, ?, ?) ";
    $params = array($idGuiaFactura, $idGuia, $idFactura);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: ELIMINAR GUIA FACTURA
  ===========================================*/

  function eliminarGuiaFactura($idFactura)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "DELETE FROM guia_factura WHERE id_factura = ? ";
    $params = array($idFactura);

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }
}
