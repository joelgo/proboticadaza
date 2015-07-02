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
import probotica.modelo.dao.SalidaDao;
import probotica.modelo.entidad.Producto;
import probotica.modelo.entidad.Producto_lab;
import probotica.modelo.entidad.Salida;
import probotica.modelo.entidad.detalle_salida;
import probotica.modelo.util.ConexionOracle;
import probotica.modelo.util.HibernateUtil;

/**
 *
 * @author Leidy
 */
public class SalidaDaoImpl implements SalidaDao {

    public Connection conectar() {
        return ConexionOracle.conectar();

    }

    @Override
    public boolean isertarsalida(Salida salida) {
        boolean flat = false;
        Statement st = null;
        String idsalida = null;
        String query = "insert into Salida(idusuario)values('" + salida.getIdusuario() + "')";
        System.out.println(query);
        try {
            st = conectar().createStatement();
            st.executeUpdate(query);
            conectar().commit();
            conectar().close();
            flat = true;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                conectar().rollback();
                conectar().close();

            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public List<Producto_lab> listarproducto(String buscar) {
        List<Producto_lab> lista = new ArrayList<Producto_lab>();
        Producto_lab p = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.idproducto, p.nombreproducto||'  '||p.concentracion||' '|| um.unidadmedida as nombre, prll.stock as stock, p.precio_unitario,lab.idlaboratorio, lab.nombrelaboratorio as laboratorio, pr.nombrepresentacion as presentacion, l.fecha_vencimiento, l.idlote"
                + " from producto p, unidad_medida um, produc_lab_lote prll, laboratorio lab, lote l, presentacion pr"
                + " where p.idproducto=prll.idproducto and prll.idlote=l.idlote and prll.idlaboratorio=lab.idlaboratorio and prll.stock>=0"
                + " and um.id_unidadmedida=p.id_unidadmedida and pr.id_presentacion=p.id_presentacion "
                + " and p.nombreproducto like '%"+buscar+"%'";

        try {
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                p = new Producto_lab();
                p.setIdproducto(rs.getString("idproducto"));
                p.setNombreproducto(rs.getString("nombre"));
                p.setStock(rs.getString("stock"));
                p.setPrecio_unitario(rs.getString("precio_unitario"));
                p.setIdlaboratorio(rs.getString("idlaboratorio"));
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
    public boolean eliminarsalida(String idsalida, String idproducto, String idlaboratorio, String idlote) {
       boolean flat = false;
        Statement st = null;
        
        String query="delete from detalle_salida where idsalida='"+idsalida+"' and idproducto='"+idproducto+"' and idlaboratorio='"+idlaboratorio+"'" +
        "and idlote='"+idlote+"'";
        try {
            st = conectar().createStatement();
            st.executeUpdate(query);
            conectar().commit();
            conectar().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conectar().rollback();
                conectar().close();
            } catch (Exception ex) {
            }
        }
        return flat;}

    @Override
    public boolean modificarsalida(detalle_salida detalle) {
        boolean flat = false;
        Statement st = null;
        
        String query="update detalle_salida set cantidad_unidades='"+detalle.getCantidad_unidades()+"', precio_salida='"+detalle.getPrecio_salida()+"' "
                + "where idsalida='"+detalle.getIdsalida()+"' and idproducto='"+detalle.getIdproducto()+"'  and idlaboratorio='"+detalle.getIdlaboratorio()+"'and idlote='"+detalle.getIdlote()+"'";
        try {
            st = conectar().createStatement();
            st.executeUpdate(query);
            conectar().commit();
            conectar().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conectar().rollback();
                conectar().close();

            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public boolean isertardetsalida(detalle_salida dt) {
        boolean flat = false;
        Statement st = null;
        String query = "insert into detalle_salida values((select max(idsalida) from salida),'" + dt.getIdproducto() + "','"
                + dt.getIdlaboratorio() + "','" + dt.getIdlote() + "','" + dt.getCantidad_unidades()+ "','" +dt.getPrecio_salida() + "')";
        System.out.println(query);
        try {
            st = conectar().createStatement();
            st.executeUpdate(query);
            conectar().commit();
            conectar().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conectar().rollback();
                conectar().close();

            } catch (Exception ex) {
            }
        }
        return flat;
    }
@Override
    public boolean restastockdetsalida( String idsalida) {
        boolean flat = false;
        Statement st = null;
        
        String query="begin restarstock('"+idsalida+"'); end ;";
        try {
            st = conectar().createStatement();
            st.executeUpdate(query);
            conectar().commit();
            conectar().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conectar().rollback();
                conectar().close();

            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public List<detalle_salida> listardetalle() {
        List<detalle_salida> lista = new ArrayList<detalle_salida>();
        detalle_salida dt=null;
        Statement st = null;
        ResultSet rs = null;
        String query = " select p.nombreproducto, dt.cantidad_unidades, dt.precio_salida,dt.idsalida, dt.idproducto, dt.idlaboratorio,dt.idlote, sum(dt.cantidad_unidades*dt.precio_salida) as subtotal" +
" from producto p, detalle_salida dt  " +
"  where p.idproducto=dt.idproducto and dt.idsalida=(select max(idsalida) from salida) group by p.nombreproducto, dt.cantidad_unidades, dt.precio_salida,dt.idsalida, dt.idproducto, dt.idlaboratorio,dt.idlote";

        try {
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                dt= new detalle_salida();
                dt.setNombreproducto(rs.getString("nombreproducto"));
                dt.setCantidad_unidades(rs.getString("cantidad_unidades"));
                dt.setPrecio_salida(rs.getString("precio_salida"));
                dt.setIdsalida(rs.getString("idsalida"));
                dt.setIdproducto(rs.getString("idproducto"));
                dt.setIdlaboratorio(rs.getString("idlaboratorio"));
                dt.setIdlote(rs.getString("idlote"));
                dt.setSubtotal(rs.getString("subtotal"));
               
                lista.add(dt);
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
    public String idsalida() {
       String id=null;
        Statement st = null;
        ResultSet rs = null;
        String query = " select max(idsalida) as idsa from salida";

        try {
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            if(rs.next()){
               id=rs.getString("idsa");
            }
            conectar().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conectar().close();
            } catch (Exception ex) {
            }
        }
        return id;
    }

    @Override
    public List<detalle_salida> TotalSalida(String idsalida) {
           List<detalle_salida> pll = new ArrayList<detalle_salida>();
        detalle_salida lpr = null;
        Statement st = null;
        ResultSet rs = null;

        String query = "select sum(cantidad_unidades*precio_salida) from detalle_salida where idsalida='"+idsalida+"'";
        System.out.println("" + query);
        try {
            st = conectar().createStatement(); // 
            rs = st.executeQuery(query);
            while (rs.next()) {
                lpr = new detalle_salida();
                lpr.setTOTAL(rs.getString("total"));
                pll.add(lpr);

            }
            conectar().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conectar().close();
            } catch (Exception ex) {
            }
        }
        return pll;
    }
    
    
    
}
