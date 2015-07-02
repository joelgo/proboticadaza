/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import probotica.modelo.dao.UsuarioDao;
import probotica.modelo.entidad.Usuario;
import probotica.modelo.util.ConexionOracle;

/**
 *
 * @author USUARIO
 */
public class UsuarioDaoImpl implements UsuarioDao{
    
    public Connection abrirConexion(){
        return ConexionOracle.conectar();
    }
    
    public void Guardar(){
        try {
            ConexionOracle.conectar().commit();
        } catch (Exception e) {
        }
    }
     public void Revertir(){
         try {
            ConexionOracle.conectar().rollback(); 
         } catch (Exception e) {
             
         }
         
     }
    
    public void cerrarConexion(){
        try {
            ConexionOracle.conectar().close();
        } catch (Exception e) {
        }
    }

   
    @Override
    public String validarDato(String usuario, String password) {
        String id= null;
        String query="select idusuario from usuario "
                + "where upper(usuario)='"+usuario.toUpperCase()+"'and password='"+password+"'";
        Statement st= null;
        ResultSet rs= null;
        try {
            st=abrirConexion().createStatement();
            rs=st.executeQuery(query);
            if(rs.next()){
                id=rs.getString("idusuario");     
            }
           cerrarConexion();
        } catch (Exception e) {
          cerrarConexion();
          e.printStackTrace();
          System.out.println("Error: " +e.getMessage());
        }
        
        return id;
    }

    @Override
    public Usuario mostrarUsuario(String id){
        Usuario usuario= null; //se crea el been, el java no tiene el tipo que elimina lo que no usass sino que tiene un recolector de basura que elimina las variable nulass
        String query="select * from usuario "
                     + "where idusuario='"+id+"'";
        Statement st= null;
        ResultSet rs= null;
        try {
            
            st=abrirConexion().createStatement();
            rs=st.executeQuery(query);
            
         if(rs.next()){
                usuario=new Usuario(); // pro que aki si cumplee y nos permite inicializarr aquii
                usuario.setIdusuario(rs.getString("idusuario"));
               usuario.setUsuario(rs.getString("usuario"));
               usuario.setPassword(rs.getString("password"));
               usuario.setEstado(rs.getString("estado"));          
               
            }
           cerrarConexion();
        } catch (Exception e) {
          cerrarConexion();
          e.printStackTrace();
          System.out.println("Error: " +e.getMessage());
        }
        
        return usuario;
    }
    
}
