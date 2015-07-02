/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.dao;

import java.util.List;
import probotica.modelo.entidad.Producto_lab;

/**
 *
 * @author USUARIO
 */
public interface ReportesDao {
    public List<Producto_lab> listarsalidas(String fecha);
    public List<Producto_lab> listarsalidasmensuales(String fecha_mensual);
    public List<Producto_lab> listaringresos(String fecha_ingreso);
    public List<Producto_lab> listaringresosmensuales(String fecha_ingresmensual);
}
