<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR MEDIDAS

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA MEDIDAS
===========================================*/

class Model_Medidas
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
    - CONSULTA: MOSTRAR MEDIDAS
  ===========================================*/

  function mostrarMedidas()
  {
    $sql = "SELECT * FROM medida";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: REGISTRAR MEDIDAS
  ===========================================*/

  function registrarMedida($medida, $abreviatura)
  {
    $sql = "INSERT INTO medida (medida, abreviatura) VALUES (?, ?)";
    $params = array($medida, $abreviatura);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }
}
