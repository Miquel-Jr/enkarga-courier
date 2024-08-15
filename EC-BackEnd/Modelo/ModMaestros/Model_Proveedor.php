<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR PROVEEDOR

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA PROVEEDOR
===========================================*/

class Model_Proveedor
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
    CONSULTA: MOSTRAR DATOS PROVEEDOR
  ===========================================*/

  public function mostrarProveedores()
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT p.id_proveedor, p.ruc, p.razon_social, p.direccion, p.correo, p.telefono, p.celular,
    e.descripcion estado, p.id_estado, d.descripcion distrito
    FROM proveedor p 
    INNER JOIN estado e ON e.id_estado = p.id_estado 
    INNER JOIN  distrito d on d.id_distrito = p.id_distrito";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: REGISTRAR PROVEEDOR
  ===========================================*/

  public function registrarProveedor($ruc, $razonSocial, $correo, $distrito, $direccion, $telefonoEmpresa, $celularEmpresa)
  {

    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO `proveedor` (`id_proveedor`, `ruc`, `razon_social`, `correo`, `id_distrito`, `direccion`, `telefono`, `celular`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)";

    // Ejecutar la consulta con los parámetros
    $params = array($ruc, $razonSocial, $correo, $distrito, $direccion, $telefonoEmpresa, $celularEmpresa);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: MOSTRAR PROVEEDOR
  ===========================================*/

  public function mostrarProveedor($idProveedor)
  {
    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT * FROM proveedor WHERE id_proveedor = ?";
    $params = array($idProveedor);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: MOSTRAR PROVEEDORES ACTIVOS
  ===========================================*/

  public function mostrarProveedoresActivos()
  {
    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT * FROM proveedor WHERE id_estado = 1";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: VALIDAR PROVEEDOR
  ===========================================*/

  public function validarProveedor($ruc)
  {
    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT * FROM proveedor WHERE ruc = ?";
    $params = array($ruc);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR PROVEEDOR
  ===========================================*/

  public function actualizarProveedor($idProveedor, $ruc, $razonSocial, $correo, $distrito, $direccion, $telefonoEmpresa, $celularEmpresa, $idEstado)
  {
    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "UPDATE proveedor SET  ruc = ?, razon_social = ?, correo = ?, id_distrito = ?, direccion = ?, telefono = ?, celular = ?, id_estado = ? WHERE id_proveedor = ?";
    $params = array($ruc, $razonSocial, $correo, $distrito, $direccion, $telefonoEmpresa, $celularEmpresa, $idEstado, $idProveedor);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: ACTUALIZAR ESTADO PROVEEDOR
  ===========================================*/

  public function actualizarEstadoProveedor($idProveedor, $idEstado)
  {
    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "UPDATE proveedor SET id_estado = ? WHERE id_proveedor = ?";
    $params = array($idEstado, $idProveedor);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }
}
