/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.entidad;

/**
 *
 * @author USUARIO
 */
public class Detalle_Ingreso {
    
    private String idingreso;
    private String idprlablot;
    private String idproducto;
    private String cantidad_unidades;
    private String precio_ingreso;
    private String descuento;
    private String orden;
    private String estado;

    public Detalle_Ingreso() {
    }

    public String getIdingreso() {
        return idingreso;
    }

    public void setIdingreso(String idingreso) {
        this.idingreso = idingreso;
    }

    public String getIdprlablot() {
        return idprlablot;
    }

    public void setIdprlablot(String idprlablot) {
        this.idprlablot = idprlablot;
    }

    public String getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(String idproducto) {
        this.idproducto = idproducto;
    }

    public String getCantidad_unidades() {
        return cantidad_unidades;
    }

    public void setCantidad_unidades(String cantidad_unidades) {
        this.cantidad_unidades = cantidad_unidades;
    }

    public String getPrecio_ingreso() {
        return precio_ingreso;
    }

    public void setPrecio_ingreso(String precio_ingreso) {
        this.precio_ingreso = precio_ingreso;
    }

    public String getDescuento() {
        return descuento;
    }

    public void setDescuento(String descuento) {
        this.descuento = descuento;
    }

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

      
}
