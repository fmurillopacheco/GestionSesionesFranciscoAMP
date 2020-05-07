<%-- 
    Document   : index
    Created on : 06-may-2020, 13:50:02
    Author     : Francisco_Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/gestionCss.css"/>

        <title>Gesti&oacute;n de Sesiones FranciscoAMP</title>
    </head>
    <body>
        <%
            String idUsuario = request.getParameter("idUsuario");
            String nombre = request.getParameter("nombre");
            String fecha = request.getParameter("fecha");
            String tipo = request.getParameter("tipo");
            String identificador = request.getParameter("identificador");
            
            String mensaje = "";
            HttpSession sesion = request.getSession(); //crear sesión
            if (request.getParameter("botonSesion") != null) {
                if (request.getParameter("botonSesion").equals("Crear")) {
                    if (nombre.length() == 0) {
                        mensaje = "Debe introducir un nombre de sesión.";
                    } else {
                        session.setAttribute(idUsuario,nombre);
                        mensaje = "Creada la sesion:" + idUsuario + ", con los valores: " + nombre +" "+ fecha + " "+tipo;
                    }
                } else if (request.getParameter("botonSesion").equals("Visualizar")) {
                    mensaje = "El nombre de la sesion es " + idUsuario + " y el valor es " + session.getAttribute(nombre)+session.getAttribute(fecha)+session.getAttribute(tipo);//obtiene el atributo(valor) de la sesion
                } else if (request.getParameter("botonSesion").equals("Modificar")) {
                    session.setAttribute(idUsuario,nombre);
                    mensaje = "Se ha modificado la sesion " + idUsuario + " y el valor es " + session.getAttribute(nombre)+session.getAttribute(fecha)+session.getAttribute(tipo);
                } else if (request.getParameter("botonSesion").equals("Eliminar")) {
                    session.removeAttribute(idUsuario);
                    mensaje = "Se ha eliminado la sesión " + idUsuario + " con valor " + session.getAttribute(nombre)+session.getAttribute(fecha)+session.getAttribute(tipo);
                }
            }
        %>
        <div idUsuario="contenedor">
            <form name="formulario" method="post" action="Entrada">

                <p>
                    <label for="idUsuario">Id usuario: </label>
                    <input type="text" name="idUsuarioUsuario" minlength="2" required>
                </p>
                <p>
                    <label for="nombre">Nombre: </label>
                    <input type="text" name="nombre" required="required">
                </p>
                <p>
                    <label for="fecha">Fecha: </label>
                    <input type="date" name="fecha" required="required">
                </p>
                <p>
                    <label for="tipo">Tipo:</label>
                    <select name="tipo" required="required">
                        <option value="NIF" selected="selected">NIF</option>
                        <option value="NIE">NIE</option>
                        <option value="Pasaporte">Pasaporte</option>
                    </select>
                </p>
                <p>
                    <label for="idUsuarioentificador">Identificador: </label>
                    <input type="text" name="idUsuarioentificador" required="required">
                </p>
                <p><input type="submit" name="enviar" value="enviar" class="boton"></p>
            </form>


        </div>
    </body>
</html>
