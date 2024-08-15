<?php

/*===========================================
CLASE: MODELO DEL LOGIN

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    AL INICIO DE SESION DEL USUARIO
===========================================*/

class Model_Login
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

    public function ingresoUsuario($username, $password)
    {

        //FUNCION CON LA CONSULTA A REALIZAR
        $sql = "SELECT * FROM usuario WHERE USUARIO = '$username' AND CLAVE = '$password' AND ID_ESTADO = 1";
        $this->_conexion->ejecutar_sentencia($sql);
        return $this->_conexion->retornar_array();
    }
}
