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
import probotica.modelo.dao.ReportesDao;
import probotica.modelo.entidad.Producto_lab;
import probotica.modelo.util.ConexionOracle;
import static probotica.modelo.util.ConexionOracle.conectar;

/**
 *
 * @author CARDENAS
 */
public class ReportesDaoImpl implements ReportesDao{
    
     public Connection conectar() {
        return ConexionOracle.conectar();

     }
    @Override
    public List<Producto_lab> listarsalidas(String fecha) {
        List<Producto_lab> lista = new ArrayList<Producto_lab>();
        Producto_lab p = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.nombreproducto| |' '| |p.concentracion| |''| |um.unidadmedida as nombreproducto, pr.nombrepresentacion, lab.nombrelaboratorio, " +
"       prll.idlote, dts.cantidad_unidades, dts.precio_salida " +
"  from producto p, presentacion pr, unidad_medida um, laboratorio lab, produc_lab_lote prll, detalle_salida dts, salida s, lote l " +
" where   p.id_presentacion=pr.id_presentacion" +
"	and p.id_unidadmedida=um.id_unidadmedida " +
"	and prll.idlaboratorio=lab.idlaboratorio" +
"	and prll.idlote=l.idlote" +
"	and prll.idproducto=p.idproducto" +
"	and dts.idlote=prll.idlote" +
"	and dts.idproducto=prll.idproducto" +
"	and dts.idlaboratorio=prll.idlaboratorio" +
"	and dts.idsalida=s.idsalida" +
"	and to_date(s.fecha_salida,'dd/mm/yy')=to_date('"+fecha+"','dd/mm/yy')";

        try {
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                p = new Producto_lab();
               
                p.setNombreproducto(rs.getString("nombreproducto"));
                p.setNombrepresentacion(rs.getString("nombrepresentacion"));
                p.setNombrelaboratorio(rs.getString("nombrelaboratorio"));
                p.setIdlote(rs.getString("idlote"));
                p.setCantidad_unidades(rs.getString("cantidad_unidades"));
                p.setPrecio_salida(rs.getString("precio_salida"));
                
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
    public List<Producto_lab> listarsalidasmensuales(String fecha_mensual) {
       List<Producto_lab> lista = new ArrayList<Producto_lab>();
        Producto_lab p = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.nombreproducto| |' '| |p.concentracion| |''| |um.unidadmedida as nombreproducto, pr.nombrepresentacion, lab.nombrelaboratorio, " +
"       prll.idlote, dts.cantidad_unidades, dts.precio_salida " +
" from producto p, presentacion pr, unidad_medida um, laboratorio lab, produc_lab_lote prll, detalle_salida dts, salida s, lote l " +
" where   p.id_presentacion=pr.id_presentacion" +
"	and p.id_unidadmedida=um.id_unidadmedida " +
"	and prll.idlaboratorio=lab.idlaboratorio " +
"	and prll.idlote=l.idlote " +
"	and prll.idproducto=p.idproducto " +
"	and dts.idlote=prll.idlote " +
"	and dts.idproducto=prll.idproducto " +
"	and dts.idlaboratorio=prll.idlaboratorio " +
"	and dts.idsalida=s.idsalida " +
"	and '"+fecha_mensual+"' in (select substr(s.fecha_salida,4,2) from salida)";

        try {
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                p = new Producto_lab();
               
                p.setNombreproducto(rs.getString("nombreproducto"));
                p.setNombrepresentacion(rs.getString("nombrepresentacion"));
                p.setNombrelaboratorio(rs.getString("nombrelaboratorio"));
                p.setIdlote(rs.getString("idlote"));
                p.setCantidad_unidades(rs.getString("cantidad_unidades"));
                p.setPrecio_salida(rs.getString("precio_salida"));
                
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
        return lista;}

    @Override
    public List<Producto_lab> listaringresos(String fecha_ingreso) {
         List<Producto_lab> lista = new ArrayList<Producto_lab>();
        Producto_lab p = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.nombreproducto| |' '| |p.concentracion| |''| |um.unidadmedida as nombreproducto, pr.nombrepresentacion, lab.nombrelaboratorio, " +
"       prll.idlote, dti.cantidad_unidades, dti.precio_ingreso " +
" from producto p, presentacion pr, unidad_medida um, laboratorio lab, produc_lab_lote prll, detalle_ingreso dti, ingreso i, lote l " +
" where   p.id_presentacion=pr.id_presentacion " +
"	and p.id_unidadmedida=um.id_unidadmedida  " +
"	and prll.idlaboratorio=lab.idlaboratorio " +
"	and prll.idlote=l.idlote " +
"	and prll.idproducto=p.idproducto " +
"	and dti.idlote=prll.idlote " +
"	and dti.idproducto=prll.idproducto " +
"	and dti.idlaboratorio=prll.idlaboratorio " +
"	and dti.idingreso=i.idingreso " +
"	and fecha_registro='"+fecha_ingreso+"'";

        try {
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                p = new Producto_lab();
               
                p.setNombreproducto(rs.getString("nombreproducto"));
                p.setNombrepresentacion(rs.getString("nombrepresentacion"));
                p.setNombrelaboratorio(rs.getString("nombrelaboratorio"));
                p.setIdlote(rs.getString("idlote"));
                p.setCantidad_unidades(rs.getString("cantidad_unidades"));
                p.setPrecio_ingreso(rs.getString("precio_ingreso"));
                
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
        return lista;}

    @Override
    public List<Producto_lab> listaringresosmensuales(String fecha_ingresmensual) {
        List<Producto_lab> lista = new ArrayList<Producto_lab>();
        Producto_lab p = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.nombreproducto| |' '| |p.concentracion| |''| |um.unidadmedida as nombreproducto, pr.nombrepresentacion, lab.nombrelaboratorio, " +
"       prll.idlote, dti.cantidad_unidades, dti.precio_ingreso " +
" from producto p, presentacion pr, unidad_medida um, laboratorio lab, produc_lab_lote prll, detalle_ingreso dti, ingreso i, lote l " +
" where   p.id_presentacion=pr.id_presentacion " +
"	and p.id_unidadmedida=um.id_unidadmedida " +
"	and prll.idlaboratorio=lab.idlaboratorio " +
"	and prll.idlote=l.idlote " +
"	and prll.idproducto=p.idproducto " +
"	and dti.idlote=prll.idlote " +
"	and dti.idproducto=prll.idproducto " +
"	and dti.idlaboratorio=prll.idlaboratorio " +
"	and dti.idingreso=i.idingreso " +
"	and '"+fecha_ingresmensual+"' in (SELECT SUBSTR(i.fecha_registro,4,8) from ingreso)";

        try {
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                p = new Producto_lab();
               
                p.setNombreproducto(rs.getString("nombreproducto"));
                p.setNombrepresentacion(rs.getString("nombrepresentacion"));
                p.setNombrelaboratorio(rs.getString("nombrelaboratorio"));
                p.setIdlote(rs.getString("idlote"));
                p.setCantidad_unidades(rs.getString("cantidad_unidades"));
                 p.setPrecio_ingreso(rs.getString("precio_ingreso"));
                
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
        return lista;}
}
    

