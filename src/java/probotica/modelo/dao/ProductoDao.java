/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.dao;

import java.sql.ResultSet;
import java.util.List;
import probotica.modelo.entidad.Categoria;
import probotica.modelo.entidad.Laboratorio;
import probotica.modelo.entidad.Presentacion;
import probotica.modelo.entidad.Producto;
import probotica.modelo.entidad.ProductoCatUnmPre;
import probotica.modelo.entidad.Producto_lab;
import probotica.modelo.entidad.UnidadMedida;
import probotica.modelo.entidad.listproing;

/**
 *
 * @author USUARIO
 */
 public interface ProductoDao {
 public boolean registarProducto(Producto producto);
 public List<Categoria> listarCategoria();
 public List<UnidadMedida> listarUnidadMedida();
 public List<Presentacion> listarPresentacion();
 public boolean modificarLaboratorio(Laboratorio laboratorio);
 public List<ProductoCatUnmPre> listarProdCatUniPresen();
 public boolean desactivarProducto(Producto producto);
 public boolean actualizarProducto(Producto producto);
public List<Producto_lab> listarProducto();
 public List<Producto> listProducto();
public boolean reglaboratori(Laboratorio laboratorio1);


}

