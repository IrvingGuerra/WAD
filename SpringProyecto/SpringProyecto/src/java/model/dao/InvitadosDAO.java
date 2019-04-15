/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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
 * @author Z420
 */
public class InvitadosDAO {
    
    public static List<Intercambio>getIntercambiosPertenezco(String email){
        List<Intercambio> inter = new ArrayList<Intercambio>();
        List<Invitados> invit = null;
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("SELECT u FROM Invitados u WHERE u.emailUser='"+email+"' AND status='aceptado'");
            invit = query.list();
            if(invit != null){
                Iterator<Invitados> invitIterator = invit.iterator();
                while(invitIterator.hasNext()) {
                    Invitados item = invitIterator.next();
                    Intercambio result = (Intercambio)sesion.createQuery("SELECT u FROM Intercambio u WHERE u.idIntercambio='"+item.getIdIntercambio()+"'").uniqueResult();
                    inter.add(result);
                 }
                sesion.close();
                return inter;
            }else{
                sesion.close();
                return null;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return inter;
    }
    
    
    public static List<Intercambio>getMisInvitaciones(String email){
        List<Intercambio> inter = new ArrayList<Intercambio>();
        List<Invitados> invit = null;
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("SELECT u FROM Invitados u WHERE u.emailUser='"+email+"' AND status='noaceptado'");
            invit = query.list();
            if(invit != null){
                Iterator<Invitados> invitIterator = invit.iterator();
                while(invitIterator.hasNext()) {
                    Invitados item = invitIterator.next();
                    Intercambio result = (Intercambio)sesion.createQuery("SELECT u FROM Intercambio u WHERE u.idIntercambio='"+item.getIdIntercambio()+"'").uniqueResult();
                    inter.add(result);
                 }
                sesion.close();
                return inter;
            }else{
                sesion.close();
                return null;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return inter;
    }

    public static void changeStatus(String id,String email) {
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        try{
            sf = HibernateUtil.getSessionFactory();
            sesion = sf.openSession();
            tx = sesion.beginTransaction();
            int i = IntercambioDAO.getIntercambioData(id).getIdIntercambio();
            Invitados invitacion = InvitadosDAO.getInvitacion(i,email);
            invitacion.setStatus("aceptado");
            sesion.update(invitacion);
            tx.commit();
            sesion.close();
        }catch(Exception ex){
            tx.rollback();
            throw new RuntimeException("No se pudo actualizar la invitacion");
        }
    }

    private static Invitados getInvitacion(int id,String email) {
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Invitados invit = (Invitados)sesion.createQuery("SELECT u FROM Invitados u WHERE u.idIntercambio='"+id+"' AND emailUser = '"+email+"'").uniqueResult();
            return  invit;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
 
    
    public static int getMisInvitacionesNumero(String email){
        List<Invitados> invit = null;
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("SELECT u FROM Invitados u WHERE u.emailUser='"+email+"' AND status='noaceptado'");
            invit = query.list();
            if(invit != null){
                sesion.close();
                System.out.print(invit.size());
                return invit.size();
            }else{
                sesion.close();
                return 0;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    public static void invitar(String email_to,int id) {
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        try{
            sf = HibernateUtil.getSessionFactory();
            sesion = sf.openSession();
            tx = sesion.beginTransaction();
            Invitados invitacion = new Invitados();
            invitacion.setEmailUser(email_to);
            invitacion.setIdIntercambio(id);
            invitacion.setStatus("noaceptado");
            sesion.save(invitacion);
            tx.commit();
            sesion.close();
        }catch(Exception ex){
            tx.rollback();
            throw new RuntimeException("No se pudo guardar la invitacion");
        }
    }

    public static int getInvitacionesTotales() {
        List<Invitados> invit = null;
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("FROM Invitados");
            invit = query.list();
            if(invit != null){
                sesion.close();
                return invit.size();
            }else{
                sesion.close();
                return 0;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    
    public static List<Usuario>getParticipantes(int id_intercambio){
        List<Usuario> participantes = new ArrayList<Usuario>();
        List<Invitados> invit = null;
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("SELECT u FROM Invitados u WHERE u.idIntercambio='"+id_intercambio+"' AND status='aceptado'");
            invit = query.list();
            if(invit != null){
                Iterator<Invitados> invitIterator = invit.iterator();
                while(invitIterator.hasNext()) {
                    Invitados item = invitIterator.next();
                    Usuario result = (Usuario)sesion.createQuery("SELECT u FROM Usuario u WHERE u.email='"+item.getEmailUser()+"'").uniqueResult();
                    if(result==null){
                        Usuario invitado = new Usuario();
                        invitado.setEmail(item.getEmailUser());
                        invitado.setId(0);
                        String nombre = "";
                        if(item.getEmailUser().contains("@gmail.com")){
                            nombre =item.getEmailUser().replace("@gmail.com", "");
                        }else if(item.getEmailUser().contains("@hotmail.com")){
                            nombre =item.getEmailUser().replace("@hotmail.com", "");
                        }
                        invitado.setName(nombre);
                        participantes.add(invitado);
                    }else{
                        participantes.add(result);
                    }
                 }
                sesion.close();
                return participantes;
            }else{
                sesion.close();
                return null;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return participantes;
    }
    
    public static List<String>getInvitados(int id_intercambio){
        List<String> participantes = new ArrayList<String>();
        List<Invitados> invit = null;
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("SELECT u FROM Invitados u WHERE u.idIntercambio='"+id_intercambio+"' AND status='noaceptado'");
            invit = query.list();
            if(invit != null){
                Iterator<Invitados> invitIterator = invit.iterator();
                while(invitIterator.hasNext()) {
                    Invitados item = invitIterator.next();
                    participantes.add(item.getEmailUser());
                 }
                sesion.close();
                return participantes;
            }else{
                sesion.close();
                return null;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return participantes;
    }
    
}
