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
public class Producto implements java.io.Serializable {
    
    private String idproducto;
    private String idcategoria;
    private String id_presentacion;
    private String nombreproducto;
    private String concentracion;
    
    private String unidadmedida;
    
    private String presentacion;
    
    private String nombrecategoria;
    
    private String id_unidadmedida;
    private String precio_unitario;
    private String composicion;
    private String Stock_minimo;
    private String Stock_actual;
    private String idusuario;
    private String estado;

    public Producto() {
    }

    public String getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(String idproducto) {
        this.idproducto = idproducto;
    }

    public String getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(String idcategoria) {
        this.idcategoria = idcategoria;
    }

    public String getId_presentacion() {
        return id_presentacion;
    }

    public void setId_presentacion(String id_presentacion) {
        this.id_presentacion = id_presentacion;
    }

    public String getNombreproducto() {
        return nombreproducto;
    }

    public void setNombreproducto(String nombreproducto) {
        this.nombreproducto = nombreproducto;
    }

    public String getConcentracion() {
        return concentracion;
    }

    public void setConcentracion(String concentracion) {
        this.concentracion = concentracion;
    }

    public String getId_unidadmedida() {
        return id_unidadmedida;
    }

    public void setId_unidadmedida(String id_unidadmedida) {
        this.id_unidadmedida = id_unidadmedida;
    }

    public String getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(String precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    public String getComposicion() {
        return composicion;
    }

    public void setComposicion(String composicion) {
        this.composicion = composicion;
    }

    public String getStock_minimo() {
        return Stock_minimo;
    }

    public void setStock_minimo(String Stock_minimo) {
        this.Stock_minimo = Stock_minimo;
    }

    public String getStock_actual() {
        return Stock_actual;
    }

    public void setStock_actual(String Stock_actual) {
        this.Stock_actual = Stock_actual;
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

    public String getUnidadmedida() {
        return unidadmedida;
    }

    public void setUnidadmedida(String unidadmedida) {
        this.unidadmedida = unidadmedida;
    }

    public String getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(String presentacion) {
        this.presentacion = presentacion;
    }

    public String getNombrecategoria() {
        return nombrecategoria;
    }

    public void setNombrecategoria(String nombrecategoria) {
        this.nombrecategoria = nombrecategoria;
    }
    
    
    
    
}
