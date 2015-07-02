<%@page import="probotica.modelo.entidad.Salida"%>
<%@page import="probotica.modelo.dao.impl.SalidaDaoImpl"%>
<%@page import="probotica.modelo.dao.SalidaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<jsp:useBean id="mensaje" scope="page" class="java.lang.String" />

<%
        HttpSession session1=request.getSession();
        String idPedro = (String)session1.getAttribute("idusuario");     
%>


<div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 well">
<form action="salidaa" method="post">
    
    <input type="hidden" name="idusuario" value="<%=idusuario%>">
    <table class="table table-condensed">      
<h1>Para continuar con la salida del producto as click en continuar</h1>
          <tr>
            <td colspan="2"><label><%=mensaje%></label></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" class="btn btn-success col-md-3" value="Continuar"></td>
        </tr>
</table>
</form>
</div> 
<div class="col-xs-12 col-sm-3 col-md-3"></div>
</div>
</div>


<%@include file="WEB-INF/jspf/bottom.jspf"%>
