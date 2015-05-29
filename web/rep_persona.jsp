<%@page import="probotica.modelo.entidad.PersonaUsuario"%>
<%@page import="probotica.modelo.entidad.Persona"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

   <%
                 
             String idEvento = request.getParameter("idEvento");
             idEvento = idEvento == null ? "" : idEvento;
             
          
          
            %>
           

<nav class="rep">
          <h2 >Reporte de Personas y sus usuarios</h2>
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

                for (PersonaUsuario personausuario : dao.listarPersona(persona)) {
                    count++;
                    
                 %>
                <tr>
                  <td><%=count%>.-</td>
                  <td><%=laboratorio.getNombrelaboratorio()%></td>
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
                <tr>
                  <td>1,002</td>
                  <td>amet</td>
                  <td>consectetur</td>
                  <td>adipiscing</td>
                  <td>M</td>
                  <td>elit</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>Integer</td>
                  <td>nec</td>
                  <td>odio</td>
                  <td>M</td>
                  <td>Praesent</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>libero</td>
                  <td>Sed</td>
                  <td>cursus</td>
                  <td>M</td>
                  <td>ante</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,004</td>
                  <td>dapibus</td>
                  <td>diam</td>
                  <td>Sed</td>
                  <td>M</td>
                  <td>nisi</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,005</td>
                  <td>Nulla</td>
                  <td>quis</td>
                  <td>sem</td>
                  <td>M</td>
                  <td>at</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,006</td>
                  <td>nibh</td>
                  <td>elementum</td>
                  <td>imperdiet</td>
                  <td>M</td>
                  <td>Duis</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,007</td>
                  <td>sagittis</td>
                  <td>ipsum</td>
                  <td>Praesent</td>
                  <td>M</td>
                  <td>mauris</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,008</td>
                  <td>Fusce</td>
                  <td>nec</td>
                  <td>tellus</td>
                  <td>M</td>
                  <td>sed</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,009</td>
                  <td>augue</td>
                  <td>semper</td>
                  <td>porta</td>
                  <td>M</td>
                  <td>Mauris</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,010</td>
                  <td>massa</td>
                  <td>Vestibulum</td>
                  <td>lacinia</td>
                  <td>M</td>
                  <td>arcu</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,011</td>
                  <td>eget</td>
                  <td>nulla</td>
                  <td>Class</td>
                  <td>M</td>
                  <td>aptent</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,012</td>
                  <td>taciti</td>
                  <td>sociosqu</td>
                  <td>ad</td>
                  <td>M</td>
                  <td>litora</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,013</td>
                  <td>torquent</td>
                  <td>per</td>
                  <td>conubia</td>
                  <td>M</td>
                  <td>nostra</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,014</td>
                  <td>per</td>
                  <td>inceptos</td>
                  <td>himenaeos</td>
                  <td>M</td>
                  <td>Curabitur</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,015</td>
                  <td>sodales</td>
                  <td>ligula</td>
                  <td>in</td>
                  <td>M</td>
                  <td>libero</td>
                  <td>elit</td>
                  <td>elit</td>
                </tr>
              </tbody>
            </table>
          
    
     </nav>

<%@include file="WEB-INF/jspf/bottom.jspf"%>