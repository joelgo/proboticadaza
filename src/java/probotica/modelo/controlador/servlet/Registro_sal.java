/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.controlador.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import probotica.modelo.dao.SalidaDao;
import probotica.modelo.dao.impl.SalidaDaoImpl;
import probotica.modelo.entidad.Producto_lab;
import probotica.modelo.entidad.detalle_salida;

/**
 *
 * @author CARDENAS
 */
@WebServlet(name = "Registro_sal", urlPatterns = {"/registro_sal"})
public class Registro_sal extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        SalidaDao salida = new SalidaDaoImpl();
        Producto_lab producto = new Producto_lab();

        String buscar = request.getParameter("buscar");
        buscar = buscar == null ? "" : buscar;
        
        String subtotal=request.getParameter("subtotal");
        subtotal=subtotal==null?"": subtotal;
        
        String agregar = request.getParameter("agregar");
        agregar = agregar == null ? "" : agregar;
        
        String opcion = request.getParameter("opcion");
        opcion = opcion == null ? "Buscar" : opcion;
        
        String opcion1 = request.getParameter("opcion1");
        opcion1 = opcion1 == null ? "" : opcion1;
        String idproducto = request.getParameter("idproducto");
        idproducto = idproducto == null ? "" : idproducto;
        String mensaje = "";
        String nombreproducto = request.getParameter("nombreproducto");
        nombreproducto = nombreproducto == null ? "" : nombreproducto;
        String presentacion = request.getParameter("presentacion");
        presentacion = presentacion == null ? "presentacion" : presentacion;
        String fecha_vencimiento = request.getParameter("fecha_vencimiento");
        fecha_vencimiento = fecha_vencimiento == null ? "fecha_vencimiento" : fecha_vencimiento;
        String laboratorio = request.getParameter("laboratorio");
        laboratorio = laboratorio == null ? "" : laboratorio;
        String precio_unitario = request.getParameter("precio_unitario");
        precio_unitario = precio_unitario == null ? "" : precio_unitario;
        String idlaboratorio = request.getParameter("idlaboratorio");
        idlaboratorio = idlaboratorio == null ? "" : idlaboratorio;
       
        String idlote = request.getParameter("idlote");
        idlote = idlote == null ? "" : idlote;
        
        String nombre = request.getParameter("nombreproducto");
        nombre = nombre == null ? "" : nombre;
        String lab = request.getParameter("laboratorio");
        lab = lab == null ? "" : lab;
        String lote = request.getParameter("lote");
        lote = lote == null ? "" : lote;
        String cantidad_unidades = request.getParameter("cantidad_unidades");
        cantidad_unidades = cantidad_unidades == null ? "" : cantidad_unidades;
        String precio = request.getParameter("precio_salida");
        precio = precio == null ? "" : precio;
        String stock = request.getParameter("stock");
        stock = stock == null ? "" : stock;
        String precio_salida = request.getParameter("precio_salida");
        precio_salida = precio_salida == null ? "" : precio_salida;
        
        String idsalida = request.getParameter("idsalida");
        idsalida = idsalida == null ? "" : idsalida;
       
        
        if(opcion.equals("SELECCIONAR")){
            
            request.setAttribute("nombreproducto",nombreproducto);
            request.setAttribute("idproducto",idproducto);
            request.setAttribute("idlaboratorio",idlaboratorio);
            request.setAttribute("precio_unitario", precio_unitario);
            request.setAttribute("idlote",idlote);
            request.setAttribute("subtotal", subtotal);
            request.setAttribute("opcion",opcion);
            request.getRequestDispatcher("reg_salida.jsp").forward(request, response);
        }
        
        if (opcion.equals("agregarsalida")) {
            
        if(!idproducto.equals("")&&!idlaboratorio.equals("")&&!idlote.equals("")){
             
            SalidaDao s = new SalidaDaoImpl();
            detalle_salida dt = new detalle_salida();
            
            dt.setIdproducto(idproducto);
            dt.setIdlaboratorio(idlaboratorio);
            dt.setIdlote(idlote);
            dt.setCantidad_unidades(cantidad_unidades);
            dt.setPrecio_salida(precio_salida);
            if(s.isertardetsalida(dt)){
             request.getRequestDispatcher("reg_salida.jsp").forward(request, response);
            } 
        }
        }
        
           SalidaDao s = new SalidaDaoImpl();
           
        if(opcion.equals("terminar")){
         
        
            if(s.restastockdetsalida(s.idsalida())){
                response.sendRedirect("bienvenido.jsp");
            
            } }
        if(opcion.equals("actualizar")){
         detalle_salida detalle = new detalle_salida();
         detalle.setIdsalida(idsalida);
         detalle.setIdproducto(idproducto);
         detalle.setIdlaboratorio(idlaboratorio);
         detalle.setIdlote(idlote);
         detalle.setCantidad_unidades(cantidad_unidades);
         detalle.setPrecio_salida(precio_salida);
        if(s.modificarsalida(detalle)){
         response.sendRedirect("reg_salida.jsp");}
            
          }
            
       
         SalidaDao sal = new SalidaDaoImpl();
            
         
         
             if(opcion.equals("eliminar")){
             if(sal.eliminarsalida(idsalida, idproducto, idlaboratorio, idlote)){
             mensaje="se elimino correctamente";
             }else{
             mensaje="No se elimino";
             }
             request.getRequestDispatcher("reg_salida.jsp").forward(request, response);
             }
             
            
        if(opcion.equals("modificar")){
            request.setAttribute("idsalida", idsalida);
            request.setAttribute("nombreproducto",nombreproducto);
            request.setAttribute("idproducto",idproducto);
            request.setAttribute("idlaboratorio",idlaboratorio);
            request.setAttribute("idlote",idlote);         
            request.setAttribute("precio_salida",precio_salida);
            request.setAttribute("cantidad_unidades",cantidad_unidades);
            request.setAttribute("opcion",opcion);
            request.getRequestDispatcher("reg_salida.jsp").forward(request, response);
        }  
             
        }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
