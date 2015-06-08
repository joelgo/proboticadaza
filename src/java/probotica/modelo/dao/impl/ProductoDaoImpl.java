/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.dao.impl;

import static java.nio.channels.AsynchronousServerSocketChannel.open;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import probotica.modelo.dao.ProductoDao;
import probotica.modelo.entidad.Categoria;
import probotica.modelo.entidad.Laboratorio;
import probotica.modelo.entidad.Presentacion;
import probotica.modelo.entidad.Producto;
import probotica.modelo.entidad.ProductoCatUnmPre;
import probotica.modelo.entidad.UnidadMedida;
import probotica.modelo.util.ConexionOracle;
import probotica.modelo.util.HibernateUtil;

/**
 *
 * @author USUARIO
 */
public class ProductoDaoImpl implements ProductoDao {
      public Connection conecta(){
      return ConexionOracle.conectar();
    }

    @Override
    public List<Categoria> listarCategoria() {
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
    public boolean registarProducto(Producto producto) {
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
    public boolean modificarLaboratorio(Laboratorio laboratorio) {
         boolean flat= false; // es el tipo de variable que espera como retorno
        SessionFactory sf=null;
        Session session=null;
        Transaction transaction= null;
        try {
            sf=HibernateUtil.getSessionFactory();// llamanos  a hibernate util
            session = sf.openSession();
            transaction=session.beginTransaction();// estoy pidiendo realizar la transaccion con el objeto transaction
            
            Laboratorio cUpdate = (Laboratorio)session.get(Laboratorio.class,laboratorio.getIdlaboratorio());
            cUpdate.setNombrelaboratorio(laboratorio.getNombrelaboratorio());
            session.update(cUpdate);
            transaction.commit();
            session.close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
            flat=false;
        }
      return flat;
    }

    @Override
    public List<ProductoCatUnmPre> listarProdCatUniPresen() {
        List<ProductoCatUnmPre> lista = new ArrayList<ProductoCatUnmPre>();
        ProductoCatUnmPre c = null;
        Statement st = null;
        ResultSet rs = null;
        String query ="select p.idproducto, p.nombreproducto,p.concentracion,unm.unidadmedida,pr.nombrepresentacion,cat.nombrecategoria,p.precio_unitario,p.composicion,p.Stock_minimo,p.estado\n" +
       "from producto p, categoria cat, unidad_medida unm, presentacion pr \n" +
       "where p.idcategoria=cat.idcategoria and p.id_presentacion=pr.id_presentacion and p.id_unidadmedida=unm.id_unidadmedida and p.estado='1' ";
        //select distinct u.id_unidad, (select abreviatura from unidad where id_unidad = (u.id_unidad)) as fac from unidad_evento ue, unidad u where ue.id_evento = '"+idEvento+"' and ue.id_unidad = u.id_unidad order by u.id_unidad
        try {
            st = conecta().createStatement(); // 
            rs = st.executeQuery(query);
            while (rs.next()) {  
                c = new ProductoCatUnmPre();
                c.setIdproducto(rs.getString("idproducto"));
                c.setNombreproducto(rs.getString("nombreproducto"));
                c.setConcentracion(rs.getString("concentracion"));
                c.setUnidadmedida(rs.getString("unidadmedida"));
                c.setNombrepresentacion(rs.getString("nombrepresentacion"));
                c.setNombrecategoria(rs.getString("nombrecategoria"));
                c.setPrecio_unitario(rs.getString("precio_unitario"));
                c.setStock_minimo(rs.getString("Stock_minimo")); 
                lista.add(c);
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return lista;
    }

    @Override
    public boolean desactivarProducto(Producto producto) {
          boolean estado = false;
//        Statement st=null;
//        String query="delete from cliente  where idcliente="+id;
//        try {
//            st=abrirConexion().createStatement();
//            st.executeUpdate(query);
//            Guardar();
//            cerrarConexion();
//            estado =true;
//        } catch (Exception e) {
//            e.printStackTrace();
//            estado=false;
//            try {
//                Revertir();
//                cerrarConexion();
//            } catch (Exception ex) {
//                
//            }
//        }
        return estado;
    }

    @Override
    public boolean actualizarProducto(ProductoCatUnmPre productocatunmpre) {
        boolean flat = false;
        Statement st = null;
        String query1 = "update producto set nombreproducto='"+productocatunmpre.getNombreproducto()+"',"
                + " concentracion=" +productocatunmpre.getConcentracion()+", "
                + "id_unidadmedida='"+productocatunmpre.getId_unidadmedida()+"', "
                + "precio_unitario='"+productocatunmpre.getPrecio_unitario()+"', "
                + "id_presentacion='"+productocatunmpre.getId_presentacion()+"',"
                + "Stock_minimo='"+productocatunmpre.getStock_minimo()+"' "
                + "where idproducto='"+productocatunmpre.getIdproducto()+"'";
                
              //  "insert into alumno values(" + alumnoCursos.getAlumno().getAlumnoid() + ",'" + // llamamos al super bean, al encapsulado y al atributo del encapsulado
               // alumnoCursos.getAlumno().getNombre() + "')";
        try {
            st = conecta().createStatement();
            st.executeUpdate(query1);
            conecta().commit();
            open().close();
         flat=true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();
                conecta().close();
                flat=false;
            } catch (Exception ex) {
            }
        }
          return flat;
    }
    
}
