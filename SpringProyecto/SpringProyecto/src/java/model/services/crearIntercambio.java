/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.services;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static model.dao.IntercambioDAO.registerIntercambio;
import model.dao.UsuarioDAO;
import model.pojo.Intercambio;
import model.pojo.Usuario;

/**
 *
 * @author Sir-M
 */
@WebServlet(name = "crearIntercambio", urlPatterns = {"/crearIntercambio"})
public class crearIntercambio extends HttpServlet {

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

            HttpSession session = request.getSession(true);
            String email = (String) session.getAttribute("email");
            Cookie cookies[] = request.getCookies();
            for(Cookie c : cookies){
                if(c.getName().equals("email")){
                    email = c.getValue();
                }
            }
            Usuario user = UsuarioDAO.getDataUser(email);
            
            int id_admin = user.getId();
            
            String name = request.getParameter("name");
            
            String[] Tipo = request.getParameterValues("tipo");
            String tipo="";
            
            for(int t=0;t<Tipo.length;t++){
                tipo = tipo + Tipo[t] + ",";
            }
            String costo = request.getParameter("costo");
            String date_a = request.getParameter("date_a");
            //Incrementar +1 en dia de date_a
            String string = date_a;
            String[] parts = string.split("-");
            String anio = parts[0];
            String mes = parts[1];
            String dia = parts[2];
            int dia_i = Integer.parseInt(dia);
            dia_i++;
            String dianuevo = ""+dia_i;
            date_a = anio+"-"+mes+"-"+dianuevo;
            String date = request.getParameter("date");
            String comentarios = request.getParameter("comentarios");
            String id = request.getParameter("id");
            
            Intercambio inter = new Intercambio();
            
            inter.setIdAdmin(id_admin);
            inter.setName(name);
            inter.setTipo(tipo);
            inter.setCosto(costo);
            inter.setDateA(date_a);
            inter.setDate(date);
            inter.setComentarios(comentarios);
            inter.setClave(id);

            //Aqui se debe de crear el intercambio y guardarse
            
            if(registerIntercambio(inter) == 1){
                out.println("{\"registro\":\"ok\"}");
            }else{
                out.println("{\"registro\":\"fail\"}");
            }
            
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
