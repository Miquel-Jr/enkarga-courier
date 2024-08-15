<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR DEPARTAMENTO

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA DEPARTAMENTO
===========================================*/

class Model_Departamento
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
        CONSULTA: MOSTRAR DATOS DEPARTAMENTO
    ===========================================*/

    public function mostrarDepartamento()
    {

        //FUNCION CON LA CONSULTA A REALIZAR
        $sql = "SELECT * FROM departamento ";
        $this->_conexion->ejecutar_sentencia($sql);
        return $this->_conexion->retorna_select();
    }
}
