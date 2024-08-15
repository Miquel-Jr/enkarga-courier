<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR ESTADOS GUIA

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA ESTADOS GUIA
===========================================*/

class Model_Estados_Guia
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
      CONSULTA: MOSTRAR ESTADOS GUIA
    ===========================================*/

  function mostrarEstadosGuia()
  {
    $sql = "SELECT * FROM estado_guia";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
      CONSULTA: MOSTRAR ESTADOS GUIA TRANSPORTE
    ===========================================*/

  function mostrarEstadosGuiaTransporte()
  {
    $sql = "SELECT * FROM estado_guia_transporte";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }
}
