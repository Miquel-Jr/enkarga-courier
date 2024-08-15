<?php

/*==========================================================

CLASE CONEXION
>>conexion{}

1) Se declaran las variables generales de conexion a la Base de Datos

2) Se realiza la conexion por medio de mysqli

3) Se crean las funciones generales de consulta a la Base de datos

==========================================================*/

class conexion
{

  private $_conexion;
  private $_base_datos;
  private $_sql;
  private $_result;
  private $_stmt;

  /*=====================================
	       FUNCION CONSTRUCTOR
	 ====================================*/

  public function __construct()
  {

    $host = 'localhost';              //DIRECCION DEL HOST DONDE ESTARA ALOJADA LA BD
    $user = 'root';                   //USUARIO DE INGRESO A LA BD
    $password = '';
    $database_name = 'enkargadb';     //NOMBRE DE LA BD

    $this->_conexion = new mysqli($host, $user, $password, $database_name);


    //ERROR A MOSTRAR SI LA CONSULTA ES FALLIDA
    if ($this->_conexion->connect_errno) {
      echo "Fallo al conectar con la Base de Datos. Verificar conexión.";
      exit();
    }

    $this->_conexion->set_charset("utf8");
  }

  private function liberar_resultados()
  {
    while ($this->_conexion->more_results() && $this->_conexion->next_result()) {
      if ($result = $this->_conexion->store_result()) {
        $result->free();
      }
    }
  }

  public function ejecutar_sentencia($sql, $params = array())
  {
    $this->liberar_resultados();
    $this->_stmt = $this->_conexion->prepare($sql);

    if (!$this->_stmt) {
      echo "Error al preparar la consulta: " . $this->_conexion->error;
      return false;
    }

    if (!empty($params)) {
      $types = str_repeat('s', count($params));
      $this->_stmt->bind_param($types, ...$params);
    }

    if (!$this->_stmt->execute()) {
      echo "Error al ejecutar la consulta: " . $this->_stmt->error;
      return false;
    }

    return true;
  }

  public function retornar_array()
  {
    $result = $this->_stmt->get_result();
    $array_result = $result->fetch_assoc();
    $result->free();
    return $array_result;
  }

  public function retorna_select()
  {
    $result = $this->_stmt->get_result();
    $test = array();
    while ($fila = $result->fetch_assoc()) {
      $test[] = $fila;
    }
    $result->free();
    return $test;
  }

  public function insert_registro()
  {
    return "REGISTRO EXITOSO";
  }

  public function insert_id()
  {
    return $this->_conexion->insert_id;
  }

  public function __destruct()
  {
    if ($this->_stmt) {
      $this->_stmt->close();
    }
    $this->_conexion->close();
  }
}
