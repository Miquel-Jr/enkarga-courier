<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR DISTRITO

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA DISTRITO
===========================================*/

class Model_Distrito
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
        CONSULTA: MOSTRAR DATOS DISTRITO
    ===========================================*/

  public function mostrarDistrito($idProvincia)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT * FROM distrito WHERE id_provincia = ? ";
    $params = array($idProvincia);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    
    return $this->_conexion->retorna_select();
  }

  /*===========================================
        CONSULTA: MOSTRAR DATOS DISTRITO (ID)
    ===========================================*/

  public function mostrarDistritoXIdDistrito($idDistrito)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT * FROM distrito WHERE id_distrito = ? ";
    $params = array($idDistrito);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }
}
