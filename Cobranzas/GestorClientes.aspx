<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestorClientes.aspx.cs" Inherits="Cobranzas.GestorClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/GestorCobranzas.aspx">Ir al Gestor de Cobranzas...</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
            :<br />
            <asp:TextBox ID="tbClienteNuevoNombre" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Apellido"></asp:Label>
            :<br />
            <asp:TextBox ID="tbClienteNuevoApellido" runat="server" style="margin-left: 3px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnAlta" runat="server" OnClick="btnAlta_Click" Text="Registrar Cliente" Width="125px" />
            <asp:Label ID="LabelAlta" runat="server"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridClientes" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlClientes" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <br />            
            <br />
            <br />
            <asp:SqlDataSource ID="SqlClientes" runat="server" ConnectionString="<%$ ConnectionStrings:database %>" DeleteCommand="DELETE FROM [Clientes] WHERE [id] = @id" InsertCommand="INSERT INTO [Clientes] ([apellido], [nombre]) VALUES (@apellido, @nombre)" SelectCommand="SELECT * FROM [Clientes]" UpdateCommand="UPDATE [Clientes] SET [apellido] = @apellido, [nombre] = @nombre WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridClientes" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="tbClienteNuevoApellido" Name="apellido" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="tbClienteNuevoNombre" Name="nombre" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridClientes" Name="apellido" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="GridClientes" Name="nombre" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="GridClientes" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
