<%@page import="probotica.modelo.entidad.Producto_lab"%>
<%@page import="probotica.modelo.dao.impl.SalidaDaoImpl"%>
<%@page import="probotica.modelo.dao.SalidaDao"%>
<%@page import="probotica.modelo.dao.impl.IngresoDaoImpl"%>
<%@page import="probotica.modelo.entidad.ProductoCatUnmPre"%>
<%@page import="probotica.modelo.dao.impl.ProductoDaoImpl"%>
<%@page import="probotica.modelo.dao.ProductoDao"%>
<%@page import="probotica.modelo.dao.ProductoDao"%>
<%@page import="probotica.modelo.entidad.Producto"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<nav class="rep">
          <h2 >Reporte de Productos</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>   
                <tr>
                  <th>Orden</th>
                  <th>Nombre_Prodcuto</th>
                  <th>Presentacion</th>
                  <th>Laboratorio</th>
                  <th>Stock_Actual</th>
                  <th>Precio Producto en soles</th>
                  <th>Lote</th>
                  <th>Fecha_Vencimiento</th>
                </tr>
              </thead>
              <tbody>
                             <%
                                    String espacio = "";
                                    int count = 0;
                                    ProductoDao dao = new ProductoDaoImpl();

                                    for (Producto_lab producto1 : dao.listarProducto()) {

                                        count++;

                                %>


                                <tr>      
                            <td><%=count%>.-</td> 
                            <td><%=producto1.getNombreproducto()%></td>
                            <td align="center"><%=producto1.getNombrepresentacion()%></td>
                            <td align="center"><%=producto1.getNombrelaboratorio()%></td>
                            <td align="center"><%=producto1.getStock()%></td>
                            <td align="center"><%=producto1.getPrecio_unitario()%></td>
                            <td align="center"><%=producto1.getIdlote()%></td>
                            <td align="center"><%=producto1.getFecha_vencimiento()%></td>

                            <td>
                                                    
                                </tr>

                                <%}%>
                
                
              </tbody>
            </table>
     </nav>



<%@include file="WEB-INF/jspf/bottom.jspf"%>