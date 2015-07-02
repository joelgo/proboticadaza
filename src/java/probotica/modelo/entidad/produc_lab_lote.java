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
    
    private String idlote;
    private String idlaboratorio;
    private String idproducto;
    private String Stock;
    private String estado;

    public produc_lab_lote() {
        
    }
    

    public String getIdlote() {
        return idlote;
    }

    public void setIdlote(String idlote) {
        this.idlote = idlote;
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
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
