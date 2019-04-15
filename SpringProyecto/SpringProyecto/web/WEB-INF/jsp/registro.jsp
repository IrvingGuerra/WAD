<%-- 
    Document   : register
    Created on : 11-nov-2018, 19:52:12
    Author     : Sir-M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
              <li><a href="index.htm">Inicio</a></li>
              <li class="active"><a href="registro.htm">Registrate</a></li>
              <li><a href="login.htm">Iniciar Sesion</a></li>
            </ul>
          </div>
        </nav>

        <div class="container" align="center">
          <h1 class="Navidad">REGISTRO</h1>

          <div id="alerta" class="alert alert-success" style="width: 50%;display: none">
            <strong id="alerta-title">TITLE</strong> <span id="alerta-mensaje">DESC</span>
          </div>

          <form:form id="FormRegistro" class="form-horizontal" action="registrarUsuario" method="POST">
            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2" for="email">Nombres:</label>
              <div class="col-sm-6">
                <input type="text" class="form-control" id="name" name="name" placeholder="Ingrese su nombre(s)">
              </div>
            </div>
            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2" for="email">Apellidos:</label>
              <div class="col-sm-6">
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Ingrese sus apellidos">
              </div>
            </div>
            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2" for="email">Nombre de Usuario: </label>
              <div class="col-sm-6">
                <input type="text" class="form-control" id="username" name="username" placeholder="Ingrese su username">
              </div>
            </div>
            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2" for="email">Correo:</label>
              <div class="col-sm-6">
                <input type="email" class="form-control" id="email" name="email" placeholder="Ingrese su correo electronico">
              </div>
            </div>

            <div class="form-group" style="padding-left: 200px;">
              <label class="control-label col-sm-2" for="pwd">Contraeña:</label>
              <div class="col-sm-6"> 
                <input type="password" class="form-control" id="password" name="password" placeholder="Ingrese su contraseña">
              </div>
            </div>

            <div class="form-group" style="padding-left: 200px;"> 
              <div class="col-sm-offset-2 col-sm-6">
                  <input type="button" class="btn btn-success btn-lg" onclick="Registro()" value="Registrarse">
              </div>
            </div>

          </form:form>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script type="text/javascript">
          /*
          $(document).ready (function(){
            $("#alerta").fadeOut(3000);        
          });
          */
          function Registro(){
            var name = $("#name").val();
            var lastname = $("#lastname").val();
            var username = $("#username").val();
            var email = $("#email").val();
            var password = $("#password").val();
            
            var nameReg = /^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$/;
            var lastReg = /^\s*([\pL\w\s]+)\s*,\s*([\pL\w\s-]+)\s*$/;
            var usernameReg = /^[A-Z][a-z]{4,10}/;
            var emailReg = /[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+.+.[A-Za-z]{2,4}/;
            var passReg = /^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$/;
            
            var auxName = 0;
            var auxLastname = 0;
            var auxUserame = 0;
            var auxEmail = 0;
            var auxPass = 0;
            var Mensaje = "Usted tiene los siguiente errores: ";
            
            if (usernameReg.test(name)) {
              auxName = 1;
            }else{
              auxName = 0;
              Mensaje+="<br> ? Escriba correctamente su nombre";
            } 
            
            if (usernameReg.test(lastname)) {
              auxLastname = 1;
            }else{
              auxLastname = 0;
              Mensaje+="<br> ? Escriba correctamente sus apellidos";
            } 
            
            if (usernameReg.test(username)) {
              auxUserame = 1;
            }else{
              auxUserame = 0;
              Mensaje+="<br> ? Username (debe de ser de 4 a 10 caracteres)";
            }
            if (emailReg.test(email)) {
              auxEmail = 1;
            }else{
              auxEmail = 0;
              Mensaje+="<br> ? Correo (Ingrese un correo valido)";
            }
            if (passReg.test(password)) {
              auxPass = 1;
            }else{
              auxPass = 0;
              Mensaje+="<br> ? Contraseña (debe contener Mayuscula, Minuscula y al menos 1 digito... de 8 a 16 caracteres)";
            }
            if (auxName == 0 || auxLastname == 0 || auxUserame == 0 || auxEmail == 0 || auxPass == 0) {
              $("#alerta").attr('class', 'alert alert-danger');
              $("#alerta").css("display", "");
              $("#alerta").css("display", "");
              $("#alerta-title").html("Error!");
              $("#alerta-mensaje").html(Mensaje);
            }else{
                var parametros = {
                        "name"     : name,
                        "lastname" : lastname,
                        "username" : username,
                        "email"    : email,
                        "password" : password
                        };
                $.ajax({
                        data:  parametros,
                        url:   'registrarUsuario',
                        dataType: 'json',
                        type:  'POST',
                        success:  function (response) {
                          switch(response.registro){
                            case "ok":
                                $("#alerta").attr('class', 'alert alert-success');
                                $("#alerta").css("display", "");
                                $("#alerta").css("display", "");
                                $("#alerta-title").html("Correcto!");
                                $("#alerta-mensaje").html("Usuario Registrado con Exito");
                                document.getElementById("FormRegistro").reset();
                              break;
                            case "already":
                                $("#alerta").attr('class', 'alert alert-danger');
                                $("#alerta").css("display", "");
                                $("#alerta").css("display", "");
                                $("#alerta-title").html("Error!");
                                $("#alerta-mensaje").html("Correo ya Registrado");
                              break;
                          }
                        }
                });
            }
          }
        </script>
    </body>
</html>

