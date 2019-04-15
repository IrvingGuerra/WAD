/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author alumno
 */
public class LoginAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILED = "failed";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
            String name = "";
            String respuesta = FAILED;

            Connection conn = null;
            
            
            LoginActionFormBean lfb = (LoginActionFormBean)form;
            
            try {
                String URL = "jdbc:mysql://localhost:3307/struct";
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(URL, "root", "");
                String sql = "SELECT user FROM usuario WHERE username = '"+lfb.getUsername()+"' AND password = '"+lfb.getPassword()+"'";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    lfb.setName(rs.getString(1));
                    respuesta = SUCCESS;
                }
            } catch (Exception e) {
                respuesta = FAILED;
                System.out.println("Error: "+e.getMessage());
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (Exception e) {
                    }
                }
            }
   
        return mapping.findForward(respuesta);
    }
}
