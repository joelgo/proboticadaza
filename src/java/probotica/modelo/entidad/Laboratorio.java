package probotica.modelo.entidad;
// Generated 07/06/2015 09:56:10 PM by Hibernate Tools 4.3.1



/**
 * Laboratorio generated by hbm2java
 */
public class Laboratorio  implements java.io.Serializable {


     private String idlaboratorio;
     private String nombrelaboratorio;
     private String estado;

    public Laboratorio() {
        
    }

	
    public Laboratorio(String idlaboratorio) {
        this.idlaboratorio = idlaboratorio;
    }
    public Laboratorio(String idlaboratorio, String nombrelaboratorio, String estado) {
       this.idlaboratorio = idlaboratorio;
       this.nombrelaboratorio = nombrelaboratorio;
       this.estado = estado;
    }
   
    public String getIdlaboratorio() {
        return this.idlaboratorio;
    }
    
    public void setIdlaboratorio(String idlaboratorio) {
        this.idlaboratorio = idlaboratorio;
    }
    public String getNombrelaboratorio() {
        return this.nombrelaboratorio;
    }
    
    public void setNombrelaboratorio(String nombrelaboratorio) {
        this.nombrelaboratorio = nombrelaboratorio;
    }
    public String getEstado() {
        return this.estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }




}


