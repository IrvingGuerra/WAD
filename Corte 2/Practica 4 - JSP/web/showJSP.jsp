<%-- 
    Document   : showJSP
    Created on : 4/10/2018, 07:28:08 AM
    Author     : Alumno
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar Resultados</title>
    </head>
    <body>
        <%
            char[] VOCALS = {'A', 'E', 'I', 'O', 'U'};
            String name = request.getParameter("name").toUpperCase();   
            String a_p = request.getParameter("a_p").toUpperCase();
            String a_m = request.getParameter("a_m").toUpperCase();
            String fecha = request.getParameter("fecha").toUpperCase();
            String genero = request.getParameter("genero").toUpperCase();
            if("M".equals(genero)){
                genero = "MUJER";
            }  
            if("H".equals(genero)){
                genero = "HOMBRE";
            }  
            String sexo = request.getParameter("genero").toUpperCase();
            String lugar = request.getParameter("lugar").toUpperCase();

            String tiempos="";
            
            String[] Tiempos = request.getParameterValues("tiempos");
            for(int t=0;t<Tiempos.length;t++){
                tiempos = tiempos + Tiempos[t].toUpperCase() + " ";
            }
            
            String semestre = request.getParameter("semestre").toUpperCase();

            String[] parts = fecha.split("-");
            String ano = parts[0];
            String mes = parts[1];
            String dia = parts[2];
            int edad = 2018 - (Integer.parseInt(ano));
            
            // 01/01/2000
            DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate fechaNac = LocalDate.parse(fecha, fmt);
            LocalDate ahora = LocalDate.now();
            Period periodo = Period.between(fechaNac, ahora);

            char appi = a_p.charAt(0);
            
            int indicev=0,indicec=0,indicem=0,indicen=0,i=0; 
            double random1,random2;
            
            
            for (i=1;i<=a_p.length()-1;i++)
              {     
                char app1 = a_p.charAt(i);
                String app2 =  String.valueOf(app1);

                if (app2.equals("A")|app2.equals("E")|app2.equals("I")|app2.equals("O")|app2.equals("U"))
                   {
                     indicev = i;
                     break;
                   }
                 else
                   {
                     indicec = i;
                     break;
                   }
              }
             char apps = a_p.charAt(indicev);

             indicec = 0;
             for (i=2;i<=a_p.length()-2;i++)
              {     
                char app1 = a_p.charAt(i);
                String app2 =  String.valueOf(app1);

                if (app2.equals("A")|app2.equals("E")|app2.equals("I")|app2.equals("O")|app2.equals("U"))
                   {
                   }
                 else
                   {
                     indicec = i;
                     break;
                   }
              }
              char appc = a_p.charAt(indicec);
             // OBTIENE INICIAL Y PRIMERA CONSONANTE DEL SEGUNDO APELLIDO
             char apmi =a_m.charAt(0);
             for (i=1;i<=a_m.length()-1;i++)
               {     
                 char apm1 = a_m.charAt(i);
                 String apm2 =  String.valueOf(apm1);
                 if (apm2.equals("A")|apm2.equals("E")|apm2.equals("I")|apm2.equals("O")|apm2.equals("U"))
                   {
                   }
                 else
                   {
                     indicem = i;
                     break;
                   }

               }
              char apmc = a_m.charAt(indicem);         

             // OBTIENE INICIAL Y PRIMERA CONSONANTE DEL NOMBRE DE PILA
             char nomi = name.charAt(0);
             for (i=1;i<=name.length()-1;i++)
               {     
                 char nom1 = name.charAt(i);
                 String nom2 =  String.valueOf(nom1);
                 if (nom2.equals("A")|nom2.equals("E")|nom2.equals("I")|nom2.equals("O")|nom2.equals("U"))
                   {
                   }
                 else
                   {
                     indicen = i;
                     break;
                   }

               }
             char nomc = name.charAt(indicen);
             
            // OBTIENE FECHA DE NACIMIENTO
            String an1 = ano.substring(2,4);
            String m1 = mes;
            String d = dia;
            // OBTIENE ENTIDAD FED
            String f = lugar;

            // CALCULA HOMOCLAVE Y DIGITO VERIFICADOR        
            random1 = (Math.random()) * 10.00;
            String rd1 = String.valueOf(random1).substring(0,1);
            random2 = (Math.random()) * 8.00;
            String rd2 = String.valueOf(random2).substring(0,1);

            // CONSTRUYE E IMPRIME LA CURP      
            String curp = String.valueOf(appi)+ String.valueOf(apps)+ String.valueOf(apmi)+ String.valueOf(nomi)+ String.valueOf(an1)+ m1+ d+ sexo+String.valueOf(f)+String.valueOf(appc)+String.valueOf(apmc)+String.valueOf(nomc)+rd1+rd2;
            
  
        %>
             
        <h1>Practica 4 - JSP</h1>
            
        <table>
            <tr>
                <td>Nombre: </td>
                <td><%= name+" "+a_p+" "+a_m %></td>
            </tr>
            <tr>
                <td>Fecha: </td>
                <td><%= fecha %></td>
            </tr>
            <tr>
                <td>Sexo: </td>
                <td><%= genero %></td>
            </tr>
            <tr>
                <td>Lugar de Nacimiento: </td>
                <td><%= lugar %></td>
            </tr>
            <tr>
                <td>Pasatiempos: </td>
                <td><%= tiempos %></td>
            </tr>
            <tr>
                <td>Edad: </td>
                <td><%= periodo.getYears()+" años, "+periodo.getMonths()+" meses, "+periodo.getDays()+" dias" %></td>
            </tr>
            <tr>
                <td>Semestre: </td>
                <td><%= semestre %></td>
            </tr>
            <tr>
                <td>CURP: </td>
                <td><%= curp %></td>
            </tr>
        </table>

    </body>
</html>
