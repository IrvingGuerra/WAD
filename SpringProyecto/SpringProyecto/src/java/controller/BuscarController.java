/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.InvitadosDAO;
import model.dao.UsuarioDAO;
import model.pojo.Usuario;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Z420
 */
public class BuscarController implements Controller{

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView("logged/buscar"); 
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
                System.out.println("[ INFO ] BuscarController.java Cargado");
                int notificacion = InvitadosDAO.getMisInvitacionesNumero(email);
                mv.addObject("notificacion",notificacion);
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

