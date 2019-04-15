SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS `hibernate`;
CREATE DATABASE hibernate;
USE hibernate;

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellido_p` varchar(25) NOT NULL,
  `apellido_m` varchar(25) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `usuario` (`id`, `nombre`, `apellido_p`, `apellido_m`, `correo`, `password`) VALUES
(1, 'Irving', 'Guerra', 'Vargas', 'guerravargasirving@gmail.com', 'Sir190997');
COMMIT;

No olvidar añadir Libreria MYSQL

hibernate.cfg.xml

Configuration Properties >> Add. Show_sql true
Miscellaneus Properties >> session > thread

Crear Ingenieria Inversa

Recordar que los Pojos deben de ir en un solo paquete para evitar desorden.

HibernateUtil puede ir separado o junto los archivos DAO. Recordar que existira un DAO por cada Pojo.

//////////////////UsuarioDAO.java

metodos:

 public static List<Usuario>getAllUsers(){
        List<Usuario> usuarios = null;
        
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            
            String hql = "from Usuario"; //hibernate query language
            Query query = sesion.createQuery(hql);
            usuarios = query.list();
          
            sesion.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return usuarios;
    }
    
    public static void registerUser(Usuario user){
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        try{
            sf = HibernateUtil.getSessionFactory();
            sesion = sf.openSession();
            tx = sesion.beginTransaction();
            sesion.save(user);
            tx.commit();
            sesion.close();
        }catch(Exception ex){
            tx.rollback();
            throw new RuntimeException("No se pudo guardar el usuario");
        }
        
    }
    
    


Registro.html

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Registro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>
            <h1>Registrar un nuevo usuario</h1>
            <form method="POST" action="registrar">
                <label>Nombre: </label><input type="text" name="nombre"><br>
                <label>Apellido Paterno: </label><input type="text" name="apellido_p"><br>
                <label>Apellido Materno; </label><input type="text" name="apellido_m"><br>
                <label>Correo electronico: </label><input type="text" name="correo"><br>
                <label>Contraseña: </label><input type="text" name="password"><br><br>
                <input type="submit" value="Registrar">
            </form>
        </div>
    </body>
</html>


///registrar.java


En try de response

	?????????


//Show all Users .jsp


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















