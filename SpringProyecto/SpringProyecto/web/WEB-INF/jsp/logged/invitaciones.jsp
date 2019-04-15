<%-- 
    Document   : invitaciones
    Created on : 12-nov-2018, 13:35:36
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
              <li><a href="crearintercambios.htm">Crear Intercambio</a></li>
              <li><a href="misintercambios.htm">Mis Intercambios</a></li>
              <li class="active"><a href="invitaciones.htm">Invitaciones (<c:out value="${notificacion}"></c:out>)</a></li>
              <li ><a href="buscar.htm">Buscar Intercambio</a></li>
            </ul>
          </div>
        </nav>

        <div class="container" align="center">
          <h1 class="Navidad">INVITACIONES</h1>

          <div id="alerta" class="alert alert-success" style="width: 50%;display: none">
            <strong id="alerta-title">TITLE</strong> <span id="alerta-mensaje">DESC</span>
          </div>

          <form id="FormRegistro" class="form-horizontal">

            <div class="form-group" style="padding-left: 200px;"> 
              <div class="col-sm-offset-2 col-sm-6">
                  <label class="control-label col-sm-2">Crear Invitacion</label>
                  <input type="button" class="btn btn-warning btn-lg" onclick="window.location.href='sendInvitacion.htm'" value="Nuevo">
              </div>
            </div>
              
            <div class="form-group" style="padding-left: 200px;"> 
              <div class="col-sm-offset-2 col-sm-6">
                    <label class="control-label col-sm-2">Ver Invitaciones</label>
                   <input type="button" class="btn btn-warning btn-lg" onclick="window.location.href='verInvitaciones.htm'" value="Ver (<c:out value="${notificacion}"></c:out>)">
              </div>
            </div>


          </form>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script type="text/javascript">




        </script>
    </body>
</html>