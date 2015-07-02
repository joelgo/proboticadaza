/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import probotica.modelo.dao.ProboticaDao;
import probotica.modelo.entidad.Categoria;
import probotica.modelo.entidad.Comprobante;
import probotica.modelo.entidad.Distribuidor;
import probotica.modelo.entidad.Laboratorio;
import probotica.modelo.entidad.Persona;
import probotica.modelo.entidad.Presentacion;
import probotica.modelo.entidad.Producto;
import probotica.modelo.entidad.UnidadMedida;
import probotica.modelo.entidad.Usuario;
import probotica.modelo.util.ConexionOracle;
import probotica.modelo.util.HibernateUtil;

/**
 *
 * @author USUARIO
 */
public class ProboticaDaoImpl implements ProboticaDao{
      public Connection conecta(){
      return ConexionOracle.conectar();
    }

    @Override
    public boolean registarPersona(Persona persona) {
        boolean estado = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(persona);            
            t.commit();
            session.close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            estado = false;
            t.rollback();
            session.close();
           
        }
        return estado;
    }

    @Override
    public boolean registrarDistribuidor(Distribuidor distribuidor) {
     boolean estado = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(distribuidor);            
            t.commit();
            session.close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            estado = false;
            t.rollback();
            session.close();     
        }
        return estado; 
    }


    @Override
    public List<Categoria>listarCategoria(){
       List<Categoria>lista=null;
        SessionFactory sf=null; // hibernate
        Session session=null;
       
        try {
           sf=HibernateUtil.getSessionFactory();// se llama a la variable util hibernal para conectarse con hibernate
            session=sf.openSession();
           lista = new ArrayList<Categoria>();
            Query query= session.createQuery("from Categoria"); // similar al selectttt 
            lista = query.list();// llenamos la lista
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }


    @Override
    public List<Comprobante> listarComprobante() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Distribuidor> listarDistribuidor() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Laboratorio> listarLaboratorio() {
         List<Laboratorio> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Laboratorio>();
            Query query = session.createQuery("FROM Laboratorio");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public boolean registrarProducto(Producto producto) {
        Statement st = null;
        boolean flat = false;
        String query = "insert into producto(idproducto,idcategoria,id_presentacion,nombreproducto,concentracion,id_unidadmedida,"
                + "composicion,estado) values('"+producto.getIdproducto()+"',"
                + " '"+producto.getIdcategoria()+"',"
                + "'"+producto.getId_presentacion()+"',"
                + " '"+producto.getNombreproducto()+"',"
                + " '"+producto.getConcentracion()+"',"
                + "'"+producto.getId_unidadmedida()+"',"
                + "'"+producto.getComposicion()+"',"
                + "'"+producto.getEstado()+"')";
        System.out.println(query);
        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();//metodo que contiene el commit();
            conecta().close();//metodo que contiene el .Close(); para cerrar conexion
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();//metodo que contiene el rollback();
                conecta().close();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public List<UnidadMedida> listarUnidadMedida() {
           List<UnidadMedida> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<UnidadMedida>();
            Query query = session.createQuery("FROM UnidadMedida");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public List<Presentacion> listarPresentacion() {
      
         List<Presentacion> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Presentacion>();
            Query query = session.createQuery("FROM Presentacion");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    
    }

    @Override
    public Persona buscarPersona(String dni) {
        Persona persona = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            Query query = session.createQuery("FROM Persona WHERE dni='"+dni+"'");
            persona = (Persona)query.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
       return persona;
    }
    
    
    
    
    @Override
    public boolean registrarUsuario(Usuario usuario) {
        Statement st = null;
        boolean flat = false;
        String query ="insert into usuario(idusuario,usuario,password,estado) values ('"+usuario.getIdusuario()+"','"+usuario.getUsuario()+"','"+usuario.getPassword()+"','"+usuario.getEstado()+"')";
        System.out.println(query);
        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();//metodo que contiene el commit();
            conecta().close();//metodo que contiene el .Close(); para cerrar conexion
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();//metodo que contiene el rollback();
                conecta().close();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;  
    }

    @Override
    public List<Persona> listarPersona() {
          List<Persona> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Persona>();
            Query query = session.createQuery("FROM Persona");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public List<Producto> listarproducto() {
         throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarLaboratorio(Laboratorio laboratorio) {
        boolean flat = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction transaction = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session =  sf.openSession();
            transaction = session.beginTransaction();
            
            Laboratorio cDelete = (Laboratorio)session.get(Laboratorio.class,laboratorio.getIdlaboratorio());
            session.delete(cDelete);
            transaction.commit();
            session.close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
            flat = false;
        }
        return flat;
    }

    @Override
    public Producto buscarproducto(String idproducto) {
        Producto producto = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            Query query = session.createQuery("FROM Producto WHERE idproducto='"+idproducto+"'");
            producto = (Producto)query.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
       return producto;
    }

   
    


}

    
      

    



