/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import es.albarregas.beans.Usuario;
import es.albarregas.utils.EnumConverter;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

/**
 *
 * @author Francisco_Antonio
 */
@WebServlet(name = "Entrada", urlPatterns = {"/Entrada"})
public class Entrada extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Usuario usuario = new Usuario();

            DateConverter converter = new DateConverter();
            converter.setPattern("yyyy-MM-dd");
            ConvertUtils.register(converter, Date.class);

            ConvertUtils.register(new EnumConverter(), Usuario.tipoId.class);
            BeanUtils.populate(usuario, request.getParameterMap());

            request.setAttribute("usuario", usuario);
        } catch (IllegalAccessException | InvocationTargetException ex) {
            Logger.getLogger(Entrada.class.getName()).log(Level.SEVERE, null, ex);
        } 
        request.getRequestDispatcher("salida.jsp").forward(request, response);

    }
}
