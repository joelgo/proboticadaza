/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import probotica.modelo.dao.IngresoDao;
import probotica.modelo.dao.ProboticaDao;
import probotica.modelo.dao.ProductoDao;
import probotica.modelo.dao.UsuarioDao;
import probotica.modelo.dao.impl.IngresoDaoImpl;
import probotica.modelo.dao.impl.ProboticaDaoImpl;
import probotica.modelo.dao.impl.ProductoDaoImpl;
import probotica.modelo.dao.impl.UsuarioDaoImpl;
import probotica.modelo.entidad.Ingreso;
import probotica.modelo.entidad.Laboratorio;
import probotica.modelo.entidad.Persona;
import probotica.modelo.entidad.Producto;
import probotica.modelo.entidad.ProductoCatUnmPre;
import probotica.modelo.entidad.Usuario;
import probotica.modelo.entidad.produc_lab_lote;

/**
 *
 * @author USUARIO
 */
public class consola {
    public static void main(String[] args) {
        consola c=new consola();
        //c.insertarproducto();
        //c.Update();
        //c.ActualizarProducto();
        //c.registrarIngreso();
        c.validar();
    }
public void insertarproducto(){
    ProboticaDao dao=new ProboticaDaoImpl();
    Producto p=new Producto();
    p.setIdproducto(null);
    p.setComposicion("erer");
    p.setConcentracion("erer");
    p.setEstado("1");
    p.setId_presentacion("PRS-0020");
    p.setId_unidadmedida("UNM-0005");
    p.setIdcategoria("CAT-0002");
    p.setNombreproducto("helado");
    if(dao.registrarProducto(p)){
        System.out.println("correcto");
    }else{
        System.out.println("incorrecto");
    }
}

public void buscarDni(String dni){
    ProboticaDao dao=new ProboticaDaoImpl();
    Persona p=new Persona();
    p.setDni("71643008");
    
   
    
}

       public void Update(){
        ProductoDao productoDao = new ProductoDaoImpl();
        Laboratorio laboratorio = new Laboratorio();
        
        laboratorio.setIdlaboratorio("LAB-0002");
        laboratorio.setNombrelaboratorio("Portuga");
        
        
        if (productoDao.modificarLaboratorio(laboratorio)) {
            System.out.println("Se modifico la cliente...");
            
        } else {
            System.out.println("No se modifico el cliente");
        }
        
    } 
       
      public void ActualizarProducto(){
        ProductoDao productoDao = new ProductoDaoImpl();
        ProductoCatUnmPre productocatunmpre = new ProductoCatUnmPre();
        
        productocatunmpre.setIdproducto("Prod-0306201516283876");
        productocatunmpre.setNombreproducto("Amoxicilina");
        productocatunmpre.setConcentracion("125");
        productocatunmpre.setId_unidadmedida("UNID-0005");
        productocatunmpre.setId_presentacion("PRE-00001");
        productocatunmpre.setPrecio_unitario("2.80");
        productocatunmpre.setStock_minimo("5");
        
        
        if (productoDao.actualizarProducto(productocatunmpre)) {
            System.out.println("Se modifico la cliente...");
            
        } else {
            System.out.println("No se modifico el cliente");
        }
        
    }
      
      
    public void registrarIngreso(){
        
    IngresoDao dao=new IngresoDaoImpl();
    Ingreso I=new Ingreso();
    produc_lab_lote p=new produc_lab_lote();
    
    I.setIdtipoingreso("1");
    I.setIddistribuidor("DIST-0001");
    I.setIddocumento("com-0001");
    I.setCodigo_com("001-0001234");
    I.setId_formapago("1");
    I.setPorcentajeIGV("0");
    I.setEstado("1");
    I.setIdusuario("PERS-0001");
    p.setIdproducto("Prod-0306201516283906");
    p.setLote("987603");
    p.setFecha_vencimiento("03/07/2015");
    p.setIdlaboratorio("LAB-0001");
    p.setEstado("1");
    
    
//   // if(dao.InsertarIngreso(I,p)){
//        System.out.println("correcto");
//    }else{
//        System.out.println("incorrecto");
//        
//    }
    
    }
      public void validar(){
        UsuarioDao dao= new UsuarioDaoImpl();
      String id="";
      id=dao.validarDato("adm","123");
      System.out.println("id :" +id);
    
    }
    
    public void verUsuario(){
     UsuarioDao dao= new UsuarioDaoImpl();
     Usuario usuario= new Usuario();
     usuario=dao.mostrarUsuario("1");
        System.out.println("id " +usuario.getIdusuario()+ "usuario"+usuario.getUsuario()+""+usuario.getPassword());
     
    }
}
       
