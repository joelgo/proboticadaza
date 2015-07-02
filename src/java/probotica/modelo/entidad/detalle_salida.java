/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.entidad;

/**
 *
 * @author CARDENAS
 */
public class detalle_salida {

    private String idsalida;
    private String idproducto;
    private String idlaboratorio;
    private String idlote;
    private String cantidad_unidades;
    private String precio_salida;
    private String nombreproducto;
    private String subtotal;
    private String TOTAL;
    
    
    public detalle_salida() {
    }

    public String getIdsalida() {
        return idsalida;
    }

    public void setIdsalida(String idsalida) {
        this.idsalida = idsalida;
    }

    public String getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(String idproducto) {
        this.idproducto = idproducto;
    }

    public String getIdlaboratorio() {
        return idlaboratorio;
    }

    public void setIdlaboratorio(String idlaboratorio) {
        this.idlaboratorio = idlaboratorio;
    }

    public String getIdlote() {
        return idlote;
    }

    public void setIdlote(String idlote) {
        this.idlote = idlote;
    }

    public String getCantidad_unidades() {
        return cantidad_unidades;
    }

    public void setCantidad_unidades(String cantidad_unidades) {
        this.cantidad_unidades = cantidad_unidades;
    }

    public String getPrecio_salida() {
        return precio_salida;
    }

    public void setPrecio_salida(String precio_salida) {
        this.precio_salida = precio_salida;
    }

    public String getNombreproducto() {
        return nombreproducto;
    }

    public void setNombreproducto(String nombreproducto) {
        this.nombreproducto = nombreproducto;
    }

    public String getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(String subtotal) {
        this.subtotal = subtotal;
    }

    public String getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(String TOTAL) {
        this.TOTAL = TOTAL;
    }

   

  
    
    
}

