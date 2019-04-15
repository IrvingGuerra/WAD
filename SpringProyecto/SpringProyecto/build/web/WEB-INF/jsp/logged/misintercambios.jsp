<%-- 
    Document   : misintercambios
    Created on : 12-nov-2018, 13:35:23
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
              <li class="active"><a href="misintercambios.htm">Mis Intercambios</a></li>
              <li><a href="invitaciones.htm">Invitaciones (<c:out value="${notificacion}"></c:out>)</a></li>
              <li><a href="buscar.htm">Buscar Intercambio</a></li>
            </ul>
          </div>
        </nav>

        <div class="container" align="center">
          <h1 class="Navidad">MIS INTERCAMBIOS</h1>

          <div id="alerta" class="alert alert-success" style="width: 50%;display: none">
            <strong id="alerta-title">TITLE</strong> <span id="alerta-mensaje">DESC</span>
          </div>

          <table class="table">
            <thead>
              <tr>
                <th>Mis Intercambios: </th>
              </tr>
            </thead>
            <tbody>
              <tr class="info"> <!--info, danger, success, warning, active-->
                <td width="20%">Nombre</td>
                <td width="30%">ID</td>
                <td width="20%">Fecha</td>
                <td width="30%">Invita</td>
              </tr>
            <c:forEach var="intercambio" items="${intercambios}">
                <tr class="active">
                    <td><c:out value="${intercambio.getName()}"></c:out></td>
                    <td><a href="statusIntercambio.htm?id=${intercambio.getClave()}"><c:out value="${intercambio.getClave()}"></c:out></a></td>
                    <td><c:out value="${intercambio.getDate()}"></c:out></td>
                    <td><a href="sendInvitacion.htm?clave=${intercambio.getClave()}"><button>Invitar</button></a></td>
                </tr>
            </c:forEach>
            </tbody>
            <thead>
              <tr>
                <th>Intercambios a los que pertenezco: </th>
              </tr>
            </thead>
            <tbody>
              <tr class="info"> <!--info, danger, success, warning, active-->
                <td width="30%">Nombre</td>
                <td width="30%" colspan="2">ID</td>
                <td width="30%">Fecha</td>
              </tr>
             <c:forEach var="intercambioPer" items="${intercambiosPer}">
                <tr class="active">
                    <td><c:out value="${intercambioPer.getName()}"></c:out></td>
                    <td colspan="2"><a href="statusIntercambio.htm?id=${intercambioPer.getClave()}"><c:out value="${intercambioPer.getClave()}"></c:out></a></td>
                    <td><c:out value="${intercambioPer.getDate()}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
          </table>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </body>
</html>