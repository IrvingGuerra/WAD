<%-- 
    Document   : crearintercambios
    Created on : 12-nov-2018, 13:35:02
    Author     : Sir-M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Intercambio de Regalos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style type="text/css">
          @font-face{
            font-family: Navidad;
            src: url('fonts/Navidad.ttf') format('truetype');
          }
          @font-face{
            font-family: ChristmasFlake;
            src: url('fonts/ChristmasFlake.ttf') format('truetype');
          }
          @font-face{
            font-family: ChristmasStar;
            src: url('fonts/ChristmasStar.ttf') format('truetype');
          }
          @font-face{
            font-family: Candy;
            src: url('fonts/Candy.ttf') format('truetype');
          }
          @font-face{
            font-family: Snow;
            src: url('fonts/Snow.ttf') format('truetype');
          }
          .Navidad{
            font-family: Candy;
            font-size: 70px;
            color: #C81717;
          }
        </style>
    </head>  
    <body style="background-color: #73A6B9">
        <nav class="navbar navbar-inverse">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="#">Intercambio de Regalos</a>
            </div>
            <ul class="nav navbar-nav">
              <li><a href="micuenta.htm">MiCuenta</a></li>
              <li class="active"><a href="crearintercambios.htm">Crear Intercambio</a></li>
              <li><a href="misintercambios.htm">Mis Intercambios</a></li>
              <li><a href="invitaciones.htm">Invitaciones (<c:out value="${notificacion}"></c:out>)</a></li>
              <li><a href="buscar.htm">Buscar Intercambio</a></li>
            </ul>
          </div>
        </nav>
        <div class="container" align="center">
          <h1 class="Navidad">CREAR INTERCAMBIO</h1>
          <div id="alerta" class="alert alert-success" style="width: 50%;display: none">
            <strong id="alerta-title">TITLE</strong> <span id="alerta-mensaje">DESC</span>
          </div>
        </div>

        <form id="FormCreaIntercambio" class="form-horizontal" action="crearIntercambio" method="POST">
            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2">Nombre del intercambio:</label>
              <div class="col-sm-6">
                <input type="text" class="form-control" id="name" name="name" >
              </div>
            </div>

            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2" for="email">Tipo de Regalo:</label>
              <div class="col-sm-6">
                <select multiple size="7" class="form-control" id="tipo">
                  <option>Libros</option>
                  <option>Tazas</option>
                  <option>Ropa</option>
                  <option>Peliculas</option>
                  <option>Adornos</option>
                  <option>Dispositivos</option>
                  <option>Fotos</option>
                </select>
              </div>
            </div>
            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2" for="email">Costo minimo:</label>
              <div class="col-sm-6">
                <input type="number" id="costo" name="costo" min="500" max="5000" value="500">
              </div>
            </div>

            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2">Fecha Aceptacion:</label>
              <div class="col-sm-6">
                  <input type="date" name="fecha_a" id="fecha_a">
              </div>
            </div>
            \n" +                        
"            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2">Fecha de intercambio:</label>
              <div class="col-sm-6">
                  <input type="date" name="fecha" id="fecha">
              </div>
            </div>

            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2">Comentarios del Intercambio:</label>
              <div class="col-sm-6">
                  <textarea class="form-control" rows="5" id="comentarios"></textarea>
              </div>
            </div>

            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2">ID del intercambio:</label>
              <div class="col-sm-6">
                  <input type="text" class="form-control" id="id"> <br>
                  <input type="button" class="btn btn-info btn-lg" onclick="CreaIDRandom()" value="CreaID">
              </div>
            </div>
            <div class="form-group" style="padding-left: 200px;"> 
              <div class="col-sm-offset-2 col-sm-6">
                  <input type="button" class="btn btn-success btn-lg" onclick="Crear()" value="Crear">
              </div>
            </div>
          </form>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/node-uuid/1.4.7/uuid.min.js"></script>
        <script type="text/javascript">
            $( document ).ready(function() {
              var dt = new Date();
              var month = dt.getMonth()+1;
              var day = dt.getDate();
              var year = dt.getFullYear();
              if ((month-10)<0) {
                if ((day-10)<0) {
                  var fecha = year + '-0' + month + '-0' + day;
                }else{
                  var fecha = year + '-0' + month + '-' + day;
                }
              }else{
                var fecha = year + '-' + month + '-' + day;
              }

              document.getElementById("fecha").value = fecha;
              document.getElementById("fecha_a").value = fecha;
            });
            function CreaIDRandom(){
              document.getElementById("id").value = uuid.v4();
            }
            function Crear(){
                var name = $("#name").val();
                var tipos = $("#tipo").val();
                var costo = $("#costo").val();
                var date = $("#fecha").val();
                var date_a = $("#fecha_a").val();
                var comentarios = $("#comentarios").val();
                var id = $("#id").val();
                var tipo = "";
                tipos.forEach(function(element) {
                  tipo=tipo+element+", ";
                });
                if (name!="" && id!="") {

                  var parametros = {
                          "id_admin" : 0,
                          "name"     : name,
                          "tipo"     : tipo,
                          "costo"    : costo,
                          "date"      : date,
                          "date_a"    : date_a,        
                          "comentarios"    : comentarios,
                          "id" : id
                          };
                  $.ajax({
                          data:  parametros,
                          url:   'crearIntercambio',
                          dataType: 'json',
                          type:  'POST',
                          success:  function (response) {
                            switch(response.registro){
                              case "ok":
                                  $("#alerta").attr('class', 'alert alert-success');
                                  $("#alerta").css("display", "");
                                  $("#alerta").css("display", "");
                                  $("#alerta-title").html("Correcto!");
                                  $("#alerta-mensaje").html("Intercambio creado con Exito");
                                  setTimeout("redireccionarPagina()",1000);
                                break;
                              case "fail":
                                  $("#alerta").attr('class', 'alert alert-danger');
                                  $("#alerta").css("display", "");
                                  $("#alerta").css("display", "");
                                  $("#alerta-title").html("Error!");
                                  $("#alerta-mensaje").html("Ocurrio un fallo al crear el intercambio!");
                                break;
                            }
                          }
                  });
                }else{
                  $("#alerta").attr('class', 'alert alert-danger');
                  $("#alerta").css("display", "");
                  $("#alerta").css("display", "");
                  $("#alerta-title").html("Error!");
                  $("#alerta-mensaje").html("Datos incompletos");
                }
            }
            function redireccionarPagina() {
              window.location = "micuenta.htm";
            }
        </script>
    </body>
    </html>