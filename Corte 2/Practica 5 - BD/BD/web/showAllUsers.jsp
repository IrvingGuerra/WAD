<%-- 
    Document   : showAllUsers
    Created on : 06-oct-2018, 23:40:42
    Author     : Sir-M
--%>

<%@page import="lib.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShowAllUsers</title>
    </head>
    <body>
    <%
        Conexion conexion = new Conexion();
        conexion.conectar();
        int cant = conexion.getCantUsers(); //Obtenemos la cantidad de usuarios
        //Con esta cantidad podemos declarar todas las variables para llenarlas.
        
        String[] name = new String[cant];
        String[] date = new String[cant];
        String[] gender = new String[cant];
        String[] place = new String[cant];
        String[] times = new String[cant];
        String[] age = new String[cant];
        String[] semestre = new String[cant];
        String[] curp = new String[cant];
        //Ahora receptamos un string con los ids de los usuarios en un String asi; 1,2,3,4
        String ids = conexion.getUsuariosIds(cant);
        String[] ides = new String[cant];
        
        if(cant > 0){
            ides = ids.split(","); //Aqui ides, ya se habria llenado automaticamente las cant veces
            int first = Integer.parseInt(ides[0]);
            int last = Integer.parseInt(ides[cant-1]);
            
            for(int i=0;i<cant;i++){
                //Finalmente llenaremos los otros datos.
                name[i] = conexion.getDatos(Integer.parseInt(ides[i]),"name"); 
                date[i] = conexion.getDatos(Integer.parseInt(ides[i]),"date"); 
                gender[i] = conexion.getDatos(Integer.parseInt(ides[i]),"gender"); 
                place[i] = conexion.getDatos(Integer.parseInt(ides[i]),"place"); 
                times[i] = conexion.getDatos(Integer.parseInt(ides[i]),"times"); 
                age[i] = conexion.getDatos(Integer.parseInt(ides[i]),"age"); 
                semestre[i] = conexion.getDatos(Integer.parseInt(ides[i]),"semestre"); 
                curp[i] = conexion.getDatos(Integer.parseInt(ides[i]),"curp"); 
                
            }
            //Una vez llenos todos los datos de todos los usuarios, mostraremos por default el primero.
            %>
            <input type="hidden" id="first" value="<%= first%>">
            <input type="hidden" id="last" value="<%= last%>">
            <input type="hidden" id="idSelect" value="<%= ides[0]%>">
            <table>
                <tr>
                    <td>ID:</td><td id="id"><%= ides[0]%></td>
                </tr>
                <tr>
                    <td>Nombre:</td><td id="name"><%= name[0]%></td>
                </tr>
                <tr>
                    <td>Fecha de nacimiento:</td><td id="date"><%= date[0]%></td>
                </tr>
                <tr>
                    <td>Sexo:</td><td id="gender"><%= gender[0]%></td>
                </tr>
                <tr>
                    <td>Lugar de nacimiento:</td><td id="place"><%= place[0]%></td>
                </tr>
                <tr>
                    <td>Pasatiempos:</td><td id="times"><%= times[0]%></td>
                </tr>
                <tr>
                    <td>Edad:</td><td id="age"><%= age[0]%></td>
                </tr>
                <tr>
                    <td>Semestre:</td><td id="semestre"><%= semestre[0]%></td>
                </tr>
                <tr>
                    <td>Curp:</td><td id="curp"><%= curp[0]%></td>
                </tr>
            </table>    
            <%
        }else{
            %>
            <h1>No hay usuarios registrados</h1>
            <%
        }
        conexion.cerrar();
    %>
    <input type="button" onclick="btn('prev');" value="Anterior">
    <input type="button" onclick="btn('next');"value="Siguiente">
    <script>
        var valorArray = 0;
        function btn(action){
            var first = document.getElementById("first").value;
            var last = document.getElementById("last").value;
            
            //Pasamos las variables de JSP a JS
            var ides = new Array();<%for (int j=0; j < ides.length; j++) {%>
            ides[<%= j %>] = <%=ides[j] %>;<%}%>
            
            var name = new Array();<%for (int j=0; j < name.length; j++) {%>
            name[<%= j %>] = "<%=name[j] %>" ;<%}%>
            
            var date = new Array();<%for (int j=0; j < date.length; j++) {%>
            date[<%= j %>] = <%=date[j] %>;<%}%>
            
            var gender = new Array();<%for (int j=0; j < gender.length; j++) {%>
            gender[<%= j %>] = "<%=gender[j] %>";<%}%>
            
            var place = new Array();<%for (int j=0; j < place.length; j++) {%>
            place[<%= j %>] = "<%=place[j] %>";<%}%>
            
            var times = new Array();<%for (int j=0; j < times.length; j++) {%>
            times[<%= j %>] = "<%=times[j]%>";<%}%>
            
            var age = new Array();<%for (int j=0; j < age.length; j++) {%>
            age[<%= j %>] = "<%=age[j]%>";<%}%>
            
            var semestre = new Array();<%for (int j=0; j < semestre.length; j++) {%>
            semestre[<%= j %>] = <%=semestre[j] %>;<%}%>
            
            var curp = new Array();<%for (int j=0; j < curp.length; j++) {%>
            curp[<%= j %>] = "<%=curp[j] %>";<%}%>
            
     
            if(action==="prev"){
                //Prev
                if(document.getElementById("idSelect").value !== first){
                    //Significa que no es el primero
                    valorArray--;
                    document.getElementById("idSelect").value = ides[valorArray];
                    document.getElementById("id").innerHTML = ides[valorArray];
                    document.getElementById("name").innerHTML = name[valorArray];
                    document.getElementById("date").innerHTML = date[valorArray];
                    document.getElementById("gender").innerHTML = gender[valorArray];
                    document.getElementById("place").innerHTML = place[valorArray];
                    document.getElementById("times").innerHTML = times[valorArray];
                    document.getElementById("age").innerHTML = age[valorArray];
                    document.getElementById("semestre").innerHTML = semestre[valorArray];
                    document.getElementById("curp").innerHTML = curp[valorArray];
                }
            }else{
                if(document.getElementById("idSelect").value !== last){
                    //Significa que no es el utlimo
                    valorArray++;
                    document.getElementById("idSelect").value = ides[valorArray];
                    document.getElementById("id").innerHTML = ides[valorArray];
                    document.getElementById("name").innerHTML = name[valorArray];
                    document.getElementById("date").innerHTML = date[valorArray];
                    document.getElementById("gender").innerHTML = gender[valorArray];
                    document.getElementById("place").innerHTML = place[valorArray];
                    document.getElementById("times").innerHTML = times[valorArray];
                    document.getElementById("age").innerHTML = age[valorArray];
                    document.getElementById("semestre").innerHTML = semestre[valorArray];
                    document.getElementById("curp").innerHTML = curp[valorArray];
                }
            }
        }
    </script>
    </body>
</html>
