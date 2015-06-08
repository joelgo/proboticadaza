<%@page import="probotica.modelo.entidad.Laboratorio"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
 <body class="cuerpo">
        <h1>Lista de laboratorios</h1>
        <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <%
                        String opcion = request.getParameter("opcion");
                        opcion = opcion == null ? "" : opcion;
                        
                        

                        String idlaboratorio = request.getParameter("idlaboratorio");
                        idlaboratorio = idlaboratorio == null ? "" : idlaboratorio;
                        
                        out.println("idlaboratorio"+idlaboratorio);
                        
                        Laboratorio laboratorio = new Laboratorio();
                        laboratorio.setIdlaboratorio(idlaboratorio);
                        
                        if (opcion.equals("1")) {
                            ProboticaDao pdao = new ProboticaDaoImpl();
                              
                            if (pdao.eliminarLaboratorio(laboratorio)) {
                                out.println("Se eliminó saticfactoriamente");

                            } else {
                                out.println("ocurrio u error al eliminar");
                            }
                        }

                %>
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

                for (Laboratorio laboratorioo : dao.listarLaboratorio()) {
                    count++;
                   
                 %>
                <tr>
                  <td><%=count%>.-</td>
                  <td><%=laboratorioo.getNombrelaboratorio()%></td>
                  <td>[<a href="actu_laboratorio.jsp?idlaboratorio=<%=laboratorioo.getIdlaboratorio()%>">Actualizar</a>]</td>
                  <td>[<a href="rep_laboratorio.jsp?idlaboratorio=<%=laboratorioo.getIdlaboratorio()%>&opcion=1">Eliminar</a>]</td>
                </tr>
               <%}%>
              </tbody>
            </table>
     </nav>
        

<%@include file="WEB-INF/jspf/bottom.jspf"%>
