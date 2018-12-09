<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebEntityFramework.Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>CRUD with Entity Framework</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ListView ID="ListView1" runat="server" ItemType="WebEntityFramework.Customer"
             SelectMethod="GetCustomers" UpdateMethod="EditCustomer" DeleteMethod="DeleteCustomer"
             InsertMethod="InsertCustomer" DataKeyNames="CustomerId">
            <LayoutTemplate>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>FirstName</th>
                        <th>LastName</th>
                        <th>City</th>
                        <th>Age</th>
                        <th>Functions</th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server"></tr>
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr>
                    <td><%# Item.CustomerId %></td>
                    <td><%# Item.FirstName %></td>
                    <td><%# Item.LastName %></td>
                    <td><%# Item.City %></td>
                    <td><%# Item.Age %></td>
                    <td>
                        <asp:Button CommandName="Edit" runat="server" Text="Edit" />
                        <asp:Button CommandName="Delete" runat="server" Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>

            <EditItemTemplate>
                <tr>
                    <td><%# Item.CustomerId %></td>
                    <td><input id="firstName" runat="server" value="<%# BindItem.FirstName %>" /></td>
                    <td><input id="lastName" runat="server" value="<%# BindItem.LastName %>" /></td>
                    <td><input id="city" runat="server" value="<%# BindItem.City %>" /></td>
                    <td><input id="age" runat="server" value="<%# BindItem.Age %>" /></td>
                    <td>
                        <asp:Button CommandName="Update" runat="server" Text="Save" />
                        <asp:Button CommandName="Delete" runat="server" Text="Cancel" />
                    </td>
                </tr>
            </EditItemTemplate>

            <InsertItemTemplate>
                <tr>
                    <td></td>
                    <td><input id="firstName" runat="server" value="<%# BindItem.FirstName %>" /></td>
                    <td><input id="lastName" runat="server" value="<%# BindItem.LastName %>" /></td>
                    <td><input id="city" runat="server" value="<%# BindItem.City %>" /></td>
                    <td><input id="age" runat="server" value="<%# BindItem.Age %>" /></td>
                    <td>
                        <asp:Button ID="Button1" CommandName="Insert" runat="server" Text="Insert" />
                    </td>
                </tr>
            </InsertItemTemplate>
        </asp:ListView>
    </form>

    <style>
        th, td { padding: 8px; }
        th { background: #28a4fa; color: white; font-weight: bold; }
        tr:nth-of-type(even) { background: #eee; }
        tr:nth-of-type(odd) { background: #fffbd6; }
    </style>
</body>
</html>