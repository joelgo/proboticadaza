<%@page import="probotica.modelo.entidad.Producto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="probotica.modelo.entidad.produc_lab_lote"%>
<%@page import="probotica.modelo.dao.ProboticaDao"%>
<%@page import="probotica.modelo.dao.impl.ProboticaDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<!--<nav id="reg_pro">
      
<form action="registro" method="Post" >-->
<%
            ProboticaDao dao = new ProboticaDaoImpl();
            produc_lab_lote produc_lab_lote=new produc_lab_lote();
            Producto producto=new Producto();
            
            
            
             
              String lote = request.getParameter("lote");
            lote = lote == null ? "" : lote;
              String buscarProducto = request.getParameter("buscarProducto");buscarProducto = buscarProducto == null ?"": buscarProducto;
             String idproducto = request.getParameter("idproducto"); idproducto = idproducto == null ? "" : idproducto;
             String composicion = request.getParameter("composicion"); composicion = composicion == null ? "" : composicion;
             String presentacion = request.getParameter("presentacion"); presentacion = presentacion == null ? "" : presentacion;
              String Stockmin = request.getParameter("Stockmin"); Stockmin= Stockmin==null?"":Stockmin;
             String Stock = request.getParameter("Stock"); Stock= Stock==null?"":Stock;
             String preci_unitario = request.getParameter("preci_unitario"); preci_unitario= preci_unitario==null?"":preci_unitario;
             String fecha_vencimiento = request.getParameter("fecha_vencimiento");fecha_vencimiento= fecha_vencimiento==null?"": fecha_vencimiento;
              String idlaboratorio = request.getParameter("idlaboratorio"); idlaboratorio= idlaboratorio==null?"":idlaboratorio;
             String estado=request.getParameter("estado"); estado=estado==null?"":estado;
            
              String mensaje = "";
            String mensajeError = "";
             
            // if(!Stockmin.equals("") & !Stock.equals("") & !preciocom.equals("") & !precioven.equals("") & !lote.equals("") & !fecha.equals("") & !laboratorio.equals("")){
            

                if (!buscarProducto.equals("")) {
                producto = dao.buscarproducto(buscarProducto);
                if (producto != null) {
                    idproducto= producto.getNombreproducto();
                    composicion = producto.getComposicion();
                    presentacion = producto.getId_presentacion();
                    
                    
                } else {
                    mensaje = "El producto no esta registrado <a href='producto.jsp'>aqui</a>";
                }

            }
                 if(!produc_lab_lote.equals("") & !lote.equals("") & !idlaboratorio.equals("") & !idproducto.equals("") & !Stock.equals("") & !lote.equals("") & !fecha_vencimiento.equals("") & !estado.equals("")){
                 Date fechaVencimiento = new SimpleDateFormat("dd/MM/yyyy").parse(fecha_vencimiento);
                 
                 produc_lab_lote.setIdproducto(idproducto);
                 produc_lab_lote.setLote(lote);
                 produc_lab_lote.setIdlaboratorio(idlaboratorio);
                 produc_lab_lote.setStock(Stock);
                 produc_lab_lote.setFecha_vencimiento(fecha_vencimiento);
                 produc_lab_lote.setEstado(estado);
                 
                
                 
                 
                 
                 if (dao.registrarProducto(producto)) {
                    response.sendRedirect("Producto.jsp");
                } else {
                    mensajeError = "No se pudo Registrar al Producto debido a que ya existe"; 
                }
            }
             
             
        
        %>

 <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 well">
<form action=" producto_detalle.jsp " method="post" class="form-horizontal">
      <h1> <%=buscarProducto%><%=idproducto%> </h1>
        <form action="Producto.jsp" method="post">
            <input type="hidden" name="idproducto" value="<%=idproducto%>" size="10">
            <input type="hidden" name="Producto" value="<%=buscarProducto%>" size="10">
            <table>
                <tr>
                    <td>producto:</td>
                    <td><input type="text" name="idproducto" placeholder="Ingrese producto" size="10"></td>
                    <td><input type="submit" value="Buscar"></td> 
                </tr>
                <tr>
                    <td colspan="3"><%=mensaje%></td>
                </tr>
            </table>
        </form>
    <table class="table table-condensed">
       
        <tr>
            <td><label class="col-md-12">Lote</label></td>
            <td><input type="text" name="lote" placeholder= "lote" class="form-control" ></td>
        </tr>
        
        <tr>
            <td><label class="col-md-12">Laboratorio</label></td>
            <td><input type="text" name="idlaboratorio" placeholder= "laboratorio" class="form-control" ></td>
        </tr>
        
        <tr>
            <td><label class="col-md-12">Producto</label></td>
            <td><input type="text" name="idproducto" placeholder= "lote" class="form-control" ></td>
        </tr>
        
        <tr>
            <td><label class="col-md-12">Stock</label></td>
            <td><input type="text" name="Stock" placeholder= "Stock" class="form-control" ></td>
        </tr>
        
         <tr>
            <td><label class="col-md-12">fecha de vencimiento</label></td>
            <td><input type="date" name="fecha_vencimiento" placeholder= "fecha de vencimiento" class="form-control" ></td>
        </tr>
        
          <tr>
            <td><label class="col-md-12">Estado</label></td>
            <td><input type="text" name="estado" placeholder= "Estado" class="form-control" ></td>
        </tr>
         
        <tr>
            <td colspan="2"><label><%=mensaje%></label></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" class="btn btn-success" value="Guardar"></td>
        </tr>
</table>
</form>
</div> 
<div class="col-xs-12 col-sm-3 col-md-3"></div>
</div>
</div>

<!--</form>
  </nav>-->
<%@include file="WEB-INF/jspf/bottom.jspf"%>
