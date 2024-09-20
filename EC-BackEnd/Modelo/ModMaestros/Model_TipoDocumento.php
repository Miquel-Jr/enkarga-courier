<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR TIPO DOCUMENTO

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA TIPO DOCUMENTO
===========================================*/

class Model_TipoDocumento
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
    CONSULTA: MOSTRAR TIPO DOCUMENTOS
  ===========================================*/

  function mostrarTipoDocumentos()
  {
    $sql = "SELECT * FROM TIPO_DOCUMENTO";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }
}
