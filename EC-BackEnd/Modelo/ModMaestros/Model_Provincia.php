<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR PROVINCIA

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA PROVINCIA
===========================================*/

class Model_Provincia
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
        CONSULTA: MOSTRAR DATOS PROVINCIA
    ===========================================*/

  public function mostrarProvincia($idDepartamento)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT * FROM provincia WHERE id_departamento = ? ";
    $params = array($idDepartamento);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retorna_select();
  }

  public function mostrarProvinciaXIdProvincia($idProvincia)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT * FROM provincia WHERE id_provincia = ? ";
    $params = array($idProvincia);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }
}
