<%-- 
    Document   : login
    Created on : 25/10/2018, 07:46:05 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola nuevo usuario</h1>
        <form name="login" action="login.do">
            <label>Nombre: </label> <input type="text" name="username">
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
