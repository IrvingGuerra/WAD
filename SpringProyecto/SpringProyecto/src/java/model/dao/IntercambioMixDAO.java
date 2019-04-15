/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.pojo.Intercambio;
import model.pojo.IntercambioMix;
import model.pojo.Invitados;
import model.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Z420
 */
public class IntercambioMixDAO {

    public static void makeMIX(int id) {
        List<String> Correos = new ArrayList<String>();
        List<Invitados> invit = null;
        try{
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            Query query = sesion.createQuery("SELECT u FROM Invitados u WHERE u.idIntercambio='"+id+"' AND status='aceptado'");
            invit = query.list();
            if(invit != null){
                Iterator<Invitados> invitIterator = invit.iterator();
                while(invitIterator.hasNext()) {
                    Invitados item = invitIterator.next();
                    Correos.add(item.getEmailUser());
                 }
                //Aqui ya esta una lista de correos
                //falta ahora desordenarla
                Collections.shuffle(Correos); //Metodo para desordenar listas
                IntercambioMixDAO.registrarMIX(Correos,id);
                sesion.close();
            }else{
                sesion.close();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    private static void registrarMIX(List<String> Correos, int id_inter) {
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        try{
            sf = HibernateUtil.getSessionFactory();
            sesion = sf.openSession();
            tx = sesion.beginTransaction();
            IntercambioMix interMix = new IntercambioMix();
            interMix.setIdIntercambio(id_inter);
            //Pasamos list a string coma separate

            String random = String.join(",", Correos);
            //Se define el email to y se resepara de nuevo
            String par = "";
            String[] parts = random.split(",");
            for(int i=0;i<parts.length;i++){
                String tetoco = "";
                if(i==parts.length-1){
                    par = parts[i] + "->" +parts[0];
                    tetoco = parts[0];
                }else{
                   par = parts[i] + "->" +parts[i+1]; 
                   tetoco = parts[i+1];
                }
                //En cada parte del for se enviaran los emails
                String email_to = parts[i];
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
                    javax.mail.Session sesionmail = javax.mail.Session.getDefaultInstance(prop,null);
                    MimeMessage message = new MimeMessage(sesionmail);
                    message.setFrom(new InternetAddress(username));
                    message.setRecipient(Message.RecipientType.TO, new InternetAddress(email_to));
                    message.setSubject("¡El intercambio ya se realizo!!");
                    String Mensaje = "El usuario que le toco, fue: "+tetoco;
                    message.setContent(Mensaje, "text/html; charset=utf-8");
                    Transport transport = sesionmail.getTransport("smtp");
                    transport.connect(host,username,password);
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }

  
            interMix.setRandom(random);
            sesion.save(interMix);
            tx.commit();
            sesion.close();
        }catch(Exception ex){
            tx.rollback();
            throw new RuntimeException("No se pudo guardar el MIX");
        }
    }

    public static int isMixed(int id) {
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        IntercambioMix inter = (IntercambioMix)sesion.createQuery("SELECT u FROM IntercambioMix u WHERE u.idIntercambio='"+id+"'").uniqueResult();
        sesion.close();
        if(inter != null){
            return 1;
        }else{
            return 0;
        }
    }

    public static List<String> getMIX(Integer idIntercambio) {
        List<String> mix = new ArrayList<String>();
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        IntercambioMix inter = (IntercambioMix)sesion.createQuery("SELECT u FROM IntercambioMix u WHERE u.idIntercambio='"+idIntercambio+"'").uniqueResult();
        sesion.close();
        if(inter != null){
            //Aqui regreso random
            String par = "";
            String[] parts = inter.getRandom().split(",");
            for(int i=0;i<parts.length;i++){
                if(i==parts.length-1){
                    par = parts[i] + "->" +parts[0];
                }else{
                   par = parts[i] + "->" +parts[i+1]; 
                }
                mix.add(par);
            }
            return mix;
        }else{
            return null;
        }
    }
    
    /*
    String string = "004-034556";
String[] parts = string.split("-");
String part1 = parts[0]; // 004
String part2 = parts[1]; // 034556
    */

    public static List<String> getMyMIX(Integer idIntercambio,String email) {
        List<String> mix = new ArrayList<String>();
        SessionFactory sf= null;
        Session sesion = null;
        Transaction tx = null;
        sf = HibernateUtil.getSessionFactory();
        sesion = sf.openSession();
        IntercambioMix inter = (IntercambioMix)sesion.createQuery("SELECT u FROM IntercambioMix u WHERE u.idIntercambio='"+idIntercambio+"'").uniqueResult();
        sesion.close();
        if(inter != null){
            //Aqui regreso random
            String par = "";
            String[] parts = inter.getRandom().split(",");
            for(int i=0;i<parts.length;i++){
                if(i==parts.length-1){
                    par = parts[i] + "->" +parts[0];
                }else{
                   par = parts[i] + "->" +parts[i+1]; 
                }
                if(parts[i].equals(email)){
                    mix.add(par);
                }
                
            }
            return mix;
        }else{
            return null;
        }
    }
}
