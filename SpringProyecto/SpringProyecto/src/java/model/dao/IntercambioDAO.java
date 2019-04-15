/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.mail.internet.MimeMessage;
import model.pojo.Intercambio;
import model.pojo.Invitados;
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
public class IntercambioDAO {
    
    public static int registerIntercambio(Intercambio intercambio){
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        try{
            sf = HibernateUtil.getSessionFactory();
            sesion = sf.openSession();
            tx = sesion.beginTransaction();
            sesion.save(intercambio);
            tx.commit();
            sesion.close();
            return 1;
        }catch(Exception ex){
            tx.rollback();
            throw new RuntimeException("No se pudo guardar el intercambio");
        }
    }
    
    public static List<Intercambio>getMisIntercambios(int id){
        List<Intercambio> inter = null;
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            String hql = "SELECT u FROM Intercambio u WHERE u.idAdmin='"+id+"'";
            Query query = sesion.createQuery(hql);
            inter = query.list();
            sesion.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return inter;
    }

    public static Intercambio getIntercambioData(String CLAVE) {
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        
        sesion = sf.openSession();
        Intercambio inter = (Intercambio)sesion.createQuery("SELECT u FROM Intercambio u WHERE u.clave='"+CLAVE+"'").uniqueResult();
        sesion.close();
        if(inter != null){
            return inter;
        }else{
            return null;
        }
    }
    
    public static Intercambio getIntercambioData(int id) {
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        
        sesion = sf.openSession();
        Intercambio inter = (Intercambio)sesion.createQuery("SELECT u FROM Intercambio u WHERE u.idIntercambio='"+id+"'").uniqueResult();
        sesion.close();
        if(inter != null){
            return inter;
        }else{
            return null;
        }
    }

    public static int validarIDinter(String CLAVE) {
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        Intercambio inter = (Intercambio)sesion.createQuery("SELECT u FROM Intercambio u WHERE u.clave='"+CLAVE+"'").uniqueResult();
        sesion.close();
        if(inter != null){
            return 1;
        }else{
            return 0;
        }
    }

    public static int isAdmin(int id_user,int id_inter) {
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        Intercambio inter = (Intercambio)sesion.createQuery("SELECT u FROM Intercambio u WHERE u.idIntercambio='"+id_inter+"' AND idAdmin = '"+id_user+"'").uniqueResult();
        sesion.close();
        if(inter != null){
            return 1;
        }else{
            return 0;
        }
    }

}
