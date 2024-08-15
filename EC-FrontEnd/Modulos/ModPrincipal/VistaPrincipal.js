/*==========================================================

ACCIONES A REALIZAR AL CARGAR LA PAGINA

==========================================================*/

$(document).ready(function () {});

/*==========================================================

RELOJ

==========================================================*/

function clock() {
  // We create a new Date object and assign it to a variable called "time".
  var time = new Date(),
    // Access the "getHours" method on the Date object with the dot accessor.
    hours = time.getHours(),
    // Access the "getMinutes" method with the dot accessor.
    minutes = time.getMinutes(),
    seconds = time.getSeconds();

  document.querySelectorAll(".clock")[0].innerHTML =
    harold(hours) + ":" + harold(minutes) + ":" + harold(seconds);

  function harold(standIn) {
    if (standIn < 10) {
      standIn = "0" + standIn;
    }
    return standIn;
  }
}
var intervalo = setInterval(clock, 1000);

mostrarGraficoSeguimiento();

/*==========================================================

MOSTRAR GRAFICO DE SEGUIMIENTO DE LAS ORDENES DE PRODUCCION

==========================================================*/
function mostrarGraficoSeguimiento() {
  let monthLabels = getMonthLabels();
  let numMonths = monthLabels.length;
  let dataGuias = new Array(numMonths).fill(0);
  let dataFacturas = new Array(numMonths).fill(0);
  let ctxL = document.getElementById("lineChart").getContext("2d");
  $.ajax({
    url: "../EC-BackEnd/Controlador/ModPrincipal/Controlador_MostrarGuiaFacturaMes.php",
    type: "GET",
    dataType: "json",
    error: function (error) {
      if (error.status == 401) {
        Swal.fire({
          icon: "error",
          title: "Error del servidor",
          text: "No se pudo establecer conexion con el servidor",
        });
      } else {
        Swal.fire({
          icon: "error",
          title: "Error no identificado",
          text: "Contactarse con su proveedor",
        });
      }
    },
    success: function (datos) {
      if (datos.response === 0) {
        datos = [];
      }
      datos.forEach((element) => {
        const mesIndex = Number(element.mes) - 1;
        dataGuias[mesIndex] = element.guias_completas;
        dataFacturas[mesIndex] = element.facturas_completas;
      });
      new Chart(ctxL, {
        type: "line",
        data: {
          labels: monthLabels,
          datasets: [
            {
              label: "Guias completas",
              data: dataGuias,
              backgroundColor: ["rgba(105, 0, 132, .2)"],
              borderColor: ["rgba(200, 99, 132, .7)"],
              borderWidth: 2,
            },
            {
              label: "Facturas completas",
              data: dataFacturas,
              backgroundColor: ["rgba(0, 137, 132, .2)"],
              borderColor: ["rgba(0, 10, 130, .7)"],
              borderWidth: 2,
            },
          ],
        },
        options: {
          responsive: true,
        },
      });
    },
  });
}

function getMonthNames() {
  return [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
  ];
}

function getMonthLabels() {
  const monthNames = getMonthNames();
  const currentMonth = new Date().getMonth();
  return monthNames.slice(0, currentMonth + 1);
}
