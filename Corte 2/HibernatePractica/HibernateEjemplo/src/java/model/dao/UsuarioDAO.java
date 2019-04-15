/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.pojos.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Sir-M
 */
public class UsuarioDAO {
    
    
    public static List<Usuario>getAllUsers(){
        List<Usuario> usuarios = null;
        
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            
            String hql = "from Usuario"; //hibernate query language
            Query query = sesion.createQuery(hql);
            usuarios = query.list();
          
            sesion.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return usuarios;
    }
    
    public static void registerUser(Usuario user){
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        try{
            sf = HibernateUtil.getSessionFactory();
            sesion = sf.openSession();
            tx = sesion.beginTransaction();
            sesion.save(user);
            tx.commit();
            sesion.close();
        }catch(Exception ex){
            tx.rollback();
            throw new RuntimeException("No se pudo guardar el usuario");
        }
        
    }
    
    public String obtenerCorreo(int id){
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;

        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        Usuario user = (Usuario)sesion.get(Usuario.class, id);
        sesion.close();
        if(user != null){
            return "Correo es: "+user.getCorreo();
        }else{
            return "El usuario no existe";
        }
        
    }
}
