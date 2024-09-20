<?php

/*===========================================
CLASE: MODELO DEL CONTROLADOR CLIENTES

    ALMACENA LAS FUNCIONES CORRESPONDIENTES
    A LA TABLA CLIENTE
===========================================*/

class Model_Clientes
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
    - CONSULTA: VALIDAR REGISTRO CLIENTE
  ===========================================*/

  public function validarClientes($tipoDocumento, $numeroDocumento)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT * FROM  cliente WHERE tipo_documento = ? AND numero_documento = ? ";
    $params = array($tipoDocumento, $numeroDocumento);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    - CONSULTA: CARGAR CLIENTE
  ===========================================*/

  public function cargarCliente($idCliente)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT c.* , td.descripcion tipo_documento_descripcion
    FROM cliente c 
    INNER JOIN tipo_documento td ON td.tipo_documento = c.tipo_documento 
    WHERE c.id_cliente = ? ";
    $params = array($idCliente);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retornar_array();
  }

  /*===========================================
    - CONSULTA: REGISTRAR CLIENTE
  ===========================================*/

  public function registrarCliente($nombres, $apellidos, $correo, $tipoDocumento, $numeroDocumento, $telefono, $celular)
  {

    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO `cliente` (`id_cliente`, `nombres`, `apellidos`, `correo`, `tipo_documento`, `numero_documento`, `telefono`, `celular`)
     VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)";

    // Ejecutar la consulta con los parámetros
    $params = array($nombres, $apellidos, $correo, $tipoDocumento, $numeroDocumento,  $telefono, $celular);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_id();
  }

  /*===========================================
    - CONSULTA: MOSTRAR DATOS DEL CLIENTE
  ===========================================*/

  public function mostrarClientes()
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT c.id_cliente, c.nombres, c.apellidos, td.descripcion as tipo_documento, c.numero_documento, e.descripcion as estado, c.id_estado
    FROM cliente c 
    INNER JOIN estado e ON e.id_estado = c.id_estado 
    INNER JOIN tipo_documento td ON td.tipo_documento = c.tipo_documento ";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: MOSTRAR CLIENTE SUCURSALES
  ===========================================*/

  public function mostrarClientesSucursales()
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT cs.*, d.descripcion distrito, p.descripcion provincia, de.descripcion departamento
    FROM cliente_sucursal cs
    INNER JOIN distrito d ON d.id_distrito = cs.id_distrito
    INNER JOIN provincia p ON p.id_provincia = d.id_provincia
    INNER JOIN departamento de ON de.id_departamento = d.id_departamento";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: MOSTRAR CLIENTES ACTIVOS 
  ===========================================*/

  public function mostrarClientesActivos()
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT id_cliente, nombres, apellidos FROM cliente WHERE id_estado = 1";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: ACTUALIZAR CLIENTE 
  ===========================================*/

  public function actualizarCliente($idCliente, $nombres, $apellidos, $correo, $tipoDocumento, $numeroDocumento, $telefono, $celular, $idEstado)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "UPDATE cliente SET nombres = ?, apellidos = ?, correo = ?, tipo_documento = ?, numero_documento = ?,
    telefono = ?, celular = ?, id_estado = ?  WHERE id_cliente = ?";
    $params = array($nombres, $apellidos, $correo, $tipoDocumento, $numeroDocumento, $telefono, $celular, $idEstado, $idCliente);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    - CONSULTA: ACTUALIZAR ESTADO CLIENTE 
  ===========================================*/

  public function actualizarEstadoCliente($idCliente, $idEstado)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "UPDATE cliente SET id_estado = ?  WHERE id_cliente = ?";
    $params = array($idEstado, $idCliente);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    - CONSULTA: REGISTRAR SUCURSAL
  ===========================================*/

  public function registrarSucursal($idClienteSucursal, $idCliente, $ruc, $razonSocial, $idDistrito, $direccion)
  {

    // Preparar la consulta SQL con sentencia preparada
    $sql = "INSERT INTO `cliente_sucursal` (`id_cliente_sucursal`, `id_cliente`, `ruc`, `razon_social`, `id_distrito`, `direccion`)
     VALUES (?, ?, ?, ?, ?, ?)";

    // Ejecutar la consulta con los parámetros
    $params = array($idClienteSucursal, $idCliente, $ruc, $razonSocial, $idDistrito, $direccion);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }


  /*===========================================
    - CONSULTA: MOSTRAR CLIENTE SUCURSAL 
  ===========================================*/

  public function mostrarListadoSucursal($idCliente)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT cs.*, d.descripcion distrito, cs.razon_social razonSocial, cs.id_distrito idDistrito, 
    p.descripcion provincia, de.descripcion departamento
    FROM cliente_sucursal cs
    INNER JOIN distrito d ON d.id_distrito = cs.id_distrito
    INNER JOIN provincia p ON p.id_provincia = d.id_provincia
    INNER JOIN departamento de ON de.id_departamento = d.id_departamento
    WHERE cs.id_cliente = ?";
    $params = array($idCliente);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    - CONSULTA: ELIMINAR CLIENTE SUCURSAL
  ===========================================*/

  public function eliminarListadoSucursal($idCliente)
  {

    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "DELETE FROM cliente_sucursal WHERE id_cliente = ?";
    $params = array($idCliente);
    $this->_conexion->ejecutar_sentencia($sql, $params);
    return $this->_conexion->insert_registro();
  }

  /*===========================================
    CONSULTA: LISTADO CLIENTE SUCURSALES
  ===========================================*/

  function listadoClienteSucursales($idGuiaDetalles)
  {
    $idsArray = explode(',', $idGuiaDetalles);
    $placeholders = implode(',', array_fill(0, count($idsArray), '?'));
    // Preparar la consulta SQL con sentencia preparada
    $sql = "SELECT * FROM cliente_sucursal WHERE id_cliente IN ($placeholders)";

    // Ejecutar la consulta con los parámetros
    $this->_conexion->ejecutar_sentencia($sql, $idsArray);
    return $this->_conexion->retorna_select();
  }

  /*===========================================
    CONSULTA: CARGAR CLIENTE SUCURSAL
  ===========================================*/

  function cargarClienteSucursal($idClienteSucursal)
  {
    //FUNCION CON LA CONSULTA A REALIZAR
    $sql = "SELECT * FROM cliente_sucursal WHERE id_cliente_sucursal = $idClienteSucursal";
    $this->_conexion->ejecutar_sentencia($sql);
    return $this->_conexion->retornar_array();
  }
}
