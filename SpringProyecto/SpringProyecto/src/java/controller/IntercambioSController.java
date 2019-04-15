/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.IntercambioDAO;
import model.dao.IntercambioMixDAO;
import model.dao.InvitadosDAO;
import model.dao.UsuarioDAO;
import model.pojo.Intercambio;
import model.pojo.Usuario;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Z420
 */
public class IntercambioSController implements Controller{

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView("logged/statusIntercambio"); 
        try{
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
                System.out.println("[ INFO ] IntercambioStatusController.java Cargado");
                System.out.println("[ INFO ] Recuperando Datos del Intercambio, CLAVE: "+request.getParameter("id"));
                Intercambio inter = IntercambioDAO.getIntercambioData(request.getParameter("id"));
                Usuario admin = UsuarioDAO.getDataUser(inter.getIdAdmin());
                List<Usuario> participantes = InvitadosDAO.getParticipantes(inter.getIdIntercambio());
                List<String> correosInvitados = InvitadosDAO.getInvitados(inter.getIdIntercambio());
                
                int ESADMIN = IntercambioDAO.isAdmin(user.getId(), inter.getIdIntercambio());
                
                List<String> mix = null;
                
                if(ESADMIN==1){
                    mix = IntercambioMixDAO.getMIX(inter.getIdIntercambio());
                }else{
                    mix = IntercambioMixDAO.getMyMIX(inter.getIdIntercambio(),email);
                }
                
                
                int notificacion = InvitadosDAO.getMisInvitacionesNumero(email);
                String visibility = "hidden";
                if(IntercambioDAO.isAdmin(user.getId(),inter.getIdIntercambio())==1){
                    visibility = "visible";
                }
                mv.addObject("mix",mix);
                mv.addObject("visibility",visibility);
                mv.addObject("notificacion",notificacion);
                mv.addObject("participantes",participantes);
                mv.addObject("correosInvitados",correosInvitados);
                mv.addObject("intercambio",inter);
                mv.addObject("admin",admin);
                return mv;
            }else{
                System.out.println("[ ERROR ] No hay sesión activa");
                mv = new ModelAndView("sorry"); 
                mv.addObject("mensaje","Lo siento, usted no tiene una sesion activa.");
                return mv;
            }
       
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
}
