<%@page import="probotica.modelo.entidad.forma_pago"%>
<%@page import="probotica.modelo.entidad.TipoIngreso"%>
<%@page import="probotica.modelo.entidad.Comprobante"%>
<%@page import="probotica.modelo.entidad.Distribuidor"%>
<%@page import="probotica.modelo.entidad.Ingreso"%>
<%@page import="probotica.modelo.dao.IngresoDao"%>
<%@page import="probotica.modelo.dao.impl.IngresoDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<%
           HttpSession session1 = request.getSession();
           String idPedro = (String)session1.getAttribute("idusuario");
            

           IngresoDao dao = new IngresoDaoImpl();
            Ingreso ingreso=new Ingreso();
          
            String idtipoingreso = request.getParameter("idtipoingreso");
            idtipoingreso = idtipoingreso == null ? "" : idtipoingreso;
            out.println(idtipoingreso);
            String iddistribuidor = request.getParameter("iddistribuidor");
            iddistribuidor = iddistribuidor == null ? "" : iddistribuidor;
            out.println(iddistribuidor);
            
            String nombredistribuidor = request.getParameter("nombredistribuidor");
            nombredistribuidor = nombredistribuidor == null ? "" : nombredistribuidor;
            
            
            String iddocumento = request.getParameter("iddocumento");
            iddocumento = iddocumento == null ? "" : iddocumento;
            out.println(iddocumento);
           
            String codigo_com = request.getParameter("codigo_com");
            codigo_com = codigo_com == null ? "" : codigo_com;
            out.println(codigo_com);
            
            String porcentajeIGV = request.getParameter("porcentajeIGV");
            porcentajeIGV = porcentajeIGV == null ? "" : porcentajeIGV;
            out.println(porcentajeIGV);
            String id_formapago = request.getParameter("id_formapago");
            id_formapago = id_formapago == null ? "" : id_formapago;
            
            
            
            String estado = request.getParameter("estado");
            estado = estado == null ? "" : estado;
            out.println(estado);
            String mensaje = "";
            
     
            if(!idtipoingreso.equals("") & !iddistribuidor.equals("") & !iddocumento.equals("") & !codigo_com.equals("")  & !porcentajeIGV.equals("")){

                ingreso.setIdtipoingreso(idtipoingreso);
                ingreso.setIddistribuidor(iddistribuidor);
                ingreso.setIddocumento(iddocumento);
                ingreso.setCodigo_com(codigo_com);
                ingreso.setPorcentajeIGV(porcentajeIGV);
                ingreso.setEstado("1");
                ingreso.setIdusuario(idusuario);
                if (dao.InsertarIngreso(ingreso)) {
                    response.sendRedirect("reg_ingreso.jsp?codigo_com="+codigo_com);
                } else {
                    mensaje = "No se pudo Registrar el Ingreso.";
                    
                }
            }








%>


 <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 well">
<form action="ingreso.jsp " method="post" class="form-horizontal">
    <table class="table table-condensed">
        
         <td><label class="col-md-12">Distribuidor</label></td>
             <td> <select name="iddistribuidor" class="form-control" >
                           <%
                                for (Distribuidor distribuidor : dao.listardistribuidor()){
                                    
                           %>
                       <option value="<%=distribuidor.getIddistribuidor()%>"><%=distribuidor.getNombredistribuidor()%></option>
                      <%}%>
              </select> 
            </td>
            <tr>
            <td><label class="col-md-12">Comprobante</label></td>
            <td><select name="iddocumento" class="form-control" >
                           <%
                                for (Comprobante comprobante : dao.listarcomprobante()){
                                    
                           %>
                       <option value="<%=comprobante.getIddocumento()%>"><%=comprobante.getNomcomprobante()%></option>
                      <%}%>
              </select></td>
            </tr>
            <tr>
              <td><label class="col-md-12">Tipo de Ingreso</label></td>
              <td><select name="idtipoingreso" class="form-control" >
                           <%
                                for (TipoIngreso tipoingreso : dao.listartipoingreso()){
                                    
                           %>
                       <option value="<%=tipoingreso.getIdtipoingreso()%>"><%=tipoingreso.getNomtipoingreso()%></option>
                      <%}%>
              </select> 
            </td> 
            </tr>
        <tr>
            <td><label class="col-md-12">codigo_com</label></td>
            <td><input type="text" name="codigo_com" placeholder= "codigo comprobante" class="form-control" ></td>
        </tr>
        <tr>
            <td><label class="col-md-12">porcentajeIGV</label></td>
            <td><input type="text" name="porcentajeIGV" placeholder= "IGV" class="form-control" ></td>
        </tr>
        <tr>
            <td colspan="2"><label><%=mensaje%></label></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" class="btn btn-success col-md-3" value="Guardar"></td>
        </tr>
</table>
</form>
</div> 
<div class="col-xs-12 col-sm-3 col-md-3"></div>
</div>
</div>





<%@include file="WEB-INF/jspf/bottom.jspf"%>

