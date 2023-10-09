<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestorCobranzas.aspx.cs" Inherits="Cobranzas.GestorCobranzas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/GestorClientes.aspx">Ir al Gestor de Clientes...</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Seleccione un Cliente"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlCliente" runat="server" DataSourceID="SqlClientes" DataTextField="Cliente" DataValueField="id">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Monto a cobrar:"></asp:Label>
            <br />
            <asp:TextBox ID="tbMonto" placeholder="Ingresar monto" runat="server" TextMode="Number"></asp:TextBox>
            <asp:Button ID="btnCobro" runat="server" Text="Registrar cobro" OnClick="btnCobro_Click" />
            <asp:Label ID="LabelAlta" runat="server"></asp:Label>
            <br />
            <br />            
            <br />
            <asp:Label ID="Label3" runat="server" Font-Size="16pt" Text="TABLA DE REGISTROS DE COBROS"></asp:Label>
            <br />
            <asp:GridView ID="GridCobranzas" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCobranzas" ForeColor="#333333" GridLines="None" OnDataBound="GridCobranzas_DataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" ReadOnly="True" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" ReadOnly="True" />
                    <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha"  ReadOnly="True"/>
                    <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
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
            <br />
            <asp:Label ID="Label4" runat="server" Font-Size="16pt" Text="TABLA DE REGISTROS TOTALES"></asp:Label>
            <asp:GridView ID="GridCobranzaTotal" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlCobranzasTotal" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" ReadOnly="True" SortExpression="Cliente" />
                    <asp:BoundField DataField="CantidadCobros" HeaderText="CantidadCobros" ReadOnly="True" SortExpression="CantidadCobros" />
                    <asp:BoundField DataField="MontoTotal" HeaderText="MontoTotal" ReadOnly="True" SortExpression="MontoTotal" />
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
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="FILTRAR POR FECHAS: "></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Desde:"></asp:Label>
            <asp:Calendar ID="fecha1" runat="server"></asp:Calendar>
            <asp:Label ID="Label7" runat="server" Text="Hasta"></asp:Label>
            :<asp:Calendar ID="fecha2" runat="server"></asp:Calendar>            
            <br />
            <asp:Button ID="noFiltro" runat="server" Text="Eliminar filtro de fechas" OnClick="noFiltro_Click"></asp:Button>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlClientes" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT id, { fn CONCAT(apellido, nombre) } AS Cliente FROM Clientes"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlCobranzas" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [Cobranzas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cobranzas] ([idCliente], [monto]) VALUES (@idCliente, @monto)" SelectCommand="SELECT Cobranzas.id, Cobranzas.fecha, Cobranzas.monto, Clientes.apellido, Clientes.nombre FROM Cobranzas INNER JOIN Clientes ON Cobranzas.idCliente = Clientes.id WHERE (Cobranzas.fecha >= @fecha1) AND (Cobranzas.fecha <= @fecha2)" UpdateCommand="UPDATE [Cobranzas] SET [monto] = @monto WHERE [id] = @id" OnSelected="SqlCobranzas_Selected">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridCobranzas" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="fecha" />
                    <asp:ControlParameter ControlID="ddlCliente" Name="idCliente" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="tbMonto" Name="monto" PropertyName="Text" Type="Decimal" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="fecha1" PropertyName="SelectedDate" Name="fecha1"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="fecha2" PropertyName="SelectedDate" Name="fecha2"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="fecha" />
                    <asp:Parameter Name="idCliente" Type="Int32" />
                    <asp:ControlParameter ControlID="GridCobranzas" Name="monto" PropertyName="SelectedValue" Type="Decimal" />
                    <asp:ControlParameter ControlID="GridCobranzas" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlCobranzasTotal" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" SelectCommand="SELECT { fn CONCAT(c.apellido, c.nombre) } AS Cliente, SUM(Cobranzas.monto) AS MontoTotal, COUNT(Cobranzas.id) AS CantidadCobros FROM Cobranzas INNER JOIN Clientes AS c ON Cobranzas.idCliente = c.id WHERE (Cobranzas.fecha >= @fecha1) AND (Cobranzas.fecha <= @fecha2) GROUP BY { fn CONCAT(c.apellido, c.nombre) }">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fecha1" PropertyName="SelectedDate" Name="fecha1"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="fecha2" PropertyName="SelectedDate" Name="fecha2"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        
    </form>
</body>
</html>
