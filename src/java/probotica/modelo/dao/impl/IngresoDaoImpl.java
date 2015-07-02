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
import probotica.modelo.dao.IngresoDao;
import probotica.modelo.entidad.Categoria;
import probotica.modelo.entidad.Comprobante;
import probotica.modelo.entidad.Detalle_Ingreso;
import probotica.modelo.entidad.Distribuidor;
import probotica.modelo.entidad.Ingreso;
import probotica.modelo.entidad.Laboratorio;
import probotica.modelo.entidad.Lote;
import probotica.modelo.entidad.Producto;
import probotica.modelo.entidad.ProductoCatUnmPre;
import probotica.modelo.entidad.TipoIngreso;
import probotica.modelo.entidad.forma_pago;
import probotica.modelo.entidad.listproing;
import probotica.modelo.entidad.produc_lab_lote;
import probotica.modelo.util.ConexionOracle;
import probotica.modelo.util.HibernateUtil;

/**
 *
 * @author USUARIO
 */
public class IngresoDaoImpl implements IngresoDao {

    public Connection conecta() {
        return ConexionOracle.conectar();
    }

    @Override
    public boolean InsertarIngreso(Ingreso ingreso) {
        boolean flat = false;
        Statement st = null;
        String idingreso = null;
        String query1 = "insert into ingreso(idtipoingreso,iddistribuidor,iddocumento,codigo_com,"
                + "porcentajeIGV,estado,idusuario,fecha_registro)"
                + "values('" + ingreso.getIdtipoingreso() + "','" + ingreso.getIddistribuidor() + "','"
                + ingreso.getIddocumento() + "','" + ingreso.getCodigo_com() + "','"
                + ingreso.getPorcentajeIGV() + "','"
                + ingreso.getEstado() + "','" + ingreso.getIdusuario() + "',to_char(sysdate,'dd/mm/yyyy'))";
          //String query3="select idingreso from ingreso where codigo_com='"+ingreso.getCodigo_com()+"'";

        //String query2= "insert into produc_lab_lote(idproducto,lote,fecha_vencimiento,idlaboratorio,estado)values('"+Produc_Lab_Lote.getIdproducto()+"','"+Produc_Lab_Lote.getLote()+"','"+Produc_Lab_Lote.getFecha_vencimiento()+"','"+Produc_Lab_Lote.getIdlaboratorio()+"','"+Produc_Lab_Lote.getEstado()+"')";
        System.out.println(query1);
        try {
            st = conecta().createStatement();
            st.executeUpdate(query1);
            conecta().commit();
            conecta().close();
            flat = true;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();
                conecta().close();
            } catch (Exception ex) {
            }
        }

