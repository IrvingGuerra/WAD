<%-- 
    Document   : intercambioStatus
    Created on : 21/11/2018, 01:55:36 PM
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
      <h1 class="Navidad"> <c:out value="${intercambio.getName()}"></c:out>  </h1>
      <div id="alerta" class="alert alert-success" style="width: 50%;display: none">
        <strong id="alerta-title">TITLE</strong> <span id="alerta-mensaje">DESC</span>
      </div>
      <table class="table">
        <thead>
          <tr>
            <th>Descripcion del intercambio: </th>
          </tr>
        </thead>
        <tbody>
          <tr class="info"> <!--info, danger, success, warning, active-->
            <td width="20%">Nombre</td>
            <td width="20%">Tipo</td>
            <td width="20%">Costo Minimo</td>
            <td width="20%">Fecha</td>
            <td width="20%">Comentarios</td>
            <td width="20%" style="visibility:<c:out value="${visibility}"></c:out>">MIX</td>
          </tr>
          <tr class="active">
            <td width="20%"><c:out value="${admin.getName()}"></c:out></td>
            <td width="20%"><c:out value="${intercambio.getTipo()}"></c:out></td>
            <td width="20%"><c:out value="${intercambio.getCosto()}"></c:out></td>
            <td width="20%"><c:out value="${intercambio.getDateA()}"></c:out></td>
            <td width="20%"><c:out value="${intercambio.getComentarios()}"></c:out></td>
            <td width="20%" style="visibility:<c:out value="${visibility}"></c:out>"><a href="makeMIX?clave=${intercambio.getClave()}"><button>Hacer Mix</button></a></td>
          </tr>
        </tbody>
      </table>
      <table class="table">
        <thead>
          <tr>
            <th>Participantes</th>
          </tr>
        </thead>
        <tbody>
          <tr class="info"> <!--info, danger, success, warning, active-->
            <td width="20%">ID</td>
            <td width="20%">Correo</td>
            <td width="20%">Nombre</td>
          </tr>
          <c:forEach var="participante" items="${participantes}">
            <tr class="active">
                <td><c:out value="${participante.getId()}"></c:out></td>
                <td><c:out value="${participante.getEmail()}"></c:out></td>
                <td><c:out value="${participante.getName()}"></c:out></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <table class="table">
        <thead>
          <tr>
            <th>Invitados</th>
          </tr>
        </thead>
        <tbody>
          <tr class="info"> <!--info, danger, success, warning, active-->
            <td width="20%">Correo</td>
          </tr>
          <c:forEach var="correo" items="${correosInvitados}">
            <tr class="active">
                <td><c:out value="${correo}"></c:out></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>  
          
     <table class="table">
        <thead>
          <tr>
            <th>MIX!!!</th>
          </tr>
        </thead>
        <tbody>
          <tr class="info"> <!--info, danger, success, warning, active-->
            <td width="20%">Participantes</td>
          </tr>
          <c:forEach var="mix" items="${mix}">
            <tr class="active">
                <td><c:out value="${mix}"></c:out></td>
            </tr>
          </c:forEach>
        </tbody>
      </table> 
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>