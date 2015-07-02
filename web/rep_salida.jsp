<%@page import="probotica.modelo.dao.impl.ReportesDaoImpl"%>
<%@page import="probotica.modelo.dao.ReportesDao"%>
<%@page import="probotica.modelo.entidad.Producto_lab"%>
<%@page import="probotica.modelo.dao.SalidaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<div class="container">
<%
 Producto_lab producto = new Producto_lab();
ReportesDao re= new ReportesDaoImpl();
         
         String reportes=request.getParameter("reportes");
         reportes=reportes==null?"": reportes;
         
         String idproducto=request.getParameter("idproducto");
         idproducto=idproducto==null?"": idproducto;
  String nombreproducto = request.getParameter("nombreproducto");
        nombreproducto = nombreproducto == null ? "" : nombreproducto;
  String presentacion = request.getParameter("presentacion");
        presentacion = presentacion == null ? "" : presentacion;
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
  String cantidad_unidades=request.getParameter("cantidad_unidades");
        cantidad_unidades=cantidad_unidades==null?"": cantidad_unidades;
  String precio_salida=request.getParameter("precio_salida");
         precio_salida=precio_salida==null?"": precio_salida;
  String fecha=request.getParameter("fecha");
         fecha=fecha==null?"": fecha;
  String idsalida=request.getParameter("idsalida");
         idsalida=idsalida==null?"": idsalida;
  String fecha_salida=request.getParameter("fecha_salida");
         fecha_salida=fecha_salida==null?"": fecha_salida;
  String fecha_registro=request.getParameter("fecha_registro");
         fecha_registro=fecha_registro==null?"": fecha_registro;
         String precio_ingreso=request.getParameter("precio_ingreso");
         precio_ingreso=precio_ingreso==null?"": precio_ingreso;
         
         
%> 

<form method="post" action="rep_salida.jsp">
 <div class="form-group">
      <label >seleccionar reporte</label>
      <select name="reportes" class="form-control" onchange="submit()">
          <option>selecionar</option>
          <option value="rep_id">reporte de ingresos diarios</option>
        <option value="rep_im">reporte de ingresos mensual</option>
         <option value="rep_sd">reporte de salidas diarias</option>
         <option value="rep_sm">reporte de salidas mensual</option>
      </select>
    </div>
</form>
<%
if(reportes.equals("rep_sd")){
%>
 <div class="row">   
  <nav class="col-md-12">
          <h2>Reporte de Salidas diarias</h2>
          <form class="form-horizontal" action="rep_salida.jsp" method="post">
            <table class="table table-striped">
                 <input type="hidden" value="<%=reportes%>" name="reportes"> 
                <input type="text" name="fecha_salida" onchange="submit()">
                
                
                <%
                if(!fecha_salida.equals("")){
                %>
              <thead>   
                <tr>
                  <th   bgcolor="#FFEFCE">N°</th>
                  <th   bgcolor="#FFEFCE">Nombre Producto</th>
                  <th   bgcolor="#FFEFCE">Presentacion</th>
                  <th   bgcolor="#FFEFCE">Laboratorio</th>
                  <th   bgcolor="#FFEFCE">lote</th>
                  <th   bgcolor="#FFEFCE">Precio de salida</th>
                  <th   bgcolor="#FFEFCE">cantidad_unidades</th>
                </tr>
              </thead>
              <tbody>
               <%    
                           int u=0;
                           for(Producto_lab p :re.listarsalidas(fecha_salida)){
                               u++;        
                  %>
                <tr>
                   
                  <td><%=u%>.-</td>
                  <td><%=p.getNombreproducto()%></td>
                  <td><%= p.getNombrepresentacion()%></td>
                  <td><%=p.getNombrelaboratorio()%></td>
                    <td><%=p.getIdlote()%></td>
                  <td><%=p.getPrecio_salida()%></td>
                   <td><%=p.getCantidad_unidades()%></td>
                </tr>
               <%}}%>
              </tbody>
            </table>
              </form>
     </nav>
 </div>
              <%}%>
              
