/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.IntercambioDAO;
import model.pojo.Intercambio;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import model.dao.InvitadosDAO;
import model.dao.UsuarioDAO;
import model.pojo.Usuario;

/**
 *
 * @author Z420
 */
@WebServlet(name = "Invitar", urlPatterns = {"/Invitar"})
public class Invitar extends HttpServlet {

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
            
            if(user != null){
                String email_to = request.getParameter("email");
                String id = request.getParameter("id_inter");
                int enviado = 0;
                Intercambio inter = IntercambioDAO.getIntercambioData(id);
                if(inter == null){
                    out.println("{\"invitacion\":\"noID\"}");       
                }else{
                    try {
                        String host = "idev4u.com";
                        String username = "intercambioweb@idev4u.com";
                        String password = "190997Tsukune";
                        Properties prop = System.getProperties();
                        prop.put("mail.smtp.ssl.trust", host);
                        prop.put("mail.smtp.starttls.enable","true");
                        prop.put("mail.smtp.host", host);
                        prop.put("mail.smtp.port", 587);
                        prop.put("mail.smtp.user", username);
                        prop.put("mail.smtp.password", password);
                        prop.put("mail.smtp.auth","true");
                        Session sesion = Session.getDefaultInstance(prop,null);
                        MimeMessage message = new MimeMessage(sesion);

                        message.setFrom(new InternetAddress(username));

                        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email_to));

                        message.setSubject("¡Usted tiene una invitacion!");
                        
                        int ultimaInvitacion = InvitadosDAO.getInvitacionesTotales();
                        ultimaInvitacion++;
                        
                        String Mensaje = "El usuario: "+user.getName()+" con el correo: "+user.getEmail()+"<br><br>"
                                + "Lo ha invitado a un Intercambio Navideño, con las siguientes caracteristicas.<br>"
                                + "<strong>Nombre: </strong>"+inter.getName()+"<br>"
                                + "<strong>Tipo: </strong>"+inter.getTipo()+"<br>"
                                + "<strong>Costo Minimo: </strong>"+inter.getCosto()+"<br>"
                                + "<strong>Fecha de Aceptacion: </strong>"+inter.getDateA()+"<br>"
                                + "<strong>Fecha de Intercambio: </strong>"+inter.getDate()+"<br>"    
                                + "<strong>Comentarios del Administrador: </strong>"+inter.getComentarios()+"<br><br>"
                                + "Indique si desea acepar el intercambio, indiquelo, si no. No haga caso a este correo<br><br>"
                                + "<a href='http://webapp.idev4u.com/changeStatus.php?id="+ultimaInvitacion+"'><button>Aceptar</button></a>";
                        
                        message.setContent(Mensaje, "text/html; charset=utf-8");

                        Transport transport = sesion.getTransport("smtp");

                        transport.connect(host,username,password);

                        transport.sendMessage(message, message.getAllRecipients());

                        transport.close();

                        enviado = 1;
                    }catch(Exception e){
                        e.printStackTrace();
                    }

                    if(enviado==1){
                        InvitadosDAO.invitar(email_to,inter.getIdIntercambio());
                        out.println("{\"invitacion\":\"ok\"}");
                    }else{
                        out.println("{\"invitacion\":\"fail\"}"); 
                    }
                }
            }else{
                out.println("{\"invitacion\":\"fail\"}"); 
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
