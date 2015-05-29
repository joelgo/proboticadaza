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
                  <th>nombre</th>
                  <th>apellido_paterno</th>
                  <th>apellido_materno</th>
                  <th>Genero</th>
                  <th>dni</th>
                  <th>dirección</th>
                </tr>
              </thead>
              <tbody>
               <%
                int count = 0;
                ProboticaDao dao = new ProboticaDaoImpl();
                for (Producto producto : dao.) {
                    count++;
               
                 %>
                <tr>
                  <td><%=count%>.-</td>
                  <td><%=%></td>
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