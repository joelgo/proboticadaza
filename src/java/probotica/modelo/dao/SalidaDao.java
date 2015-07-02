/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.dao;

import java.util.List;
import probotica.modelo.entidad.Producto;
import probotica.modelo.entidad.Producto_lab;
import probotica.modelo.entidad.Salida;
import probotica.modelo.entidad.detalle_salida;

/**
 *
 * @author Leidy
 */
public interface SalidaDao {
    public boolean isertarsalida(Salida salida);
    public boolean isertardetsalida(detalle_salida dt);
    public List<Producto_lab> listarproducto(String buscar);
    public boolean eliminarsalida(String idsalida, String idproducto, String idlaboratorio, String idlote);
    public boolean modificarsalida(detalle_salida detalle);
   public boolean restastockdetsalida( String idsalida);
   public List<detalle_salida> listardetalle();
   public String idsalida();
    public List<detalle_salida> TotalSalida(String idingreso);
    
}