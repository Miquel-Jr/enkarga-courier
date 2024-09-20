    <!--=================================
            BARRA DE NAVEGACION
    ==================================-->

    <!--XXXXXXXXXXXXXX BARRA SUPERIOR XXXXXXXXXXXXXXXXXXXXX-->
    <nav class="mb-1 navbar navbar-expand-lg navbar-dark principal fixed-top scrolling-navbar">

      <!--BOTON DESPLEGAR-->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#barraIzq" aria-controls="barraIzq" aria-expanded="true" aria-label="Toggle navigation">

        <span class="navbar-toggler-icon"></span>

      </button>

      <!--TITULO-->
      <a class="navbar-brand text-white font-weight-bold mr-0 d-none d-md-block" onclick="validarPerfiles();return false">
        <img src="Elementos/E-Icon.png" height="30" class="d-inline-block align-top mr-2" alt="mdb logo">Enkarga Courier S.A.C.
      </a>

      <!--CONTENIDO DEL MENU-->
      <ul class="nav white-text ml-auto">

        <!--ELEMENTO DEL MENU 1 -->
        <li class="nav-item active">
          <a class="nav-link" onclick="validarPerfiles();return false">
            <i class="fas fa-home"></i>Inicio
            <span class="sr-only">(current)</span>
          </a>
        </li>

        <!--ELEMENTO DEL MENU 2 -->
        <li class="nav-item">
          <a class="nav-link" onclick="window.print();return false">
            <i class="fas fa-print"></i>Imprimir</a>
        </li>

        <!--ELEMENTO DEL MENU 3 -->
        <li class="nav-item">
          <a class="nav-link" onclick="limpiarSesion();return false">
            <i class="fas fa-times-circle"></i>Salir</a>
        </li>

      </ul>

    </nav>
    <!--XXXXXXXXXXXX FIN BARRA SUPERIOR XXXXXXXXXXXXXXXXXXX-->

    <!--XXXXXXXXXXXXXX BARRA LATERAL IZQUIERDA XXXXXXXXXXXXXXXXXXXXX-->
    <div id="barraIzq" class="collapse navbar-collapse show col-7 col-sm-4 col-md-3 col-xl-2 principal lighten-1 px-0">
      <div class="list-group" id="list-tab" role="tablist">


        <?php
        if ($_SESSION["clientes"]) {
        ?>
          <!--===========================
              MODULO CLIENTE
            ============================-->

          <a id="CLIENTE" class="list-group-item list-group-item-action black white-text font-weight-bold" data-toggle="list" role="tab" style="cursor: default;"><i class="fas fa-lg fa-users white-text mr-2"></i>Clientes</a>
          <!--======= NUEVO CLIENTE  =======-->
          <a id="CCLIENTE" onclick="ventanaClienteCrear();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Crear cliente</a>

          <!--======= LISTAR CLIENTE =======-->
          <a id="LCLIENTE" onclick="ventanaClienteListar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Listar cliente</a>
          
          <!--======= LISTAR CLIENTE-SUCURSALES =======-->
          <a id="LCLIENTE" onclick="ventanaClienteSucursalListar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Listar cliente sucursal</a>

          <!--======= ACTUALIZAR CLIENTE  =======-->
          <a id="ACLIENTE" onclick="ventanaClienteActualizar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Actualizar cliente</a>

        <?php
        };
        if ($_SESSION["proveedor"]) {
        ?>
          <!--===========================
              MODULO PROVEEDOR
            ============================-->
          <a id="PROVEEDOR" class="list-group-item list-group-item-action black white-text font-weight-bold" data-toggle="list" role="tab" style="cursor: default;"><i class="fas fa-lg fa-truck white-text mr-2"></i>Transportista</a>

          <!--======= NUEVO PROVEEDOR  =======-->
          <a id="CPROVEEDOR" onclick="ventanaProveedorCrear();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Crear transportista</a>

          <!--======= LISTAR PROVEEDOR =======-->
          <a id="LPROVEEDOR" onclick="ventanaProveedorListar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Listar transportista</a>

          <!--======= ACTUALIZAR PROVEEDOR  =======-->
          <a id="APROVEEDOR" onclick="ventanaProveedorActualizar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Actualizar transportista</a>
        <?php
        };
        if ($_SESSION["personal"]) {
        ?>
          <!--===========================
            MODULO RECURSOS HUMANOS
          ============================-->
          <a id="PERSONAL" class="list-group-item list-group-item-action black white-text font-weight-bold" data-toggle="list" role="tab" style="cursor: default;"><i class="fas fa-lg fa-user white-text mr-2"></i>Personal</a>

          <!--======= NUEVO USUARIO  =======-->
          <a id="USUARIO" onclick="ventanaPersonalCrear();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Crear Personal</a>

          <!--======= LISTAR USUARIOS  =======-->
          <a id="USUARIO" onclick="ventanaPersonalListar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Listar Personal</a>

          <!--======= ACTUALIZAR USUARIOS  =======-->
          <a id="USUARIO" onclick="ventanaPersonalActualizar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Actualizar Personal</a>

          <!--======= ACCESOS =======-->
          <a id="ACCESOS" onclick="ventanaAccesosPersonal();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Accesos</a>
        <?php
        };
        if ($_SESSION["operaciones"]) {
        ?>
          <!--===========================
            MODULO OPERACIONES
          ============================-->
          <a id="OPERACIONES" class="list-group-item list-group-item-action black white-text font-weight-bold" data-toggle="list" role="tab" style="cursor: default;"><i class="fas fa-lg fa-file-invoice white-text mr-2"></i>Operaciones</a>

          <!--======= NUEVO GUIA =======-->
          <a id="CGUIA" onclick="ventanaGuiaCrear();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Crear Guia</a>

          <!--======= LISTAR GUIA =======-->
          <a id="LGUIA" onclick="ventanaGuiaListar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Listar Guia</a>

          <!--======= ACTUALIZAR GUIA =======-->
          <a id="AGUIA" onclick="ventanaGuiaActualizar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Actualizar Guia</a>

          <!--======= SEGUIMIENTO GUIA =======-->
          <a id="SGUIA" onclick="ventanaGuiaSeguimiento();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Seguimiento Guia</a>

          <!--======= REPORTE USUARIO =======-->
          <a id="REPORTE" onclick="ventanaReportePersonal();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Reporte Personal</a>
        <?php
        };
        if ($_SESSION["contabilidad"]) {
        ?>
          <!--===========================
            MODULO CONTABILIDAD
          ============================-->
          <a id="CONTABILIDAD" class="list-group-item list-group-item-action black white-text font-weight-bold" data-toggle="list" role="tab" style="cursor: default;"><i class="fas fa-lg fa-shopping-bag  white-text mr-2"></i>Contabilidad</a>

          <!--======= NUEVO FACTURA  =======-->
          <a id="CFACTURA" onclick="ventanaFacturaCrear();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Crear Factura</a>

          <!--======= LISTAR FACTURA  =======-->
          <a id="LFACTURA" onclick="ventanaFacturaListar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Listar Factura</a>

          <!--======= ACTUALIZAR FACTURA  =======-->
          <a id="AFACTURA" onclick="ventanaFacturaActualizar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Actualizar Factura</a>

          <!--======= LISTAR DEPOSITO  =======-->
          <a id="LDEPOSITO" onclick="ventanaDepositoListar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Listar Deposito</a>
          
          <!--======= LISTAR NOTA DE CREDITO  =======-->
          <a id="LDEPOSITO" onclick="ventanaNotaCreditoListar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Listar Nota Credito</a>
          
          <!--======= LISTAR GUIA FACTURA TRANSPORTE  =======-->
          <a id="LDEPOSITO" onclick="ventanaGuiaFacturaListar();return false" class="py-0 list-group-item list-group-item-action principal white-text font-weight-bold" data-toggle="list" role="tab">Listar Guia Factura Transporte</a>

        <?php
        };
        ?>

      </div>
    </div>
    <!--XXXXXXXXXXXX FIN BARRA LATERAL IZQUIERDA XXXXXXXXXXXXXXXXXXX-->