<%
if(reportes.equals("rep_sm")){
%>      
<div class="row">   
  <nav class="col-md-12">
          <h2>Reporte de Salidas mensual</h2>
          <form class="form-horizontal" action="rep_salida.jsp" method="post">
            <table class="table table-striped">
                <input type="text" name="fecha_salida"  onchange="submit()">
                <input type="hidden" value="<%=reportes%>" name="reportes">
                <%
                if(!fecha_salida.equals("")){
                %>
              <thead>   
                <tr>
                  <th   bgcolor="#FFEFCE">N°</th>
                  <th   bgcolor="#FFEFCE">Nombre Prodcuto</th>
                  <th   bgcolor="#FFEFCE">Presentacion</th>
                  <th   bgcolor="#FFEFCE">Laboratorio</th>
                  <th   bgcolor="#FFEFCE">lote</th>
                  <th   bgcolor="#FFEFCE">Precio de salida</th>
                  <th   bgcolor="#FFEFCE">cantidad_unidades</th>
                </tr>
              </thead>
              <tbody>
               <%    
                           int u=0;
                           for(Producto_lab p:re.listarsalidasmensuales(fecha_salida)){
                               u++;        
%>
                <tr>
                   
                  <td><%=u%>.-</td>
                  <td><%=p.getNombreproducto()%></td>
                  <td><%= p.getNombrepresentacion()%></td>
                  <td><%=p.getNombrelaboratorio()%></td>
                    <td><%=p.getIdlote()%></td>
                  <td><%=p.getPrecio_salida()%></td>
                   <td><%=p.getCantidad_unidades()%></td>
                </tr>
               <%}}%>
              </tbody>
            </table>
              </form>
     </nav>
 </div>
              <%}%>
    
              <%
if(reportes.equals("rep_id")){
%>   
      <div class="row">   
  <nav class="col-md-12">
          <h2>Reporte de ingresos diario</h2>
          <form class="form-horizontal" action="rep_salida.jsp" method="post">
            <table class="table table-striped">
                <input type="text"   name="fecha_registro" onchange="submit()">
                <input type="hidden" value="<%=reportes%>" name="reportes">
                <%
                if(!fecha_registro.equals("")){
                %>
              <thead>   
                <tr>
                  <th   bgcolor="#FFEFCE">N°</th>
                  <th   bgcolor="#FFEFCE">Nombre Prodcuto</th>
                  <th   bgcolor="#FFEFCE">Presentacion</th>
                  <th   bgcolor="#FFEFCE">Laboratorio</th>
                  <th   bgcolor="#FFEFCE">lote</th>
                  <th   bgcolor="#FFEFCE">Precio de ingreso</th>
                  <th   bgcolor="#FFEFCE">cantidad_unidades</th>
                </tr>
              </thead>
              <tbody>
               <%    
                           int u=0;
                           for(Producto_lab p:re.listaringresos(fecha_registro)){
                               u++;        
%>
                <tr>
                   
                  <td><%=u%>.-</td>
                  <td><%=p.getNombreproducto()%></td>
                  <td><%= p.getNombrepresentacion()%></td>
                  <td><%=p.getNombrelaboratorio()%></td>
                    <td><%=p.getIdlote()%></td>
                  <td><%=p.getPrecio_ingreso()%></td>
                   <td><%=p.getCantidad_unidades()%></td>
                </tr>
               <%}}%>
              </tbody>
            </table>
              </form>
     </nav>
 </div>
              <%}%>   
             <%
if(reportes.equals("rep_im")){
%>      
<div class="row">   
  <nav class="col-md-12">
          <h2>Reporte de Ingresos mensual</h2>
          <form class="form-horizontal" action="rep_salida.jsp" method="post">
            <table class="table table-striped">
                <input type="text"   name="fecha_registro" placeholder= "mm/yyyy" maxlength="7" onchange="submit()">
                <input type="hidden" value="<%=reportes%>" name="reportes">
                <%
                if(!fecha_registro.equals("")){
                %>
              <thead>   
                <tr>
                  <th   bgcolor="#FFEFCE">N°</th>
                  <th   bgcolor="#FFEFCE">Nombre Prodcuto</th>
                  <th   bgcolor="#FFEFCE">Presentacion</th>
                  <th   bgcolor="#FFEFCE">Laboratorio</th>
                  <th   bgcolor="#FFEFCE">lote</th>
                  <th   bgcolor="#FFEFCE">Precio de ingreso</th>
                  <th   bgcolor="#FFEFCE">cantidad_unidades</th>
                </tr>
              </thead>
              <tbody>
               <%    
                           int u=0;
                           for(Producto_lab p:re.listaringresosmensuales(fecha_registro)){
                               u++;        
%>
                <tr>
                   
                  <td><%=u%>.-</td>
                  <td><%=p.getNombreproducto()%></td>
                  <td><%= p.getNombrepresentacion()%></td>
                  <td><%=p.getNombrelaboratorio()%></td>
                    <td><%=p.getIdlote()%></td>
                 <td><%=p.getPrecio_ingreso()%></td>
                   <td><%=p.getCantidad_unidades()%></td>
                </tr>
               <%}}%>
              </tbody>
            </table>
              </form>
     </nav>
 </div>
              <%}%> 
              
 </div>

<%@include file="WEB-INF/jspf/bottom.jspf"%>