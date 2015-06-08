/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package probotica.modelo.entidad;

import java.sql.Date;

/**
 *
 * @author USUARIO
 */
public class Ingreso {
   private String idingreso;
   private String idtipoingreso;
   private String iddistribuidor;
   private String iddocumento;
   private String codigo_com;
   private String id_formapago;
   private String porcentajeIGV;
   private String fecha_registro;
   private String estado;
   private String idusuario;
   private String nomtipoingreso;
   private String nombredistribuidor;
   private String nomcomprobante;
   
    public Ingreso() {
        this.idingreso="";
    }

    public String getIdingreso() {
        return idingreso;
    }

    public void setIdingreso(String idingreso) {
        this.idingreso = idingreso;
    }

    public String getIdtipoingreso() {
        return idtipoingreso;
    }

    public void setIdtipoingreso(String idtipoingreso) {
        this.idtipoingreso = idtipoingreso;
    }

    public String getIddistribuidor() {
        return iddistribuidor;
    }

    public void setIddistribuidor(String iddistribuidor) {
        this.iddistribuidor = iddistribuidor;
    }

    public String getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(String iddocumento) {
        this.iddocumento = iddocumento;
    }

    public String getCodigo_com() {
        return codigo_com;
    }

    public void setCodigo_com(String codigo_com) {
        this.codigo_com = codigo_com;
    }

    public String getId_formapago() {
        return id_formapago;
    }

    public void setId_formapago(String id_formapago) {
        this.id_formapago = id_formapago;
    }

    public String getPorcentajeIGV() {
        return porcentajeIGV;
    }

    public void setPorcentajeIGV(String porcentajeIGV) {
        this.porcentajeIGV = porcentajeIGV;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

 
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getNomtipoingreso() {
        return nomtipoingreso;
    }

    public void setNomtipoingreso(String nomtipoingreso) {
        this.nomtipoingreso = nomtipoingreso;
    }

    public String getNombredistribuidor() {
        return nombredistribuidor;
    }

    public void setNombredistribuidor(String nombredistribuidor) {
        this.nombredistribuidor = nombredistribuidor;
    }

    public String getNomcomprobante() {
        return nomcomprobante;
    }

    public void setNomcomprobante(String nomcomprobante) {
        this.nomcomprobante = nomcomprobante;
    }

   
}
