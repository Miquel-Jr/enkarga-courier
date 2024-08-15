<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR ESTADOS

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA ESTADOS
===========================================*/

class Model_Estados
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
    - CONSULTA: MOSTRAR ESTADOS
  ===========================================*/

  function mostrarEstados()
  {
    $sql = "SELECT * FROM estado";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: MOSTRAR ESTADOS FACTURA
  ===========================================*/

  function mostrarEstadosFactura()
  {
    $sql = "SELECT * FROM estado_factura";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }
}
