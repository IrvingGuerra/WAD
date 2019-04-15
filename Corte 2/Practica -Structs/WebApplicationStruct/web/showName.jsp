<%-- 
    Document   : showName
    Created on : 25/10/2018, 07:50:20 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="bean" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Datos</h1>
        Tu nombre es: 
        <bean:text name="LoginActionFormBean" property="username"/>
    </body>
</html>
