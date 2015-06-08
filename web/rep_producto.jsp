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
                  <th>Concentracion</th>
                  <th>Presentación</th>
                  <th>Categoría</th>
                  <th>Precio Producto en soles</th>
                  <th>Stock Minimo</th>
                  <th>Stock Actual</th>
                </tr>
              </thead>
              <tbody>
               <%
           
                        
                int count = 0;
                ProductoDao dao = new ProductoDaoImpl();
                for (ProductoCatUnmPre producto : dao.listarProdCatUniPresen()) {
                    count++;
                 
               %>
                <tr>
                  <td><%=count%>.-</td>
                  <td><%=producto.getNombreproducto()%></td>
                  <td><%=producto.getConcentracion()%><%=producto.getUnidadmedida()%></td>
                  <td><%= producto.getNombrepresentacion()%></td>
                  <td><%=producto.getNombrecategoria()%></td>
                  <td><%=producto.getPrecio_unitario()%></td>
                  <td><%=producto.getStock_minimo()%></td>
                  <td>[<a href="">Actualizar</a>]</td>
                  <td>[<a href="inscripcion.jsp?">Eliminar</a>]</td>
                </tr>
               <%}%>
                <tr>
                  <td>1,001</td>
                  <td>Juan</td>
                  <td>Bustamante</td>
                  <td>Sanches</td>
                  <td>M</td>
                  <td>71269099</td>
                  <td>943923442</td>
                  <td>Av. Perú 118</td>
                </tr>
                
              </tbody>
            </table>
     </nav>



<%@include file="WEB-INF/jspf/bottom.jspf"%>