<%@page import="probotica.modelo.entidad.detalle_salida"%>
<%@page import="java.util.List"%>
<%@page import="probotica.modelo.entidad.Producto_lab"%>
<%@page import="probotica.modelo.entidad.Salida"%>
<%@page import="probotica.modelo.dao.impl.SalidaDaoImpl"%>
<%@page import="probotica.modelo.dao.SalidaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<jsp:useBean id="idsalida" scope="request" class="java.lang.String" />
<jsp:useBean id="opcion" scope="request" class="java.lang.String" />
<jsp:useBean id="mensaje" scope="request" class="java.lang.String" />
<jsp:useBean id="Producto_lab" scope="request" class="java.lang.String" />
<jsp:useBean id="nombreproducto" scope="request" class="java.lang.String" />
<jsp:useBean id="idproducto" scope="request" class="java.lang.String" />
<jsp:useBean id="idlote" scope="request" class="java.lang.String" />
<jsp:useBean id="idlaboratorio" scope="request" class="java.lang.String" />
<jsp:useBean id="precio_salida" scope="request" class="java.lang.String" />
<jsp:useBean id="precio_unitario" scope="request" class="java.lang.String" />
<jsp:useBean id="cantidad_unidades" scope="request" class="java.lang.String" />
<div class="container">
    <%    SalidaDao s = new SalidaDaoImpl();
        Producto_lab producto = new Producto_lab();

        
       String buscar=request.getParameter("buscar");
       buscar=buscar==null?"": buscar;
            
    %>

    <div class="row">
        <div class="tab-pane col-md-6">
           
            <form class="form-horizontal" action="registro_sal" method="post">
                <table class="table table-hover table-striped table-bordered"> 
                    <thead>
                  <input type="hidden" value="<%=idsalida%>" name="idsalida">
                    <tr>
                        <td width="40%" bgcolor="#FFEFCE"><strong>Nombre del Producto</strong></td>
                        <td width="40%" bgcolor="#FFEFCE"><strong>Precio de Salida</strong></td>
                        <td width="40%" align="center" bgcolor="#FFEFCE"><strong>Cantidad</strong></td>
                        <td width="40%" align="center" bgcolor="#FFEFCE"><strong>Agregar</strong></td>
                    </tr>
                    <tr>
                         <%
                       if(opcion.equals("SELECCIONAR")){
                    %>
                    <td><%=nombreproducto%></td>
                    <input type="hidden" name="idlaboratorio" value="<%=idlaboratorio%>">
                    <input type="hidden" name="idlote" value="<%=idlote%>" >
                    <input type="hidden" name="idproducto" value="<%=idproducto%>">
                    <input type="hidden" name="opcion" value="agregarsalida">
                        <td><input type="text" name="precio_salida" value="<%=precio_unitario%>"></td>
                        <td><input type="text" name="cantidad_unidades"></td>
                        <td><input type="submit" value="OK"></td>
                         <%}%>
                    </tr>
                   </thead>
                </table>
                  </form>
                    <form method="post" action="registro_sal">
               <table class="table table-hover table-striped table-bordered">  
                  <input type="hidden" value="<%=idsalida%>" name="idsalida">
                   <input type="hidden" name="idlaboratorio" value="<%=idlaboratorio%>">
                    <input type="hidden" name="idlote" value="<%=idlote%>" >
                    <input type="hidden" name="idproducto" value="<%=idproducto%>">
                  <thead>
                    <tr>
                        <td width="40%" bgcolor="#FFEFCE"><strong>N°</strong></td>
                        <td width="40%" bgcolor="#FFEFCE"><strong>Producto</strong></td>
                        <td width="40%" bgcolor="#FFEFCE"><strong>Precio</strong></td>
                        <td width="40%" align="center" bgcolor="#FFEFCE"><strong>Cantidad</strong></td>
                        <td width="40%" bgcolor="#FFEFCE"><strong>subtotal</strong></td>
                         <td width="40%" bgcolor="#FFEFCE"><strong>Modificar</strong></td>
                        <td width="40%" bgcolor="#FFEFCE"><strong>Eliminar</strong></td>
                    </tr></thead>

                         <%
                           int u=0;
            
                           for(detalle_salida dt:s.listardetalle()){
                               u++;        
                    %> 
                     <tr>
                        <td><%=u%></td>
                        <td><%=dt.getNombreproducto()%></td>
                        <td><%=dt.getPrecio_salida()%></td>
                        <td><%=dt.getCantidad_unidades()%></td>
                        <td><%=dt.getSubtotal()%> </td>
                         <td><a class="btn btn-primary" href="registro_sal?opcion=modificar&idsalida=<%=dt.getIdsalida()%>&idproducto=<%=dt.getIdproducto()%>&idlaboratorio=<%=dt.getIdlaboratorio()%>&idlote=<%=dt.getIdlote()%>&nombreproducto=<%=dt.getNombreproducto()%>&cantidad_unidades=<%=dt.getCantidad_unidades()%>&precio_salida=<%=dt.getPrecio_salida()%>"><span class="glyphicon glyphicon-refresh" title="modificar"></span></a></td> 
                         <td><a class="btn btn-danger"  href="registro_sal?opcion=eliminar&idsalida=<%=dt.getIdsalida()%>&idproducto=<%=dt.getIdproducto()%>&idlaboratorio=<%=dt.getIdlaboratorio()%>&idlote=<%=dt.getIdlote()%>"><span class="glyphicon glyphicon-trash" title="eliminar"></span></a></td>    
                    </tr>
                    
                    
                         <%
                                }
                           
                           
                               for(detalle_salida Li : s.TotalSalida(idsalida)){
                                 
                            %>
                           
                                    
                           <tr>
                            Total: S/= <%=Li.getTOTAL()%></td>
                            </tr>
                    
                    
                    
                             <%}%>
                    <tr>
                        <td align="center"><input type="submit" value="Guardar">
                             
                        <input type="hidden" name="opcion" value="terminar"></td>
                    </tr>
                    <tr>
                        <td><%=mensaje%></td>
                    </tr>
                </table>
                    
                    </form>
                     <%
                       if(opcion.equals("modificar")){
                    %>
                     <form class="form-horizontal" action="registro_sal" method="post">
                <table class="table table-condensed">  
                  <input type="hidden" value="<%=idsalida%>" name="idsalida">
                    <tr>
                        <td width="40%" bgcolor="#FFEFCE"><strong>Nombre del Producto</strong></td>
                        <td width="40%" bgcolor="#FFEFCE"><strong>Precio de Salida</strong></td>
                        <td width="40%" align="center" bgcolor="#FFEFCE"><strong>Cantidad</strong></td>
                        <td width="40%" align="center" bgcolor="#FFEFCE"><strong>Agregar</strong></td>
                    </tr>
                    <tr>
                        
                        <td><%=nombreproducto%></td>
                    <input type="hidden" name="idlaboratorio" value="<%=idlaboratorio%>">
                    <input type="hidden" name="idlote" value="<%=idlote%>" >
                    <input type="hidden" name="idproducto" value="<%=idproducto%>">
                    <input type="hidden" name="opcion" value="actualizar">
                        <td><input type="text" name="precio_salida" value="<%=precio_salida%>"></td>
                        <td><input type="text" name="cantidad_unidades" value="<%=cantidad_unidades%>"></td>
                        <td><input type="submit" value="OK"></td>
                         <%}%>
                    </tr>
                   
                </table>
                  </form>
                   
             
        </div>
        <div class="tab-pane col-md-6">
            <form action=" reg_salida.jsp " method="post" class="form-horizontal">
                <table class="table table-condensed">
                    <tr>
                        <td><label class="col-md-10">buscar:</label></td>
                        <td><input type="text" name="buscar" placeholder="Ingrese nombre del producto"  class="form-control"></td>
                        <td><input type="submit" value="Buscar"></td>
                    </tr>
                    <tr>  
                        
                        <td colspan="3"><%=mensaje%></td>
                    </tr> 

                </table>    
            </form>

            <table class="table table-hover table-striped table-bordered">
                <thead>
                    <tr>
                        <td width="3%" bgcolor="#FFEFCE"><strong>N°</strong></td>
                        <td width="20%" bgcolor="#FFEFCE"><strong>Nombre del Producto</strong></td>
                        <td width="10%" bgcolor="#FFEFCE"><strong>Presentación</strong></td>
                        <td width="7%" align="center" bgcolor="#FFEFCE"><strong>Stock</strong></td>
                        <td width="8%" align="center" bgcolor="#FFEFCE"><strong>Precio</strong></td>
                        <td width="12%" align="center" bgcolor="#FFEFCE"><strong>Opcion</strong></td>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String espacio = "";
                        int count = 0;
                        SalidaDao dao = new SalidaDaoImpl();

                        for (Producto_lab producto1 : dao.listarproducto(buscar)) {

                            count++;

                    %>

                    <tr> 
                <input type="hidden" name="idproducto" value="<%=producto1.getIdproducto()%>" size="10"> 
                <td><%=count%>.-</td> 
                <td><%=producto1.getNombreproducto()%></td>
                <td align="center"><%=producto1.getNombrepresentacion()%></td>
                <td align="center"><%=producto1.getStock()%></td>
                <td align="center"><%=producto1.getPrecio_unitario()%></td>



                <td>
                    <form method="post" action="registro_sal">
                        <input type="submit" name="opcion" value="SELECCIONAR">
                        <input type="hidden" name="idproducto" value="<%=producto1.getIdproducto()%>">
                        <input type="hidden" name="nombreproducto" value="<%=producto1.getNombreproducto()%>">
                        <input type="hidden" name="idlaboratorio" value="<%=producto1.getIdlaboratorio()%>">
                        <input type="hidden" name="idlote" value="<%=producto1.getIdlote()%>"> 
                        <input type="hidden" name="precio_unitario" value="<%=producto1.getPrecio_unitario()%>"> 
                    </form>
                </td>

                </tr>

                <%}%>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>