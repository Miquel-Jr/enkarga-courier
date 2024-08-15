<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR EMPRESA

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA EMPRESA
===========================================*/

class Model_Empresa
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
        CONSULTA: MOSTRAR DATOS EMPRESA
    ===========================================*/

  public function mostrarEmpresa()
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT * FROM configuracion_empresa ";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retornar_array();
  }
}
