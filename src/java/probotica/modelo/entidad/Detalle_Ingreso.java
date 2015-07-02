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
    private String idlote;
    private String idlaboratorio;
    private String idproducto;
    private String cantidad_unidades;
    private String precio_ingreso;
    private String descuento;
    private String fecha_vencimiento;
    private String estado;

    public Detalle_Ingreso() {
    }

    public String getIdingreso() {
        return idingreso;
    }

    public void setIdingreso(String idingreso) {
        this.idingreso = idingreso;
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
