<?php

/*===========================================
CLASE: MODELO DE LA VISTA PRINCIPAL

    PERMITE REALIZAR LAS CONSULTAS PARA MOSTRAR
     - LA CANTIDAD DE OT X ESTADO
     - TRABAJADORES X TURNO
     - ULTIMOS CLIENTES
     - OT EN PRODUCCION
===========================================*/

class Model_Principal
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
    - CONSULTA: MOSTRAR GUIAS/FACTURAS X MES
  ===========================================*/

  public function mostrarGuiaFacturaMes()
  {

    $sql = "SELECT mes, SUM(guias_completas) AS guias_completas, SUM(facturas_completas) AS facturas_completas
          FROM (
            SELECT MONTH(g.fecha_registro) AS mes, COUNT(DISTINCT g.id_guia) AS guias_completas, 0 AS facturas_completas 
            FROM guia g
            WHERE YEAR(g.fecha_registro) = YEAR(CURDATE()) 
            AND g.id_estado_guia = 6
            GROUP BY MONTH(g.fecha_registro)
            
            UNION ALL
            
            SELECT MONTH(f.fecha_registro) AS mes, 0 AS guias_completas, COUNT(DISTINCT f.id_factura) AS facturas_completas 
            FROM factura f
            WHERE YEAR(f.fecha_registro) = YEAR(CURDATE()) 
            AND f.id_estado_factura = 2
            GROUP BY MONTH(f.fecha_registro)
          ) combined
          GROUP BY mes
          ORDER BY mes";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: MOSTRAR GUIAS DEL DIA
  ===========================================*/

  public function mostrarGuiasHoy()
  {

    $sql = "SELECT serie_guia, numero_guia FROM guia WHERE DATE(fecha_registro) = DATE(CURDATE()) AND id_estado_guia <> 7";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: MOSTRAR ULTIMOS CLIENTES
  ===========================================*/

  public function mostrarFacturasPendientes()
  {

    $sql = "SELECT serie_factura, numero_factura FROM factura WHERE DATE(fecha_registro) = DATE(CURDATE()) AND id_estado_factura = 1";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }
}
