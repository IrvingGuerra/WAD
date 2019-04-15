<%-- 
    Document   : INDEX
    Created on : 12-oct-2018, 8:48:48
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
//Preguntamos si la cookie esta definida

    String name = "";
    String ap = "";
    String am = "";
    String date = "";
    String gender = "";
    String place = "";
    String semestre = "";
   
    Cookie cookies[] = request.getCookies();

    for(Cookie c : cookies){
        if(c.getName().equals("name")){
            name = c.getValue();
        }else if(c.getName().equals("a_p")){
            ap = c.getValue();
        }else if(c.getName().equals("a_m")){
            am = c.getValue();
        }else if(c.getName().equals("date")){
            date = c.getValue();
        }else if(c.getName().equals("gender")){
            gender = c.getValue();
        }else if(c.getName().equals("place")){
            place = c.getValue();
        }else if(c.getName().equals("semestre")){
            semestre = c.getValue();
        }
    }

%>


<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>
            <table>
                <form id="dataForm" action="Save" method="post">
                    <tr>
                        <td>Nombre(s): </td>
                        <td><input type="text" name="name" value="<%=name%>"></td>
                    </tr>
                    <tr>
                        <td>Apellido Paterno: </td>
                        <td><input type="text" name="a_p" value="<%=ap%>"></td>
                    </tr>
                    <tr>
                        <td>Apellido Materno: </td>
                        <td><input type="text" name="a_m" value="<%=am%>"></td>
                    </tr>
                    <tr>
                        <%
                            if(date!=""){
                                date.replace("-", "/");
                                %>
                                    <td>Fecha de nacimiento: </td>
                                    <td><input type="date" name="fecha" value="<%=date%>"></td>
                                <%
                            }else{
                                %>
                                    <td>Fecha de nacimiento: </td>
                                    <td><input type="date" name="fecha"></td>
                                <%
                             }   
                        %> 
                    </tr>          
                    <tr>
                        <td>Sexo: </td>
                        <td>
                            <%
                                if(gender=="MUJER"){
                                    %>
                                        <input type="radio" name="genero" value="H"> Hombre<br>
                                        <input type="radio" name="genero" value="M" checked=> Mujer<br>
                                    <%
                                }else{
                                    %>
                                        <input type="radio" name="genero" value="H" checked> Hombre<br>
                                        <input type="radio" name="genero" value="M"> Mujer<br>
                                    <%
                                } 
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td>Lugar de nacimiento: </td>
                        <td>
                            <select name="lugar" value="0">
                                    <%
                                        if(place!=""){
                                            %>
                                             <option value="<%=place%>"><%=place%></option>
                                            <%
                                        }else{
                                            %>
                                             <option value="NULL">Seleccione un estado</option>
                                            <%
                                        }
                                    %>
                                    <option value="AS">Aguascalientes</option>
                                    <option value="BC">Baja California</option>
                                    <option value="BS">Baja California Sur</option>
                                    <option value="CC">Campeche</option>
                                    <option value="CS">Chiapas</option>
                                    <option value="CH">Chihuahua</option>
                                    <option value="CL">Coahuila</option>
                                    <option value="CM">Colima</option>
                                    <option value="DF">Cuidad de M&eacute;xico</option>
                                    <option value="DG">Durango</option>
                                    <option value="GT">Guanajuato</option>
                                    <option value="GR">Guerrero</option>
                                    <option value="HG">Hidalgo</option>
                                    <option value="JC">Jalisco</option>
                                    <option value="MC">Estado de M&eacute;xico</option>
                                    <option value="MN">Michoac&aacute;n</option>
                                    <option value="MS">Morelos</option>
                                    <option value="NT">Nayarit</option>
                                    <option value="NL">Nuevo Le&oacute;n</option>
                                    <option value="OC">Oaxaca</option>
                                    <option value="PL">Puebla</option>
                                    <option value="QO">Quer&eacute;taro</option>
                                    <option value="RR">Quintana Roo</option>
                                    <option value="SP">San Luis Potos&iacute;</option>
                                    <option value="SL">Sinaloa</option>
                                    <option value="SR">Sonora</option>
                                    <option value="TC">Tabasco</option>
                                    <option value="TS">Tamaulipas</option>
                                    <option value="TL">Tlaxcala</option>
                                    <option value="Z">Veracruz</option>
                                    <option value="YN">Yucat&aacute;n</option>
                                    <option value="ZS">Zacatecas</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Pasatiempos: </td>
                        <td>
                            <select name="tiempos" multiple size="2">
                                    <option value="jugar">Jugar</option>
                                    <option value="estudiar">Estudiar</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Semestre: </td>
                        <td>
                            <select name="semestre">
                                    <%
                                        if(semestre!=""){
                                            %>
                                             <option value="<%=semestre%>"><%=semestre%></option>
                                            <%
                                        }else{
                                            %>
                                             <option value="NULL">Seleccione un semestre</option>
                                            <%
                                        }
                                    %>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input onclick="document.getElementById('dataForm').submit();" id="enviar" type="button" value="Guardar"></td>
                        <td><input onclick="document.getElementById('dataForm').reset();" id="borrar" type="button" value="Borrar"></td>
                    </tr>
                    <tr>
                        <td><br>
                            <input onclick="window.location='showAllUsers.jsp'" type="button" value="Ver TODOS"></td>
                        </td>
                    </tr>
            </table>
        </div>

    </body>
</html>