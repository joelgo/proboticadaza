<%@page import="probotica.modelo.entidad.Producto"%>
<%@page import="probotica.modelo.entidad.Producto_lab"%>
<%@page import="probotica.modelo.dao.impl.ProductoDaoImpl"%>
<%@page import="probotica.modelo.dao.ProductoDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<%

ProductoDao dao = new ProductoDaoImpl();


String idproducto=request.getParameter("idproducto");
idproducto=idproducto==null? "" : idproducto;



String estado=request.getParameter("estado");
estado=estado==null? "" : estado;



String opcion=request.getParameter("opcion");
opcion=opcion==null?"": opcion;


String mensaje="";

if(opcion.equals("modes")){
    
 Producto producto= new Producto();
    producto.setEstado(estado);
    producto.setIdproducto(idproducto);
  if (dao.desactivarProducto(producto)) {
           response.sendRedirect("moddate.jsp");
           } else {
              mensaje = "No se pudo desactivar al producto";     
            }   
}


%>





<nav class="rep">
          <h2 >Reporte de Productos</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>   
                <tr>
                  <th>Orden</th>
                  <th>Nombre_Prodcuto</th>
                  <th>Presentacion</th>
                  <th>Precio_Unitario</th>
                  <th>Stock_Minimo</th>
                  <th>Categoria</th>
                  <th>Estado</th>
                  <th>Actualizar</th>
                  <th>Modificar_Estado</th>
                </tr>
              </thead>
              <tbody>
                             <%
                                    String espacio = "";
                                    int count = 0;
                                    

                                    for (Producto producto : dao.listProducto()) {     

                                        count++;

                                %>
               
                            <tr>      
                            <td><%=count%>.-</td> 
                            
                            <td ><%=producto.getNombreproducto()%> <%=producto.getConcentracion()%> <%=producto.getUnidadmedida()%></td>
                            <td ><%=producto.getPresentacion()%></td>
                            <td><%=producto.getPrecio_unitario()%></td>
                            <td ><%=producto.getStock_minimo()%></td>
                            <td ><%=producto.getNombrecategoria()%></td>
                            <td ><%=producto.getEstado()%></td>
                            
                            <td><a href="actu_producto.jsp?opcion=actualizar&idproducto=<%=producto.getIdproducto()%>&nombreproducto=<%=producto.getNombreproducto()%>&concentracion=<%=producto.getConcentracion()%>&precio_unitario=<%=producto.getPrecio_unitario()%>&Stock_minimo=<%=producto.getStock_minimo()%>&precio_unitario=<%=producto.getPrecio_unitario()%>">Actualizar</a></td>
                          
                            <td>[<a href="moddate.jsp?opcion=modes&idproducto=<%=producto.getIdproducto()%>&estado=0">Desactivar_Estado</a>] [<a href="moddate.jsp?opcion=modes&idproducto=<%=producto.getIdproducto()%>&estado=1">Activar_Estado</a>]</td>
                            <td>                      
                            </tr>

                           <%}%>
                
                
              </tbody>
            </table>
     </nav>



<%@include file="WEB-INF/jspf/bottom.jspf"%>
