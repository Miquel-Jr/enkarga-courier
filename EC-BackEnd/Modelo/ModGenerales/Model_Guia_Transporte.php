<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR GUIA TRANSPORTE

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA GUIA TRANSPORTE
===========================================*/

class Model_Guia_Transporte
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
    CONSULTA: REGISTRAR GUIA TRANSPORTE
  ===========================================*/

  function registrarGuiaTransporte($idGuia, $proveedor, $numeroGuia, $idEstadoGuiaTransporte, $numeroFactura, $origen, $destino, $descripcion, $cantidadBulto, $observaciones, $reparto, $subtotal, $igv, $total, $fechaDespacho, $tipoTransporte)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO `guia_transporte` ( `id_guia_transporte`,`id_guia`, `id_proveedor`, `numero_guia`, `id_estado_guia_transporte`, `numero_factura`, `origen`, `destino`, `descripcion`, `cantidad_bulto`, `observaciones`, `reparto`, `subtotal`, `igv`, `total`, `fecha_despacho`, `tipo_transporte`)
     VALUES ( NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Ejecutar la consulta con los parámetros
    $params = array($idGuia, $proveedor, $numeroGuia, $idEstadoGuiaTransporte, $numeroFactura, $origen, $destino, $descripcion, $cantidadBulto, $observaciones, $reparto, $subtotal, $igv, $total, $fechaDespacho, $tipoTransporte);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_id();
  }

  /*===========================================
    CONSULTA: REGISTRAR GUIA TRANSPORTE
  ===========================================*/

  function actualizarGuiaTransporte($idGuiaTransporte, $idGuia, $proveedor, $numeroGuia, $idEstadoGuiaTransporte, $numeroFactura, $origen, $destino, $descripcion, $cantidadBulto, $observaciones, $reparto, $subtotal, $igv, $total, $fechaDespacho, $tipoTransporte)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "UPDATE guia_transporte SET id_guia = ?, id_proveedor = ?, numero_guia = ? , id_estado_guia_transporte = ?, numero_factura = ?, origen = ?,
    destino = ?, descripcion = ?, cantidad_bulto = ?, observaciones = ?, reparto = ?, subtotal = ?, igv = ?, total = ?, fecha_despacho = ?, tipo_transporte = ?
    WHERE id_guia_transporte = ?";

    // Ejecutar la consulta con los parámetros
    $params = array($idGuia, $proveedor, $numeroGuia, $idEstadoGuiaTransporte, $numeroFactura, $origen, $destino, $descripcion, $cantidadBulto, $observaciones, $reparto, $subtotal, $igv, $total, $fechaDespacho, $tipoTransporte, $idGuiaTransporte);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: CARGAR GUIA TRANSPORTE
  ===========================================*/

  function cargarDatosGuiaTransporteIdGuia($idGuia)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * FROM guia_transporte WHERE id_guia = ?";

    // Ejecutar la consulta con los parámetros
    $params = array($idGuia);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: CARGAR LISTADO GUIA TRANSPORTE
  ===========================================*/

  function cargarListadoGuiaTransporte()
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT g.serie_guia, g.numero_guia, gt.numero_guia nro_guia,  gt.tipo_transporte, p.ruc, p.razon_social, gt.numero_factura,
    gt.origen, gt.destino, gt.total, gt.fecha_registro, egt.id_estado_guia_transporte ,egt.descripcion estado
    FROM guia_transporte gt
    INNER JOIN guia g ON g.id_guia = gt.id_guia
    INNER JOIN proveedor p ON p.id_proveedor = gt.id_proveedor
    INNER JOIN estado_guia_transporte egt ON egt.id_estado_guia_transporte = gt.id_estado_guia_transporte ";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }
}
