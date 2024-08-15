<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR USUARIO

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA USUARIO
===========================================*/

class Model_Usuario
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
    - CONSULTA: CARGAR USUARIO PERSONAL
  ===========================================*/

  function cargarUsuarioPersonal($idPersonal)
  {
    $sql = "SELECT * FROM usuario WHERE id_personal = $idPersonal";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    - CONSULTA: ACTUALIZAR USUARIO PERSONAL
  ===========================================*/

  function actualizarUsuario($idPersonal, $usuario, $clave, $idPerfil, $idEstado)
  {
    $sql = "UPDATE usuario SET usuario = ?, clave = ?, id_perfil = ?, id_estado = ? WHERE id_personal = ?";
    $params = array($usuario, $clave, $idPerfil, $idEstado, $idPersonal);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    - CONSULTA: ACTUALIZAR USUARIO PERFIL
  ===========================================*/

  function actualizarUsuarioPerfil($idPersonal, $idPerfil)
  {
    $sql = "UPDATE usuario SET id_perfil = ? WHERE id_personal = ?";
    $params = array($idPerfil, $idPersonal);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    - CONSULTA: CREAR USUARIO PERSONAL
  ===========================================*/

  function registrarUsuario($idPersonal, $usuario, $clave, $idPerfil)
  {
    $sql = "INSERT INTO `usuario` (`id_personal`, `usuario`, `clave`, `id_perfil`) VALUES (?, ?, ?, ?)";
    $params = array($idPersonal, $usuario, $clave, $idPerfil);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }
}
