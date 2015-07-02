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
import probotica.modelo.entidad.Producto_lab;
import probotica.modelo.entidad.UnidadMedida;
import probotica.modelo.entidad.listproing;
import probotica.modelo.util.ConexionOracle;
import static probotica.modelo.util.ConexionOracle.conectar;
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
                + "composicion,precio_unitario,Stock_minimo,idusuario,estado) values('"+producto.getIdproducto()+"',"
                + " '"+producto.getIdcategoria()+"',"
                + "'"+producto.getId_presentacion()+"',"
                + " '"+producto.getNombreproducto()+"',"
                + " '"+producto.getConcentracion()+"',"
                + "'"+producto.getId_unidadmedida()+"',"
                + "'"+producto.getComposicion()+"',"
                + "'"+producto.getPrecio_unitario()+"',"
                + "'"+producto.getStock_minimo()+"',"
                + "'"+producto.getIdusuario()+"',"
                + "'"+producto.getEstado()+"')";
        
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
        boolean flat = false;
        Statement st = null;
        String query1 = "update producto set estado='"+producto.getEstado()+"'"
                + "where idproducto='"+producto.getIdproducto()+"'";

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

    @Override
    public boolean actualizarProducto(Producto producto) {
        boolean flat = false;
        Statement st = null;
        String query1 = "update producto set nombreproducto='"+producto.getNombreproducto()+"',"
                + " concentracion=" +producto.getConcentracion()+", "
                + "id_unidadmedida='"+producto.getId_unidadmedida()+"', "
                + "precio_unitario='"+producto.getPrecio_unitario()+"', "
                + "id_presentacion='"+producto.getId_presentacion()+"',"
                + "Stock_minimo='"+producto.getStock_minimo()+"' "
                + "where idproducto='"+producto.getIdproducto()+"'";

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

    @Override
    public List<Producto_lab> listarProducto() {
        List<Producto_lab> lista = new ArrayList<Producto_lab>();
        Producto_lab p = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.idproducto, p.nombreproducto||'  '||p.concentracion||' '|| um.unidadmedida as nombre, prll.stock as stock, p.precio_unitario,lab.idlaboratorio, lab.nombrelaboratorio as laboratorio, pr.nombrepresentacion as presentacion, l.fecha_vencimiento, l.idlote"
                + " from producto p, unidad_medida um, produc_lab_lote prll, laboratorio lab, lote l, presentacion pr"
                + " where p.idproducto=prll.idproducto and prll.idlote=l.idlote and prll.idlaboratorio=lab.idlaboratorio and prll.stock>0"
                + " and um.id_unidadmedida=p.id_unidadmedida and pr.id_presentacion=p.id_presentacion";

        try {
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                p = new Producto_lab();
                p.setNombreproducto(rs.getString("nombre"));
                p.setStock(rs.getString("stock"));
                p.setPrecio_unitario(rs.getString("precio_unitario"));
                p.setNombrelaboratorio(rs.getString("laboratorio"));
                p.setNombrepresentacion(rs.getString("presentacion"));
                p.setFecha_vencimiento(rs.getString("fecha_vencimiento"));
                p.setIdlote(rs.getString("idlote"));
                lista.add(p);
            }
            conectar().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conectar().close();
            } catch (Exception ex) {
            }
        }
        return lista;
    }

    @Override
    public boolean reglaboratori(Laboratorio laboratorio1) {
         boolean estado = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(laboratorio1);            
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
    public List<Producto> listProducto() {
       List<Producto> lista = new ArrayList<Producto>();
        Producto p = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.idproducto, p.nombreproducto,p.concentracion, um.unidadmedida, p.Stock_minimo, p.precio_unitario,  pr.nombrepresentacion as presentacion, cat.nombrecategoria,DECODE(p.estado,'1','ACTIVO','DESACTIVADO') AS estado \n" +
          "  from producto p, unidad_medida um, presentacion pr, categoria cat\n" +
          "  where p.idcategoria=cat.idcategoria and um.id_unidadmedida=p.id_unidadmedida and pr.id_presentacion=p.id_presentacion";

        try {
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                p = new Producto();
                p.setIdproducto(rs.getString("idproducto"));
                p.setNombreproducto(rs.getString("nombreproducto"));
                p.setConcentracion(rs.getString("concentracion"));
                p.setUnidadmedida(rs.getString("unidadmedida"));
                p.setStock_minimo(rs.getString("Stock_minimo"));
                p.setPrecio_unitario(rs.getString("precio_unitario"));
                p.setPresentacion(rs.getString("presentacion"));
                p.setNombrecategoria(rs.getString("nombrecategoria"));
                p.setEstado(rs.getString("estado"));
                lista.add(p);
            }
            conectar().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conectar().close();
            } catch (Exception ex) {
            }
        }
        return lista;
    }
    
}
