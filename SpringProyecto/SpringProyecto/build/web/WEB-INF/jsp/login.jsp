<%-- 
    Document   : login
    Created on : 11-nov-2018, 19:52:12
    Author     : Sir-M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
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
            src: url('web/WEB-INF/jsp/fonts/Candy.ttf') format('truetype');
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
              <li><a href="registro.htm">Registrate</a></li>
              <li class="active"><a href="login.htm">Iniciar Sesion</a></li>
            </ul>
          </div>
        </nav>

        <div class="container" align="center">
          <h1 class="Navidad">INICIAR SESION</h1>

          <div id="alerta" class="alert alert-success" style="width: 50%;display: none">
            <strong id="alerta-title">TITLE</strong> <span id="alerta-mensaje">DESC</span>
          </div>

          <form id="FormRegistro" class="form-horizontal">
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
                  <input type="button" class="btn btn-success btn-lg" onclick="Login()" value="Iniciar Sesion">
              </div>
            </div>

          </form>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script type="text/javascript">
          /*
          $(document).ready (function(){
            $("#alerta").fadeOut(3000);        
          });
          */
          function Login(){
            var email = $("#email").val();
            var password = $("#password").val();
            var parametros = {
                    "email"    : email,
                    "password" : password
                    };
            $.ajax({
                    data:  parametros,
                    url:   'loginUsuario',
                    dataType: 'json',
                    type:  'POST',
                    success:  function (response) {
                      switch(response.login){
                        case "ok":
                            $("#alerta").attr('class', 'alert alert-success');
                            $("#alerta").css("display", "");
                            $("#alerta").css("display", "");
                            $("#alerta-title").html("Correcto! ");
                            $("#alerta-mensaje").html("Inicio de Sesion exitoso... redirigiendo");
                            document.getElementById("FormRegistro").reset();
                            setTimeout("redireccionarPagina()", 3000);
                          break;
                        case "noEmail":
                            $("#alerta").attr('class', 'alert alert-danger');
                            $("#alerta").css("display", "");
                            $("#alerta").css("display", "");
                            $("#alerta-title").html("Error!");
                            $("#alerta-mensaje").html("Correo o contraseña invalida.");
                          break;
                      }
                    }
            });
          }

          function redireccionarPagina() {
            window.location = "micuenta.htm";
          }

        </script>
    </body>
</html>        
        