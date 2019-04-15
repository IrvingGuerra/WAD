/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import javax.servlet.http.HttpSession;
import model.pojo.Usuario;
import model.util.HibernateUtil;
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
            String hql = "from Usuario";
            Query query = sesion.createQuery(hql);
            usuarios = query.list();
          
            sesion.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return usuarios;
    }
    
    public static int registerUser(Usuario user){
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
            return 1;
        }catch(Exception ex){
            tx.rollback();
            throw new RuntimeException("No se pudo guardar el usuario");
        }
    }
    
    public static String obtenerCorreo(int id){
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        Usuario user = (Usuario)sesion.get(Usuario.class, id);
        sesion.close();
        if(user != null){
            return "Correo es: "+user.getEmail();
        }else{
            return "El usuario no existe";
        }
    }
    
    public static int verificarCuenta(String email, String password){
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        Usuario user = (Usuario)sesion.createQuery("SELECT u FROM Usuario u WHERE u.email='"+email+"' AND u.password='"+password+"'").uniqueResult();
        sesion.close();
        if(user != null){
            System.out.print("user: "+user.getPassword());
            String pass = user.getPassword();
            if(pass.equals(user.getPassword())){
                return 1;
            }else{
                return 0;
            }
        }else{
            return 0;
        }
    }
    
    public static int verificarEmail(String email){
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        Usuario user = (Usuario)sesion.createQuery("SELECT u FROM Usuario u WHERE u.email='"+email+"'").uniqueResult();
        sesion.close();
        if(user != null){
            return 1;
        }else{
            return 0;
        }
    }

    public static Usuario getDataUser(String email) {
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        Usuario user = (Usuario)sesion.createQuery("SELECT u FROM Usuario u WHERE u.email='"+email+"'").uniqueResult();
        sesion.close();
        if(user != null){
            return user;
        }else{
            return null;
        }
    }
    
    public static Usuario getDataUser(int id) {
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        Usuario user = (Usuario)sesion.createQuery("SELECT u FROM Usuario u WHERE u.id='"+id+"'").uniqueResult();
        sesion.close();
        if(user != null){
            return user;
        }else{
            return null;
        }
    }
    
}
