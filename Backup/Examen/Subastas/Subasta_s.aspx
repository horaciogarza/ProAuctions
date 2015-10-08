<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Subasta_s.aspx.cs" Inherits="Examen.Subastas.Subasta_s" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"> <%--se necesita para hacer uso del update panel--%>
    </asp:ScriptManager>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="/Scripts/QuickSearch.js" type="text/javascript"></script>
    <script type="text/javascript">
//        $(document).ready(function () {    //document ready se utiliza cuando quieres que se cargue el plugin despues de que se carge la pagina
        $(function () {
            $('.search_textbox').each(function (i) {
                $(this).quicksearch("[id*=grdSubasta] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        return $(row).children(":eq(" + 2 + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                    }
                });
            });
        });

 </script>


    <h2>Subastas</h2>
        Buscar<asp:TextBox ID="txtBuscar" runat="server" CssClass = "search_textbox"></asp:TextBox>
    <asp:GridView ID="grdSubasta" runat="server" AutoGenerateColumns="False" 
        onrowcommand="grdSubasta_RowCommand" CellPadding="4" ForeColor="#333333" 
         GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="AuctionId" HeaderText="# Subasta"/>
             <asp:TemplateField HeaderText ="Nombre">
                <ItemTemplate>
                    <asp:LinkButton ID="btnNombre" Width="20px" Height="20px" runat="server" CommandName="Nombre" CommandArgument='<%# Eval("AuctionId")%>'><%# Eval("ProductName")%></asp:LinkButton> <%--el command name y command argument son los importantes--%>
                </ItemTemplate>
            </asp:TemplateField>
           <%-- <asp:BoundField DataField="ProductName" HeaderText="Nombre del Producto"/>--%>
            <asp:BoundField DataField="Description" HeaderText="Descripcion"/>
            <asp:BoundField DataField="StartDate" HeaderText="Fecha Inicio" DataFormatString ="{0:dd-MM-yyyy}"/>
            <asp:BoundField DataField="EndDate" HeaderText="Fecha Fin" DataFormatString ="{0:dd-MM-yyyy}"/>
           <asp:TemplateField HeaderText ="Historial">
                <ItemTemplate>
                    <asp:ImageButton ID="btnHistorial" Width="20px" Height="20px" runat="server" CommandName="Historial" CommandArgument='<%# Eval("AuctionId")%>' ImageUrl="~/Imagenes/Historial.png" /> <%--el command name y command argument son los importantes--%>
                </ItemTemplate>
            </asp:TemplateField>
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
</asp:Content>


