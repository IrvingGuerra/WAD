<%-- 
    Document   : login.jsp
    Created on : 26-oct-2018, 8:52:58
    Author     : alumno
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
            <label>Contraseña: </label> <input type="password" name="password">
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
