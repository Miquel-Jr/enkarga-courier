<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR GUIA

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA GUIA
===========================================*/

class Model_Guia
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
    CONSULTA: LISTADO GUIAS
  ===========================================*/

  function mostrarGuias($ordenCompra, $cotizacion, $fechaInicio, $fechaFin)
  {
    $sql = "SELECT g.id_guia, g.serie_guia, g.numero_guia, g.fecha_emision, g.fecha_registro, g.orden_compra ,g.codigo_cotizacion,
    CONCAT(c.nombres, ' ', c.apellidos) cliente , COALESCE(CONCAT(t.nombres, ' ', t.apellidos), '-') transportista, 
    CONCAT(p.nombres, ' ', p.apellidos) usuario , eg.descripcion estado , eg.id_estado_guia
    FROM guia g 
    INNER JOIN estado_guia eg ON eg.id_estado_guia = g.id_estado_guia
    INNER JOIN cliente c ON c.id_cliente = g.id_cliente
    INNER JOIN personal p ON p.id_personal = g.id_usuario
    LEFT JOIN personal t ON t.id_personal = g.id_transportista
    WHERE 1=1 ";
    $params = [];
    if (!empty($ordenCompra)) {
      $sql .= " AND g.orden_compra = ?";
      $params[] = $ordenCompra;
    }

    if (!empty($cotizacion)) {
      $sql .= " AND g.codigo_cotizacion = ?";
      $params[] = $cotizacion;
    }

    if (!empty($fechaInicio)) {
      $sql .= " AND g.fecha_registro >= ?";
      $params[] = $fechaInicio . ' 00:00:00';
    }

    if (!empty($fechaFin)) {
      $sql .= " AND g.fecha_registro <= ?";
      $params[] = $fechaFin . ' 23:59:59';
    }
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: REGISTRAR GUIA
  ===========================================*/

  function registrarGuia($serie, $numero, $fechaEmision, $idTransportista, $idCliente, $ordenCompra, $cotizacion, $remitente, $direccionRemitente, $destinatario, $direccionDestinatario, $largoGuia, $anchoGuia, $altoGuia, $idPersonal)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO `guia` (`id_guia`, `serie_guia`, `numero_guia`, `fecha_emision`, `id_transportista`, `id_cliente`, `orden_compra` , `codigo_cotizacion`, `id_sucursal_remitente`, `direccion_remitente`,
     `id_sucursal_destinatario`, `direccion_destinatario`, `largo_guia`, `ancho_guia`, `alto_guia` ,`id_usuario`)
     VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Ejecutar la consulta con los parámetros
    $params = array($serie, $numero, $fechaEmision, $idTransportista, $idCliente, $ordenCompra, $cotizacion, $remitente, $direccionRemitente, $destinatario, $direccionDestinatario, $largoGuia, $anchoGuia, $altoGuia, $idPersonal);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_id();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR GUIA
  ===========================================*/

  function actualizarDatosGuia($serie, $numero, $fechaEmision, $idTransportista, $idCliente, $ordenCompra, $cotizacion, $remitente, $direccionRemitente, $destinatario, $direccionDestinatario, $largoGuia, $anchoGuia, $altoGuia, $idGuia)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "UPDATE guia SET serie_guia = ?, numero_guia = ? , fecha_emision = ?, id_transportista = ?, id_cliente = ?, orden_compra = ?,
    codigo_cotizacion = ?, id_sucursal_remitente = ?, direccion_remitente = ?, id_sucursal_destinatario = ?, direccion_destinatario = ?,
    largo_guia = ?, ancho_guia = ? , alto_guia = ? WHERE id_guia = ?";

    // Ejecutar la consulta con los parámetros
    $params = array($serie, $numero, $fechaEmision, $idTransportista, $idCliente, $ordenCompra, $cotizacion, $remitente, $direccionRemitente, $destinatario, $direccionDestinatario, $largoGuia, $anchoGuia, $altoGuia, $idGuia);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: BUSCAR GUIA
  ===========================================*/

  function buscarGuia($serieGuia, $numeroGuia)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * FROM guia WHERE serie_guia = ? and numero_guia = ? and id_estado_guia != 7";

    // Ejecutar la consulta con los parámetros
    $params = array($serieGuia, $numeroGuia);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: CARGAR GUIA
  ===========================================*/

  function cargarGuia($idGuia)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT g.*,  CONCAT(c.nombres, ' ', c.apellidos) cliente, COALESCE(CONCAT(t.nombres, ' ', t.apellidos), '-') transportista
    FROM guia g 
    LEFT JOIN cliente c ON c.id_cliente = g.id_cliente 
    LEFT JOIN personal t ON t.id_personal = g.id_transportista 
    WHERE g.id_guia = ?";

    // Ejecutar la consulta con los parámetros
    $params = array($idGuia);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: MOSTRAR GUIAS PENDIENTES
  ===========================================*/

  function mostrarGuiasPendientes()
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT g.serie_guia, g.numero_guia, CONCAT(c.nombres, ' ', c.apellidos) cliente
    FROM guia g 
    INNER JOIN cliente c ON c.id_cliente = g.id_cliente 
    WHERE g.id_estado_guia = 1
    ORDER BY g.fecha_registro DESC";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: MOSTRAR GUIAS VIGENTES
  ===========================================*/

  function mostrarGuiasVigentes()
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * 
    FROM guia g 
    WHERE g.id_estado_guia != 7
    ORDER BY g.fecha_registro DESC";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: ACTUAIZAR ESTADO ID GUIA
  ===========================================*/

  function actualizarEstadoIdGuia($idGuia, $idEstadoGuia)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "UPDATE guia SET id_estado_guia = ? WHERE id_guia = ?";

    // Ejecutar la consulta con los parámetros
    $params = array($idEstadoGuia, $idGuia);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: MOSTRAR REPORTE GUIA - PERSONAL
  ===========================================*/

  function mostrarReportePersonal($idPersonal, $fechaInicio, $fechaFin)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT p.id_personal, COALESCE(g.serie_guia, t.serie_guia) serie_guia, COALESCE(g.numero_guia, t.numero_guia) numero_guia, 
    COALESCE(eg.descripcion, eg2.descripcion) estado, COALESCE(g.fecha_registro, t.fecha_registro) fecha_registro,
    COALESCE(g.direccion_remitente, t.direccion_remitente) origen, COALESCE(g.direccion_destinatario, t.direccion_destinatario) destino, 
    CONCAT(p.nombres, ' ', p.apellidos) personal, pe.perfil perfil
    FROM personal p
    LEFT JOIN usuario u ON p.id_personal = u.id_personal
    LEFT JOIN perfil pe ON u.id_perfil = pe.id_perfil
    LEFT JOIN guia g ON p.id_personal = g.id_usuario
    LEFT JOIN estado_guia eg ON g.id_estado_guia = eg.id_estado_guia
    LEFT JOIN guia t ON p.id_personal = t.id_transportista
    LEFT JOIN estado_guia eg2 ON t.id_estado_guia = eg2.id_estado_guia 
    WHERE ((g.fecha_registro BETWEEN ? AND ?) OR (t.fecha_registro BETWEEN ? AND ?))
    AND (g.id_guia IS NOT NULL OR t.id_guia IS NOT NULL)
    AND (g.id_estado_guia <> 7 OR t.id_estado_guia <> 7)
    AND (0 = ? OR p.id_personal = ?)
    ";

    // Ejecutar la consulta con los parámetros
    $params = array($fechaInicio, $fechaFin, $fechaInicio, $fechaFin, $idPersonal, $idPersonal);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: CARGAR GUIAS SIN FACTURAR
  ===========================================*/

  function cargarGuiasSinFactura()
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT g.id_guia, g.serie_guia, g.numero_guia, g.orden_compra, g.codigo_cotizacion FROM guia g
    LEFT JOIN guia_factura f ON g.id_guia = f.id_guia
    WHERE g.id_estado_guia = 6 and f.id_guia IS NULL";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: CARGAR GUIAS SIN FACTURAR
  ===========================================*/

  function cargarGuiasFactura($idFactura)
  {
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT f.id_guia_factura, g.id_guia, g.serie_guia, g.numero_guia, g.orden_compra, g.codigo_cotizacion FROM guia g
    LEFT JOIN guia_factura f ON g.id_guia = f.id_guia
    WHERE f.id_factura = ?";

    // Ejecutar la consulta con los parámetros
    $params = array($idFactura);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retorna_select();
  }
}
