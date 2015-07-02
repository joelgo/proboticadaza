/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.controlador.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import probotica.modelo.dao.SalidaDao;
import probotica.modelo.dao.impl.SalidaDaoImpl;
import probotica.modelo.entidad.Salida;

/**
 *
 * @author CARDENAS
 */
public class Salidaa extends HttpServlet {

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
 

        
        
        SalidaDao dao=new SalidaDaoImpl();
        Salida salida =new Salida();
        
        String action=request.getParameter("action");
        action=action==null?"": action;
        
        String idsalida=request.getParameter("idsalida");
        idsalida=idsalida==null?"": idsalida;
 
 
        
        String idusuario=request.getParameter("idusuario");
        idusuario=idusuario==null?"": idusuario;
  
            String mensaje = "";
            
        
        if(!idusuario.equals("")){
           
            salida.setIdusuario(idusuario);
            if(dao.isertarsalida(salida)){
                
             request.getRequestDispatcher("reg_salida.jsp").forward(request, response);           
            }else{
            mensaje="No se pudo registrar la salida";
            }
            
            
        }
        
       if(action.equals("sali")){ 
       request.getRequestDispatcher("salida.jsp").forward(request, response);    
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

  

