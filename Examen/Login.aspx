<%@ Page Title="" Language="C#" MasterPageFile="~/MasterLogin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Examen.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="App_Themes/Theme1/bootstrap.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<table>
    <tr>
        <td>
            Usuario:
        </td>
        <td>
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Password:
        </td>
        <td>
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" 
        onclick="btnIngresar_Click" class="btn btn-default"/>


    <br />
    <br />
    <br />

    <asp:Label ID="lblRegistro" runat="server" Text="No estas registrado?, Registrate aqui"></asp:Label>
    &nbsp;
    <asp:Button ID="btnRegistro" runat="server" Text="Registrate" 
        onclick="btnRegistro_Click" class="btn btn-default"/>

</asp:Content>
