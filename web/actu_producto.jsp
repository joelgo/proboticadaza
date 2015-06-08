
<%@page import="probotica.modelo.entidad.Producto"%>
<%@page import="probotica.modelo.dao.impl.ProductoDaoImpl"%>
<%@page import="probotica.modelo.dao.ProductoDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%
    
            ProductoDao dao = new ProductoDaoImpl();
            
            
            Producto producto = new Producto();
            
            String idproducto = request.getParameter("idproducto");
            idproducto = idproducto == null ? "" : idproducto;
            
            out.println("idlaboratorio"+idproducto);
            
            String nombreproducto=request.getParameter("nombreproducto");
            nombreproducto = nombreproducto == null ? "" : nombreproducto;
            
            String concentracion=request.getParameter("concentracion");
            concentracion = concentracion == null ? "" : concentracion;
            
            String precio_unitario=request.getParameter("precio_unitario");
            precio_unitario = precio_unitario == null? "" : precio_unitario;
            
            
            String Stock_minimo=request.getParameter("Stock_minimo");
            Stock_minimo = Stock_minimo == null? "" : Stock_minimo;
            
            
            
            
            String opcion=request.getParameter("opcion");
            opcion=opcion == null? "" : opcion;
 
            String mensaje =""; 
                     
                
               
                
                
            
           
%>



<div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-1"></div>
                <div class="col-xs-12 col-sm-6 col-md-10 well">
                   
<form action="actu_laboratorio.jsp"method="post" class="form-horizontal">
   
    <table class="table table-condensed">
        <tr>
            <td><label class="col-md-12">Nombre del Producto</label></td>
            <td><input type="text" name="nombreproducto"  class="form-control" ></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Concentracion</label></td>
            <td><input type="text" name="concentracion"  class="form-control" ></td>
        </tr>
        <tr>
            <td><label class="col-md-12">Precio sugerido</label></td>
            <td><input type="text" name="precio_unitario"  class="form-control" ></td>
        </tr>
         <tr>
            <td><label class="col-md-12">Stock minimo</label></td>
            <td><input type="text" name="Stock_minimo" class="form-control" ></td>
        </tr>
         <tr>
            <td colspan="2"><label><%=mensaje%></label></td>
        </tr>
        <tr>
            <td colspan="10"><input type="submit" class="btn btn-success" value="Guardar"><a type="submit" class="btn btn-success" href="bienvenido.jsp">Salir</a></td> 
        </tr>
</table>
</form>
  
</div> 
<div class="col-xs-12 col-sm-3 col-md-1"></div>
</div>
</div>
<%@include file="WEB-INF/jspf/bottom.jspf"%>