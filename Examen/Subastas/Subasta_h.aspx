<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Subasta_h.aspx.cs" Inherits="Examen.Subastas.Subasta_h" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"> <%--se necesita para hacer uso del update panel--%>
</asp:ScriptManager>
 <script type="text/javascript">
     $(document).ready(function () {    //document ready se utiliza cuando quieres que se cargue el plugin despues de que se carge la pagina
         $(".chosen-select").chosen();
     })

 </script>
 <script type="text/javascript">
     function calculateTotal() {

         var grid = document.getElementById("<%=grdHistorial.ClientID%>");
         var sum = 0;

         $(".Bid").each(function () {
             sum += parseFloat($(this).val());

         });

         document.getElementById('<%= txtJsuma.ClientID %>').value = Math.round(sum * 100) / 100;


     }
    </script>

<table>
    <tr>
        <td>
            Producto
        </td>
        <td>
        <asp:TextBox ID="txtProducto" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Descripcion
        </td>
        <td>
            <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" runat="server" ReadOnly="true"></asp:TextBox>
        </td>
    </tr>
</table>
    <br />
    <asp:GridView ID="grdHistorial" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="User.UserName" HeaderText="Nombre"/>
            <asp:TemplateField HeaderText="Monto">
            <ItemTemplate>
            <asp:TextBox ID="txtAmount" runat="server" CssClass="Bid" Text='<%#Bind("Amount")%>' ReadOnly="true"></asp:TextBox>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BidDate" HeaderText="Fecha"/>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    Filtro: <asp:DropDownList ID="ddlUsuario" runat="server" 
        CssClass = "chosen-select"  AutoPostBack="true" 
        onselectedindexchanged="ddlUsuario_SelectedIndexChanged">
            </asp:DropDownList>
    <br />
    <br />
    <br />
        Suma: <asp:TextBox ID="txtSuma" runat="server" ReadOnly="true"></asp:TextBox>
        Suma con Javascript: <asp:TextBox ID="txtJsuma" runat="server" ReadOnly="true"></asp:TextBox>
    </asp:Content>
