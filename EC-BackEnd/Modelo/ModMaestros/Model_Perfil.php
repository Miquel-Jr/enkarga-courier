<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR PERFIL

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA PERFIL
===========================================*/

class Model_Perfil
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
      - CONSULTA: MOSTRAR PERFIL ACTIVO
    ===========================================*/

  function mostrarPerfilActivo()
  {
    $sql = "SELECT * FROM perfil WHERE id_estado = 1";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: MOSTRAR PERFIL
  ===========================================*/

  function mostrarPerfil()
  {
    $sql = "SELECT * FROM perfil";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }
}
