<%-- 
    Document   : showAllUsers
    Created on : 07-nov-2018, 14:55:38
    Author     : Sir-M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.UsuarioDAO"%>
<%@page import="model.pojos.Usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios Registrados</title>
    </head>
    <body>
        <h1>Estos son todos los usuarios registrados en la BD</h1><br><br>
        
        <table>
            <tr>
                <td>ID</td>
                <td>Nombre</td>
                <td>Apellido Paterno</td>
                <td>Apellido Materno</td>
                <td>Correo</td>
                <td>Constraseña</td>
            </tr>
            <%
                UsuarioDAO uDAO = new UsuarioDAO();
                List listUser = uDAO.getAllUsers();
                Iterator i = listUser.iterator();

                while(i.hasNext()){
                    Usuario usuario = (Usuario)i.next();
                    out.print("<tr>");
                    out.print("<td>" + usuario.getId() + "</td>");
                    out.print("<td>" + usuario.getNombre()+ "</td>");
                    out.print("<td>" + usuario.getApellidoP()+ "</td>");
                    out.print("<td>" + usuario.getApellidoM()+ "</td>");
                    out.print("<td>" + usuario.getCorreo()+ "</td>");
                    out.print("<td>" + usuario.getPassword()+ "</td>");
                    out.print("</tr>");
                    
                }

            %>
        </table>
        
    </body>
</html>
