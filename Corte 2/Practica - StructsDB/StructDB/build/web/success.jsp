<%-- 
    Document   : success
    Created on : 26-oct-2018, 8:55:08
    Author     : alumno
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
        Bienvenido!! 
        <bean:text name="LoginActionFormBean" property="name"/>
    </body>
</html>
