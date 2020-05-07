/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.beans;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Francisco_Antonio
 */
public class Usuario implements Serializable{
    private Short idUsuario;
    private String nombre;
    private Date fecha;
    public enum tipoId {
        NIF,
        NIE,
        Pasaporte
    };
    private tipoId tipo;
    private String identificador;

    public Short getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Short idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public tipoId getTipo() {
        return tipo;
    }

    public void setTipo(tipoId tipo){
        this.tipo = tipo;
    }

    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }
   
}
