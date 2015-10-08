<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Subasta_i.aspx.cs" Inherits="Examen.Subastas.Subasta_i" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.11.0/jquery-ui.min.js"></script>
		<script type="text/javascript" src="/Scripts/jquery-ui-timepicker-addon.js"></script>
		<script type="text/javascript" src="/Scripts/jquery-ui-timepicker-addon-i18n.min.js"></script>
		<script type="text/javascript" src="/Scripts/jquery-ui-sliderAccess.js"></script>

		<script type="text/javascript">
		    $(function () {
		        $('#tabs').tabs();

		        $('.DateTimePickerPre').each(function (i) {
		            eval($(this).text());
		        });
		    });
			
		</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <pre class="DateTimePickerPre" hidden="true">
        $('#<%= txtFin.ClientID %>').datetimepicker({ dateFormat: 'dd-mm-yy'});
        $('#<%= txtInicio.ClientID %>').datetimepicker({ dateFormat: 'dd-mm-yy'});
 </pre>
Nueva Subasta
<table>
    <tr>
        <td>
            Nombre del Producto:
        </td>
        <td>
            <asp:TextBox ID="txtNombre" runat="server" MaxLength="50"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" ControlToValidate="txtNombre" ValidationGroup = "vlgSubasta"  Display = Dynamic runat="server" ErrorMessage="* Requerido" ForeColor = "red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" Display="Dynamic"  ValidationExpression="^[a-zA-Z0-9_]*$" ValidationGroup = "vlgSubasta" ErrorMessage="*Este campo solo acepta alfaumerico" ForeColor = "red"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            Descripcion del Producto:
        </td>
        <td>
            <asp:TextBox ID="txtDescripcion" runat="server" MaxLength="100"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDescripcion" ControlToValidate="txtDescripcion" ValidationGroup = "vlgSubasta"  Display = Dynamic runat="server" ErrorMessage="* Requerido" ForeColor = "red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revDescripcion" runat="server" ControlToValidate="txtDescripcion" Display="Dynamic"  ValidationExpression="^[a-zA-Z0-9_]*$" ValidationGroup = "vlgSubasta" ErrorMessage="*Este campo solo acepta alfaumerico" ForeColor = "red"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            Fecha de Inicio
        </td>
        <td>
            <asp:TextBox ID="txtInicio" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvInicio" ControlToValidate="txtInicio" ValidationGroup = "vlgSubasta"  Display = Dynamic runat="server" ErrorMessage="* Requerido" ForeColor = "red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Fecha de Fin:
        </td>
        <td>
            <asp:TextBox ID="txtFin" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFin" ControlToValidate="txtFin" ValidationGroup = "vlgSubasta"  Display = Dynamic runat="server" ErrorMessage="* Requerido" ForeColor = "red"></asp:RequiredFieldValidator>
        </td>
    </tr>
</table>
    <asp:Button ID="btnGuardar" runat="server" Text="Agregar" 
    ValidationGroup ="vlgSubasta" onclick="btnGuardar_Click"/>
    <asp:Button ID="btnRegresar" runat="server" Text="Regresar" 
    onclick="btnRegresar_Click"/>



</asp:Content>
