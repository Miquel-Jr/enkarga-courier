<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR PERSONAL

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA PERSONAL
===========================================*/

class Model_Personal
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
    - CONSULTA: MOSTRAR PERSONAL
  ===========================================*/

  function mostrarPersonal()
  {
    $sql = "SELECT p.id_personal, p.nombres, p.apellidos, td.descripcion tipo_documento, p.numero_documento, 
    pe.id_perfil id_perfil, pe.perfil perfil, u.usuario, e.descripcion estado 
    FROM personal p 
    INNER JOIN tipo_documento td ON td.tipo_documento = p.tipo_documento 
    INNER JOIN estado e ON e.id_estado  = p.id_estado 
    INNER JOIN usuario u ON  u.id_personal = p.id_personal 
    INNER JOIN perfil pe ON pe.id_perfil = u.id_perfil";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: MOSTRAR TRANSPORTISTAS
  ===========================================*/

  function mostrarTransportistasActivos()
  {
    $sql = "SELECT p.id_personal, p.nombres, p.apellidos, td.descripcion tipo_documento, p.numero_documento, 
    pe.perfil perfil, u.usuario, e.descripcion estado FROM personal p 
    INNER JOIN tipo_documento td ON td.tipo_documento = p.tipo_documento 
    INNER JOIN estado e ON e.id_estado  = p.id_estado and e.id_estado = 1
    INNER JOIN usuario u ON  u.id_personal = p.id_personal 
    INNER JOIN perfil pe ON pe.id_perfil = u.id_perfil and u.id_perfil = 3";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: CARGAR PERSONAL
  ===========================================*/

  function cargarPersonal($idPersonal)
  {
    $sql = "SELECT * FROM personal WHERE id_personal = $idPersonal";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    - CONSULTA: CARGAR PERSONAL
  ===========================================*/

  function validarPersonal($numeroDocumento)
  {
    $sql = "SELECT * FROM personal WHERE numero_documento = $numeroDocumento";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    - CONSULTA: REGISTRAR PERSONAL
  ===========================================*/

  public function registrarPersonal($nombres, $apellidos, $correo, $fechaNacimiento, $idDistrito, $tipoDocumento, $numeroDocumento, $direccion, $telefono, $celular)
  {

    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO `personal` (`id_personal`, `nombres`, `apellidos`, `correo`, `fecha_nacimiento`, `id_distrito`, `tipo_documento`, `numero_documento`, `direccion`, `telefono`, `celular`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Ejecutar la consulta con los parámetros
    $params = array($nombres, $apellidos, $correo, $fechaNacimiento, $idDistrito, $tipoDocumento, $numeroDocumento, $direccion, $telefono, $celular);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_id();
  }

  /*===========================================
    - CONSULTA: ACTUALIZAR PERSONAL 
  ===========================================*/

  public function actualizarPersonal($idPersonal, $nombres, $apellidos, $correo, $fechaNacimiento, $idDistrito, $tipoDocumento, $numeroDocumento, $direccion, $telefono, $celular, $idEstado)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "UPDATE personal SET nombres = ?, apellidos = ?, correo = ?, fecha_nacimiento = ?, id_distrito = ?, tipo_documento = ?, numero_documento = ?, direccion = ?, telefono = ?, celular = ?, id_estado = ?  WHERE id_personal = ?";
    $params = array($nombres, $apellidos, $correo, $fechaNacimiento, $idDistrito, $tipoDocumento, $numeroDocumento, $direccion, $telefono, $celular, $idEstado, $idPersonal);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }
}
