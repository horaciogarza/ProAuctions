<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Subasta_m.aspx.cs" Inherits="Examen.Subastas.Subasta_m" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table>
    <tr>
        <td>
            # de subasta
        </td>
        <td>
            <asp:TextBox ID="txtNumSubasta" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Nombre de Producto
        </td>
        <td>
            <asp:TextBox ID="txtNombre" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Descripcion de Producto
        </td>
        <td>
            <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Fecha de inicio de subasta
        </td>
        <td>
            <asp:TextBox ID="txtInicio" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Fecha de fin de subasta
        </td>
        <td>
            <asp:TextBox ID="txtFin" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Oferta Actual mas alta
        </td>
        <td>
            <asp:TextBox ID="txtOfertaActual" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Usuario que realizo la oferta mas alta
        </td>
        <td>
            <asp:TextBox ID="txtUsuarioOferta" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
</table>

    <br />

Ofertar <asp:TextBox ID="txtOfertar" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rfvOfertar" ControlToValidate="txtOfertar" ValidationGroup = "vlgSubasta"  Display = Dynamic runat="server" ErrorMessage="* Requerido" ForeColor = "red"></asp:RequiredFieldValidator>
         <asp:RangeValidator ID="rvgOfertar" ControlToValidate="txtOfertar" ValidationGroup = "vlgSubasta" Display = Dynamic Type = "Currency" MinimumValue = 1 MaximumValue = 99999  runat="server" ErrorMessage="* La oferta debe ser mayor a 1 y menor que 1,000,000"  ForeColor = "red"></asp:RangeValidator>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" ValidationGroup = "vlgSubasta"
        onclick="btnGuardar_Click" />

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:Button ID="btnRegresar" runat="server" Text="Regresar" 
        onclick="btnRegresar_Click" />
</asp:Content>
