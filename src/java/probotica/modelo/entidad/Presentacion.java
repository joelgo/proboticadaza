package probotica.modelo.entidad;
// Generated 07/06/2015 09:56:10 PM by Hibernate Tools 4.3.1



/**
 * Presentacion generated by hbm2java
 */
public class Presentacion  implements java.io.Serializable {


     private String idPresentacion;
     private String nombrepresentacion;

    public Presentacion() {
    }

	
    public Presentacion(String idPresentacion) {
        this.idPresentacion = idPresentacion;
    }
    public Presentacion(String idPresentacion, String nombrepresentacion) {
       this.idPresentacion = idPresentacion;
       this.nombrepresentacion = nombrepresentacion;
    }
   
    public String getIdPresentacion() {
        return this.idPresentacion;
    }
    
    public void setIdPresentacion(String idPresentacion) {
        this.idPresentacion = idPresentacion;
    }
    public String getNombrepresentacion() {
        return this.nombrepresentacion;
    }
    
    public void setNombrepresentacion(String nombrepresentacion) {
        this.nombrepresentacion = nombrepresentacion;
    }




}


