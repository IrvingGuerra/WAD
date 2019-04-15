package lib;

import static java.lang.System.out;
import java.sql.*;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Sir-M
 */
public class Conexion {
    
    private Connection con = null;
    private Statement st; //Sentencia
    private ResultSet rs; //Resultado

    public void conectar() {
        //Se entabla Conexion SQL
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/curp", "root","");
                    System.out.println("Conexion Exitosa");
                } catch (SQLException e) {
                    out.println("Conexion Fallida. Error: " + e.getMessage());
                }
            } catch (ClassNotFoundException ex) {
                out.println("Conexion Fallida. Error: " + ex.getMessage());
            }
    }
    
    public int registrarUsuario(String name_full, String fecha, String genero, String lugar, String tiempos, String edad_full, String semestre, String curp) {
        String sentenciaSQL = "INSERT INTO usuarios(`name`,`date`,`gender`,`place`,`times`,`age`,`semestre`,`curp`) VALUES ('"+name_full+"','"+fecha+"','"+genero+"','"+lugar+"','"+tiempos+"','"+edad_full+"','"+semestre+"','"+curp+"')";
        try {
            st = con.createStatement();
            st.executeUpdate(sentenciaSQL); 
            return 1;
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
        return 0;
    }
    
    public int getCantUsers(){
        String sentenciaCont = "SELECT COUNT(id) FROM usuarios";
        try {
            st = con.createStatement();
            rs = st.executeQuery(sentenciaCont);
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
        return 0;
    }
    
    public String getUsuariosIds(int cantidad){
        
        if(cantidad>0){
            String sentencia = "SELECT id FROM usuarios";
            String ids = "";
            int [] participantes = new int[cantidad];
            int cont = 0;
            try {
                st = con.createStatement();
                rs = st.executeQuery(sentencia);
                while(rs.next()){
                    participantes[cont] = rs.getInt(1);
                    cont++;
                }
            } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
            //Lo pasamos a un array
            for(int i=0;i<cantidad;i++){
                ids+=participantes[i]+",";
            }


            ids = ids.substring(0, ids.length() - 1);

            return ids;
        }
        return null;
    }
    
    public String getDatos(int id,String dato) {
        
        conectar();

        String sentencia = "SELECT "+dato+" FROM usuarios WHERE id='"+id+"'";

        try {
            st = con.createStatement();
            rs = st.executeQuery(sentencia);
            if(rs.next()){
                System.out.print(rs.getString(1));
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }

        return sentencia;
    }
 
    public void cerrar() {
        try {
            con.close();
        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }

    public int registrarBean(usuario user) {
        String sentenciaSQL = "INSERT INTO usuarios(`name`,`date`,`gender`,`place`,`times`,`age`,`semestre`,`curp`) VALUES ('"+user.getName()+"','"+user.getDate()+"','"+user.getGender()+"','"+user.getPlace()+"','"+user.getTimes()+"','"+user.getAge()+"','"+user.getSemestre()+"','"+user.getCurp()+"')";
        try {
            st = con.createStatement();
            st.executeUpdate(sentenciaSQL); 
            return 1;
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
        return 0;
    }

    


}
