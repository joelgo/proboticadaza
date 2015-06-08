/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.dao;

import java.util.List;
import probotica.modelo.entidad.Categoria;
import probotica.modelo.entidad.Comprobante;
import probotica.modelo.entidad.Distribuidor;
import probotica.modelo.entidad.Laboratorio;
import probotica.modelo.entidad.Persona;
import probotica.modelo.entidad.Presentacion;
import probotica.modelo.entidad.Producto;
import probotica.modelo.entidad.UnidadMedida;
import probotica.modelo.entidad.Usuario;

/**
 *
 * @author USUARIO
 */
public interface ProboticaDao {
 public boolean registarPersona(Persona persona);
 public boolean registrarDistribuidor(Distribuidor distribuidor);
 public List<Categoria> listarCategoria();
 public List<Comprobante> listarComprobante();
 public List<Distribuidor> listarDistribuidor();
 public List<Laboratorio> listarLaboratorio();
 public List<UnidadMedida> listarUnidadMedida();
 public boolean registrarProducto(Producto producto);
 public List<Presentacion> listarPresentacion();
 public Persona buscarPersona(String dni);
 public boolean registrarUsuario(Usuario usuario);
 public List<Persona> listarPersona();
 public List<Producto> listarproducto();
 public boolean eliminarLaboratorio(Laboratorio laboratorio);
 public Producto buscarproducto(String idproducto);
 public boolean actualizarLaboratorio(Laboratorio laboratorio);
 
}
