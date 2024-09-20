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
    $sql = "SELECT ce.*, d.descripcion distrito, p.descripcion provincia, de.descripcion departamento
    FROM configuracion_empresa ce
    INNER JOIN distrito d ON d.id_distrito = ce.id_distrito
    INNER JOIN provincia p ON p.id_provincia = d.id_provincia
    INNER JOIN departamento de ON de.id_departamento = d.id_departamento";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retornar_array();
  }
}
