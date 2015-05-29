<%@page import="probotica.modelo.entidad.Laboratorio"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>


 <body class="cuerpo">
        <h1>Lista de Eventos</h1>
        <div class="table-responsive">
            <table class="table table-striped">
              <thead>
               <tr>
                  <th>Orden</th>
                  <th>Laboratorio</th>
                  <th>Actulizar</th>
                  <th>Eliminar</th>
               </tr>
              </thead>
              <tbody>
                  
                <%
                int count = 0;
                ProboticaDao dao = new ProboticaDaoImpl();

                for (Laboratorio laboratorio : dao.listarLaboratorio()) {
                    count++;
                    
                 %>
                <tr>
                  <td><%=count%>.-</td>
                  <td><%=laboratorio.getNombrelaboratorio()%></td>
                  <td>[<a href="">Actualizar</a>]</td>
                  <td>[<a href="inscripcion.jsp?">Eliminar</a>]</td>
                </tr>
               <%}%>
              </tbody>
            </table>
     </nav>
        

<%@include file="WEB-INF/jspf/bottom.jspf"%>
