/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.dao;

import java.util.List;
import probotica.modelo.entidad.Comprobante;
import probotica.modelo.entidad.Detalle_Ingreso;
import probotica.modelo.entidad.Distribuidor;
import probotica.modelo.entidad.Ingreso;
import probotica.modelo.entidad.Laboratorio;
import probotica.modelo.entidad.Producto;
import probotica.modelo.entidad.ProductoCatUnmPre;
import probotica.modelo.entidad.TipoIngreso;
import probotica.modelo.entidad.forma_pago;
import probotica.modelo.entidad.produc_lab_lote;

/**
 *
 * @author USUARIO
 */
public interface IngresoDao {
  public boolean InsertarIngreso(Ingreso ingreso);
  public boolean InsertarIngresoDetalle(Detalle_Ingreso detalle_ingreso);
  public List<ProductoCatUnmPre> listarproductobuscado(String buscar);
  public List<Distribuidor> listardistribuidor();
  public List<TipoIngreso>listartipoingreso();
  public List<Comprobante> listarcomprobante();
  public List<forma_pago> listarFormaPago();
  public Ingreso buscaringreso(String codigo_com);
  public List<Laboratorio> listarLaboratorio();
}
