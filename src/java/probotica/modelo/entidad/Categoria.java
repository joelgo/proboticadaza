package probotica.modelo.entidad;
// Generated 07/06/2015 09:56:10 PM by Hibernate Tools 4.3.1



/**
 * Categoria generated by hbm2java
 */
public class Categoria  implements java.io.Serializable {


     private String idcategoria;
     private String nombrecategoria;

    public Categoria() {
    }

	
    public Categoria(String idcategoria) {
        this.idcategoria = idcategoria;
    }
    public Categoria(String idcategoria, String nombrecategoria) {
       this.idcategoria = idcategoria;
       this.nombrecategoria = nombrecategoria;
    }
   
    public String getIdcategoria() {
        return this.idcategoria;
    }
    
    public void setIdcategoria(String idcategoria) {
        this.idcategoria = idcategoria;
    }
    public String getNombrecategoria() {
        return this.nombrecategoria;
    }
    
    public void setNombrecategoria(String nombrecategoria) {
        this.nombrecategoria = nombrecategoria;
    }




}


