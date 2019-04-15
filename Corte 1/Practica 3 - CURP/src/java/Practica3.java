/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sun.xml.internal.ws.util.StringUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static jdk.nashorn.internal.objects.NativeString.toUpperCase;

/**
 *
 * @author Alumno
 */
@WebServlet(urlPatterns = {"/Practica3"})
public class Practica3 extends HttpServlet {
     private static char[] VOCALS = {'A', 'E', 'I', 'O', 'U'};

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String name = toUpperCase(request.getParameter("name"));   
            String a_p = toUpperCase(request.getParameter("a_p"));
            String a_m = toUpperCase(request.getParameter("a_m"));
            String fecha = request.getParameter("fecha");
            String genero = toUpperCase(request.getParameter("genero"));
            if("M".equals(genero)){
                genero = "MUJER";
            }  
            if("H".equals(genero)){
                genero = "HOMBRE";
            }  
            String sexo = toUpperCase(request.getParameter("genero"));
            String lugar = toUpperCase(request.getParameter("lugar"));
            
            String tiempos = toUpperCase(request.getParameter("tiempos"));
            tiempos="";
            String[] Tiempos = request.getParameterValues("tiempos");
            for(int t=0;t<2;t++){
                tiempos = tiempos + toUpperCase(Tiempos[t]) + " ";
            }
            
            String semestre = toUpperCase(request.getParameter("semestre"));

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
            
            curp = curp.replace("BACA","BXCA");
            curp = curp.replace("BAKA","BXKA");
            curp = curp.replace("BUEI","BXEI");
            curp = curp.replace("PENE","PXNE");
            curp = curp.replace("PITO","PXTO");
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Datos</title>");        
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Informacion del Usuario</h1><br><br>" +
            "<table>"+
                "<tr>"+
                    "<td>Nombre: "+
                    "</td>"+
                    "<td>"+name+" "+a_p+" "+a_m+
                    "</td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Fecha: "+
                    "</td>"+
                    "<td>"+fecha+
                    "</td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Sexo: "+
                    "</td>"+
                    "<td>"+genero+
                    "</td>"+
                "</tr>"+ 
                "<tr>"+
                    "<td>Lugar de Nacimiento: "+
                    "</td>"+
                    "<td>"+lugar+
                    "</td>"+
                "</tr>"+            
                "<tr>"+
                    "<td>Pasatiempos: "+
                    "</td>"+
                    "<td>"+tiempos+
                    "</td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Edad: "+
                    "</td>"+
                    "<td>"+periodo.getYears()+" años, "+periodo.getMonths()+" meses, "+periodo.getDays()+" dias"+
                    "</td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Semestre: "+
                    "</td>"+
                    "<td>"+semestre+
                    "</td>"+
                "</tr>"+  
                "<tr>"+
                    "<td>CRUP: "+
                    "</td>"+
                    "<td>"+curp+
                    "</td>"+
                "</tr>"+            
            "</table>"
            );
            out.println("</body>");
            out.println("</html>");
        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
