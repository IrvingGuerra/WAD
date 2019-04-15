package lib;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/Save"})
public class Save extends HttpServlet {
    
    Conexion conexion = new Conexion();
    
    usuario user = new usuario();
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
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
     
            String name_full = name+" "+a_p+" "+a_m;
            String edad_full = periodo.getYears()+" años, "+periodo.getMonths()+" meses, "+periodo.getDays()+" dias";
            
            System.out.println(name_full);
            System.out.println(fecha);
            System.out.println(genero);
            System.out.println(lugar);
            System.out.println(tiempos);
            System.out.println(edad_full);
            System.out.println(semestre);
            System.out.println(curp);
            
            //Definimos las cookies
            response.addCookie(new Cookie("name",name));
            response.addCookie(new Cookie("a_p",a_p));
            response.addCookie(new Cookie("a_m",a_m));
            response.addCookie(new Cookie("date",fecha));
            response.addCookie(new Cookie("gender",genero));
            response.addCookie(new Cookie("place", lugar));
            response.addCookie(new Cookie("semestre",semestre));
      
            
            conexion.conectar();
            
            user.setName(name_full);
            user.setDate(fecha);
            user.setGender(genero);
            user.setPlace(lugar);
            user.setTimes(tiempos);
            user.setAge(edad_full);
            user.setSemestre(semestre);
            user.setCurp(curp);
            /*
            int registrado = conexion.registrarUsuario(name_full,fecha,genero,lugar,tiempos,edad_full,semestre,curp);
                if(registrado == 1){
                    response.sendRedirect("index.html");
                }else{
                    out.println("{\"registro\":\"fail\"}");
                }
            */
            int registrado = conexion.registrarBean(user);
                if(registrado == 1){
                    response.sendRedirect("index.jsp");
                }else{
                    out.println("{\"registro\":\"fail\"}");
                }
            
            conexion.cerrar();
            
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

    private Conexion getConexion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
