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
import probotica.modelo.entidad.Lote;
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
        //c.ejecutarprocedimiento();
        //c.validar();
        c.ejecutarprocedimiento2();
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
        Producto  producto = new Producto ();
        
        producto.setIdproducto("Prod-0306201516283876");
        producto.setNombreproducto("Amoxicilina");
        producto.setConcentracion("125");
        producto.setId_unidadmedida("UNID-0005");
        producto.setId_presentacion("PRE-00001");
        producto.setPrecio_unitario("2.80");
        producto.setStock_minimo("5");
        
        
        if (productoDao.actualizarProducto(producto)) {
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
        System.out.println("id"+usuario.getIdusuario()+ "usuario"+usuario.getUsuario()+""+usuario.getPassword());
     
    }
    
    public void buscarlote(){
        IngresoDao dao= new IngresoDaoImpl();
        int l=0;
        l=dao.buscarLote("140813");
        System.out.println("idlote:"+l);
    }
    
    public void ejecutarprocedimiento(){
        IngresoDao dao= new IngresoDaoImpl();
        
        String idlot="023";
        String idlaboratorio="LAB-0005"; 
                String idproducto="Prod-0706201520375351";
                String precioingreso="2.30"; 
                String cantidadunidades="12"; 
                String descuento="0"; 
               String idingreso="ING-1106201505074166"; 
                String fecha_vencimiento="22/07/2018";
      
                        
     if (dao.insertarcompra(idlot, idlaboratorio, idproducto, precioingreso, cantidadunidades, descuento, idingreso, fecha_vencimiento)) {
            System.out.println("Se modifico la cliente...");
            
        } else {
            System.out.println("No se modifico el cliente");
        }
    }
    
    public void ejecutarprocedimiento2(){
        IngresoDao dao= new IngresoDaoImpl();
        
        String idlot="bg765";
        String idlaboratorio="LAB-0001";                
        String idproducto="Prod-0706201520375356";
                String precioingreso="0.40"; 
                String cantidadunidades="12"; 
                String descuento="1"; 
               String idingreso="ING-1706201506284633"; 
                String fecha_vencimiento="22/07/2013";
      
                        
     if (dao.actuIngreso(idlot,idlaboratorio,idproducto, precioingreso,cantidadunidades,descuento,idingreso,fecha_vencimiento)) {
            System.out.println("Se modifico la cliente...");
            
        } else {
            System.out.println("No se modifico el cliente");
        }
    }
}

 
       
