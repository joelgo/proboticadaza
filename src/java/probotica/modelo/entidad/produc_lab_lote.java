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
public class produc_lab_lote {
    private String idprlablot;
    private String lote;
    private String idlaboratorio;
    private String idproducto;
    private String Stock;
    private String fecha_vencimiento;
    private String estado;

    public produc_lab_lote() {
    }

    
    
    public String getIdprlablot() {
        return idprlablot;
    }

    public void setIdprlablot(String idprlablot) {
        this.idprlablot = idprlablot;
    }

   
    
    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
    }

    public String getIdlaboratorio() {
        return idlaboratorio;
    }

    public void setIdlaboratorio(String idlaboratorio) {
        this.idlaboratorio = idlaboratorio;
    }

    public String getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(String idproducto) {
        this.idproducto = idproducto;
    }

    public String getStock() {
        return Stock;
    }

    public void setStock(String Stock) {
        this.Stock = Stock;
    }

    public String getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public void setFecha_vencimiento(String fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

   

 

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
