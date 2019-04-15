<%-- 
    Document   : sendInvitacion
    Created on : 21/11/2018, 06:05:34 PM
    Author     : Z420
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
            src: url('../fonts/Navidad.ttf') format('truetype');
          }
          @font-face{
            font-family: ChristmasFlake;
            src: url('../fonts/ChristmasFlake.ttf') format('truetype');
          }
          @font-face{
            font-family: ChristmasStar;
            src: url('../fonts/ChristmasStar.ttf') format('truetype');
          }
          @font-face{
            font-family: Candy;
            src: url('../fonts/Candy.ttf') format('truetype');
          }
          @font-face{
            font-family: Snow;
            src: url('../fonts/Snow.ttf') format('truetype');
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
              <li><a href="crearintercambios.htm">Crear Intercambio</a></li>
              <li><a href="misintercambios.htm">Mis Intercambios</a></li>
              <li class="active"><a href="invitaciones.htm">Invitaciones</a></li>
              <li><a href="buscar.htm">Buscar Intercambio</a></li>
            </ul>
          </div>
        </nav>

        <div class="container" align="center">
          <h1 class="Navidad">NUEVO INVITADO</h1>

          <div id="alerta" class="alert alert-success" style="width: 50%;display: none">
            <strong id="alerta-title">TITLE</strong> <span id="alerta-mensaje">DESC</span>
          </div>
        </div>
        
        <form id="FormCreaIntercambio" class="form-horizontal">
            
            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2" for="email">Correo:</label>
              <div class="col-sm-6">
                <input type="email" class="form-control" id="email" name="email" placeholder="Ingrese el correo del invitado">
              </div>
            </div>

            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2" for="pwd">ID intercambio: </label>
              <div class="col-sm-6"> 
                  <input type="text" class="form-control" id="id_inter" name="id_inter" placeholder="Ingrese el ID del intercambio" value="<c:out value="${clave}"></c:out>">
              </div>
            </div>

            <div class="form-group" style="padding-left: 200px;"> 
              <div class="col-sm-offset-2 col-sm-6">
                  <input type="button" class="btn btn-success btn-lg" onclick="Invitar()" value="Invitar">
                  <!--Se requiere generar script para guardar los datos del Invitado -->
              </div>
            </div>
          </form>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <script type="text/javascript">
            function Invitar(){
                var email = $("#email").val();
                var id_inter = $("#id_inter").val();

                if (email!="" && id_inter!="") {
                  
                  var parametros = {
                          "email"     : email,
                          "id_inter"    : id_inter
                          };
                  $.ajax({
                          data:  parametros,
                          url:   'Invitar',
                          dataType: 'json',
                          type:  'POST',
                          success:  function (response) {
                            switch(response.invitacion){
                              case "ok":
                                  $("#alerta").attr('class', 'alert alert-success');
                                  $("#alerta").css("display", "");
                                  $("#alerta").css("display", "");
                                  $("#alerta-title").html("Correcto!");
                                  $("#alerta-mensaje").html("Se ha invitado a tu amigo!");
                                  document.getElementById("FormRegistro").reset();
                                  setTimeout("redireccionarPagina()",1000);
                                break;
                              case "noemail":
                                  $("#alerta").attr('class', 'alert alert-danger');
                                  $("#alerta").css("display", "");
                                  $("#alerta").css("display", "");
                                  $("#alerta-title").html("Error!");
                                  $("#alerta-mensaje").html("El correo no esta registrado en nuestro sistema");
                                break;
                              case "noID":
                                  $("#alerta").attr('class', 'alert alert-danger');
                                  $("#alerta").css("display", "");
                                  $("#alerta").css("display", "");
                                  $("#alerta-title").html("Error!");
                                  $("#alerta-mensaje").html("No existe el ID del intercambio");
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
              window.location = "micuenta";
            }
        </script>

    </body>
</html>