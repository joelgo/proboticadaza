/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import probotica.modelo.dao.ProboticaDao;
import probotica.modelo.dao.impl.ProboticaDaoImpl;
import probotica.modelo.entidad.Persona;
import probotica.modelo.entidad.Producto;

/**
 *
 * @author USUARIO
 */
public class consola {
    public static void main(String[] args) {
        consola c=new consola();
        c.insertarproducto();
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
}
       
