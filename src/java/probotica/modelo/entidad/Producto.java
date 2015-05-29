
package probotica.modelo.entidad;

/**
 *
 * @author USUARIO
 */
public class Producto {
         
 private String idproducto;
 private String idcategoria;
 private String id_presentacion; 
 private String nombreproducto;
 private String concentracion;
 private String id_unidadmedida;
 private String composicion;
 private String estado;

   
 public Producto() {
     this.setIdproducto("");
     
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

    public String getComposicion() {
        return composicion;
    }

    public void setComposicion(String composicion) {
        this.composicion = composicion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