        return flat;
    }

    @Override
    public boolean InsertarIngresoDetalle(Detalle_Ingreso detalle_ingreso) {
        return false;

    }

    @Override
    public List<ProductoCatUnmPre> listarproductobuscado(String buscar) {
        List<ProductoCatUnmPre> lista = new ArrayList<ProductoCatUnmPre>();
        ProductoCatUnmPre c = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.idproducto, p.nombreproducto||'  '||p.concentracion||' '||unm.unidadmedida as nombreproductoo,pr.nombrepresentacion, "
                + "cat.nombrecategoria, p.precio_unitario, p.composicion, p.Stock_minimo, p.estado "
                + "from producto p, categoria cat, unidad_medida unm, presentacion pr "
                + "where p.idcategoria=cat.idcategoria and p.id_presentacion=pr.id_presentacion and "
                + "p.id_unidadmedida=unm.id_unidadmedida and p.estado='1'" + " and upper(p.nombreproducto) like upper(('%" + buscar + "%'))" + "and "
                + "rownum <=5";
//select distinct u.id_unidad, (select abreviatura from unidad where id_unidad = (u.id_unidad)) as fac from unidad_evento ue, unidad u where ue.id_evento = '"+idEvento+"' and ue.id_unidad = u.id_unidad order by u.id_unidad
        try {
            st = conecta().createStatement(); // 
            rs = st.executeQuery(query);
            while (rs.next()) {
                c = new ProductoCatUnmPre();
                c.setIdproducto(rs.getString("idproducto"));
                c.setNombreproducto(rs.getString("nombreproductoo"));
                c.setNombrepresentacion(rs.getString("nombrepresentacion"));
                c.setNombrecategoria(rs.getString("nombrecategoria"));
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
    public List<Distribuidor> listardistribuidor() {
        List<Distribuidor> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Distribuidor>();
            Query query = session.createQuery("FROM Distribuidor");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public List<TipoIngreso> listartipoingreso() {
        List<TipoIngreso> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<TipoIngreso>();
            Query query = session.createQuery("FROM TipoIngreso");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public List<Comprobante> listarcomprobante() {
        List<Comprobante> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Comprobante>();
            Query query = session.createQuery("FROM Comprobante");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public List<forma_pago> listarFormaPago() {
        List<forma_pago> lista = new ArrayList<forma_pago>();
        forma_pago c = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select f.id_formapago, f.formapago from forma_pago f";

        try {
            st = conecta().createStatement(); // 
            rs = st.executeQuery(query);
            while (rs.next()) {
                c = new forma_pago();
                c.setId_formapago(rs.getString("id_formapago"));
                c.setFormapago(rs.getString("formapago"));
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
    public Ingreso buscaringreso(String codigo_com) {
        Ingreso c = null;
        Statement st = null;
        ResultSet rs = null;

        String query = "select i.idingreso, i.codigo_com, i.porcentajeIGV, i.fecha_registro, ti.nomtipoingreso,d.nombredistribuidor, c.nomcomprobante\n"
                + "from  ingreso i, tipo_ingreso ti, distribuidor d, comprobante c\n"
                + "where i.idtipoingreso=ti.idtipoingreso \n" + "and i.iddistribuidor=d.iddistribuidor \n"
                + "and i.iddocumento=c.iddocumento \n" + " and i.codigo_com='" + codigo_com + "'";
        System.out.println("" + query);
        try {
            st = conecta().createStatement(); // 
            rs = st.executeQuery(query);
            while (rs.next()) {
                c = new Ingreso();
                c.setIdingreso(rs.getString("idingreso"));
                c.setNombredistribuidor(rs.getString("nombredistribuidor"));
                c.setNomtipoingreso(rs.getString("nomtipoingreso"));
                c.setNomcomprobante(rs.getString("nomcomprobante"));
                c.setCodigo_com(rs.getString("codigo_com"));
                c.setPorcentajeIGV(rs.getString("porcantajeIGV"));
                c.setFecha_registro(rs.getString("fecha_registro"));
                c.setIdusuario(rs.getString("idusuario"));

            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return c;

    }

    @Override
    public List<Laboratorio> listarLaboratorio() {
        List<Laboratorio> lista = null;
        SessionFactory sf = null; // hibernate
        Session session = null;

        try {
            sf = HibernateUtil.getSessionFactory();// se llama a la variable util hibernal para conectarse con hibernate
            session = sf.openSession();
            lista = new ArrayList<Laboratorio>();
            Query query = session.createQuery("from Laboratorio"); // similar al selectttt 
            lista = query.list();// llenamos la lista
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public int buscarLote(String lot) {
        int l = 0;
        Statement st = null;
        ResultSet rs = null;

        String query = "select count(idlote) id from  lote where idlote='" + lot + "'";
        System.out.println("" + query);
        try {
            st = conecta().createStatement(); // 
            rs = st.executeQuery(query);
            if (rs.next()) {

                l = rs.getInt("id");
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return l;
    }

    @Override
    public boolean InsertLote(Lote lote) {
        boolean flat = false;
        Statement st = null;
        String idingreso = null;
        String query1 = "insert into lote(idlote,lotes,fecha_vencimiento"
                + "values('" + lote.getIdlote() + "','" + lote.getIdlote() + "','" + lote.getFecha_vencimiento() + "')";
          //String query3="select idingreso from ingreso where codigo_com='"+ingreso.getCodigo_com()+"'";

        //String query2= "insert into produc_lab_lote(idproducto,lote,fecha_vencimiento,idlaboratorio,estado)values('"+Produc_Lab_Lote.getIdproducto()+"','"+Produc_Lab_Lote.getLote()+"','"+Produc_Lab_Lote.getFecha_vencimiento()+"','"+Produc_Lab_Lote.getIdlaboratorio()+"','"+Produc_Lab_Lote.getEstado()+"')";
        System.out.println(query1);
        try {
            st = conecta().createStatement();
            st.executeUpdate(query1);
            conecta().commit();
            conecta().close();
            flat = true;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();
                conecta().close();
            } catch (Exception ex) {
            }
        }

        return flat;
    }

    @Override
    public produc_lab_lote buscarproductolablote(String lot, String pro, String lab) {
        produc_lab_lote pll = null;
        Statement st = null;
        ResultSet rs = null;

        String query = "select idlote,idproducto,idlaboratorio"
                + "from  produc_lab_lote "
                + "where idlote='" + lot + "' and idlote='" + pro + "' and idlote='" + lab + "'";
        System.out.println("" + query);
        try {
            st = conecta().createStatement(); // 
            rs = st.executeQuery(query);
            while (rs.next()) {
                pll = new produc_lab_lote();
                pll.setIdlote(rs.getString("idlote"));
                pll.setIdproducto(rs.getString("idproducto"));
                pll.setIdlaboratorio(rs.getString("idlaboratorio"));
                pll.setStock(rs.getString("pro"));
                pll.setEstado(rs.getString("lab"));

            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return pll;
    }

    @Override
    public boolean insertarcompra(String idlot, String idlaboratorio, String idproducto, String precioingreso, String cantidadunidades, String descuento, String idingreso, String fecha_vencimiento) {
        Statement st = null;
        boolean flat = false;
        String query = "BEGIN ingcomp('" + idlot + "','" + idlaboratorio + "','" + idproducto + "','" + precioingreso + "','" + cantidadunidades + "','" + descuento + "','" + idingreso + "','" + fecha_vencimiento + "'); END; ";
        System.out.println(query);
        //String idlot, String idlab, String idpro, String pre, String can, String des, String iding, String fechas
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
    public List<listproing> listarproductosing(String idingreso) {
        List<listproing> lista = new ArrayList<listproing>();
        listproing lpd = null;
        Statement st = null;
        ResultSet rs = null;
        String query = " SELECT p.idproducto, nombreproducto||' '||concentracion||' '||unidadmedida AS nombre, nombrepresentacion as presentacion,lab.idlaboratorio,lab.nombrelaboratorio, \n"
                + "lo.idlote, lo.lotes,lo.fecha_vencimiento,dti.cantidad_unidades,dti.precio_ingreso,dti.descuento, SUM(dti.cantidad_unidades*dti.precio_ingreso-dti.descuento) AS subtotal \n"
                + "FROM  PRODUCTO p,UNIDAD_MEDIDA unm,PRESENTACION pre, LABORATORIO lab,LOTE lo,PRODUC_LAB_LOTE pll,DETALLE_INGRESO dti \n"
                + "WHERE p.id_unidadmedida=unm.id_unidadmedida AND p.id_presentacion=pre.id_presentacion AND lab.idlaboratorio=pll.idlaboratorio \n"
                + "AND pll.idproducto=p.idproducto AND pll.idlote=lo.idlote AND dti.idingreso='" + idingreso + "' AND dti.idlote=pll.idlote AND dti.idlaboratorio=pll.idlaboratorio \n"
                + "AND dti.idproducto=pll.idproducto "
                + " GROUP BY   p.idproducto,nombreproducto||' '||concentracion||' '||unidadmedida,nombrepresentacion,"
                + "lab.idlaboratorio,lab.nombrelaboratorio, lo.idlote, lo.lotes,lo.fecha_vencimiento,dti.cantidad_unidades,dti.precio_ingreso,dti.descuento ";

        System.out.println(query);

        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                lpd = new listproing();
                lpd.setIdproducto(rs.getString("idproducto"));
                lpd.setNombreproducto(rs.getString("nombre"));
                lpd.setNombrepresentacion(rs.getString("presentacion"));
                lpd.setIdlaboratorio(rs.getString("idlaboratorio"));
                lpd.setNombrelaboratorio(rs.getString("nombrelaboratorio"));
                lpd.setIdlote(rs.getString("idlote"));
                lpd.setFecha_vencimiento(rs.getString("fecha_vencimiento"));
                lpd.setCantidad_unidades(rs.getString("cantidad_unidades"));
                lpd.setPrecio_ingreso(rs.getString("precio_ingreso"));
                lpd.setDescuento(rs.getString("descuento"));
                lpd.setSubtotal(rs.getString("subtotal"));
                lista.add(lpd);
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
    public boolean actuIngreso(String idlot, String idlaboratorio, String idproducto, String precioingreso, String cantidadunidades, String descuento, String idingreso, String fecha_vencimiento) {
        Statement st = null;
        boolean flat = false;
        String query = "BEGIN Actualizaring('" + idlot + "','" + idlaboratorio + "','" + idproducto + "','" + precioingreso + "','" + cantidadunidades + "','" + descuento + "','" + idingreso + "','" + fecha_vencimiento + "');END;";
        System.out.println(query);
        //String idlot, String idlab, String idpro, String pre, String can, String des, String iding, String fechas
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
    public boolean EliminarIng(String idlot, String idlaboratorio, String idproducto, String idingreso) {
        Statement st = null;
        boolean flat = false;
        // begin eliminaring('po0987','LAB-0001','Prod-0706201520375335','ING-1706201508050615'); end;
        String query = "BEGIN eliminaring('" + idlot + "','" + idlaboratorio + "','" + idproducto + "','" + idingreso + "');END;";
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
    public List<listproing> TotalIngreso(String idingreso) {
        List<listproing> pll = new ArrayList<listproing>();
        listproing lpr = null;
        Statement st = null;
        ResultSet rs = null;

        String query = "select sum(cantidad_unidades*precio_ingreso) as total from detalle_ingreso where idingreso='" + idingreso + "'";
        System.out.println("" + query);
        try {
            st = conecta().createStatement(); // 
            rs = st.executeQuery(query);
            while (rs.next()) {
                lpr = new listproing();
                lpr.setTOTAL(rs.getString("total"));
                pll.add(lpr);

            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return pll;
    }

}
