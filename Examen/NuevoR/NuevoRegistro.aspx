<%@ Page Title="" Language="C#" MasterPageFile="~/MasterLogin.Master" AutoEventWireup="true" CodeBehind="NuevoRegistro.aspx.cs" Inherits="Examen.NuevoRegistro.NuevoRegistro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

Nuevo Registro

    <table>
        <tr>
            <td>
                UserName
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUserName" ControlToValidate="txtUserName" ValidationGroup = "vlgUser"  Display = Dynamic runat="server" ErrorMessage="* Requerido" ForeColor = "red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic"  ValidationExpression="^[a-zA-Z0-9_]*$" ValidationGroup = "vlgUser" ErrorMessage="*Este campo solo acepta alfaumerico" ForeColor = "red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Password
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" ValidationGroup = "vlgUser"  Display = Dynamic runat="server" ErrorMessage="* Requerido" ForeColor = "red"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic"  ValidationExpression="^[a-zA-Z0-9_]*$" ValidationGroup = "vlgUser" ErrorMessage="*Este campo solo acepta alfaumerico" ForeColor = "red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Nombre Completo
            </td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" ControlToValidate="txtNombre" ValidationGroup = "vlgUser"  Display = Dynamic runat="server" ErrorMessage="* Requerido" ForeColor = "red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" Display="Dynamic"  ValidationExpression="[A-Za-z ñÑ]*" ValidationGroup = "vlgUser" ErrorMessage="*Ingrese solamente Letras" ForeColor = "red"></asp:RegularExpressionValidator>
            </td>
        </tr>    
        <tr>
            <td>
                Email
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail" ValidationGroup = "vlgUser"  Display = Dynamic runat="server" ErrorMessage="* Requerido" ForeColor = "red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="rev" runat="server" ControlToValidate="txtEmail" Display="Dynamic"  ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ValidationGroup = "vlgUser" ErrorMessage="*Formato: hola@hotmail.com" ForeColor = "red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Confirmar Password
            </td>
            <td>
                <asp:TextBox ID="txtConfirmPassword" runat="server" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" ControlToValidate="txtPassword" ValidationGroup = "vlgUser"  Display = Dynamic runat="server" ErrorMessage="* Requerido" ForeColor = "red"></asp:RequiredFieldValidator>
            </td>
        </tr>            
    </table>
    <br />
    <asp:Button ID="btnAgergar" runat="server" Text="Guardar"
        onclick="btnAgergar_Click" ValidationGroup = "vlgUser" />

    &nbsp;&nbsp;&nbsp;

    <asp:Button ID="btnRegresar" runat="server" Text="Regersar" 
    onclick="btnRegresar_Click" />


</asp:Content>
