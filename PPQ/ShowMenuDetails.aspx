<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="ShowMenuDetails.aspx.cs" Inherits="PPQ.ShowMenuDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
        <table>
            <tr>
                <td style="width: 233px">
                    <strong>Menu Item Details</strong>
                </td>
                <td style="width: 257px; text-align: right">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Order.aspx?type=food">Go to Food Order Page</asp:HyperLink>
                </td>
                <td style="width: 226px; text-align: right">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Order.aspx?type=drink">Go to Drink Order Page</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: left" valign="top">
                    <br />
                    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" 
                        AutoGenerateRows="False" DataKeyNames="MenuItemID" 
                        DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <Fields>
                            <asp:BoundField DataField="MenuItemID" HeaderText="MenuItemID" 
                                InsertVisible="False" ReadOnly="True" SortExpression="MenuItemID" >
                            <HeaderStyle Width="300px" />
                            <ItemStyle ForeColor="#FF3300" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MenuItemType" HeaderText="MenuItemType" 
                                SortExpression="MenuItemType" >
                            <HeaderStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ItemName" HeaderText="ItemName" 
                                SortExpression="ItemName" >
                            <HeaderStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ItemSize" HeaderText="ItemSize" 
                                SortExpression="ItemSize" >
                            <HeaderStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ItemPrice" HeaderText="ItemPrice" 
                                SortExpression="ItemPrice" >
                            <HeaderStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description" >
                            <HeaderStyle Width="300px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="GraphicFileName" 
                                SortExpression="GraphicFileName">
                                <ItemTemplate>
                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("GraphicFileName", "~/images/{0}") %>' Height="90px" Width="150px" />
                                </ItemTemplate>
                                <HeaderStyle Width="300px" />
                            </asp:TemplateField>
                        </Fields>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    </asp:DetailsView>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="width: 233px">
                    
                </td>
                <td style="width: 257px; text-align: right">
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="ShowMenu.aspx?type=food">Back to Food ShowMenu Page</asp:HyperLink>
                </td>
                <td style="width: 226px; text-align: right">
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="ShowMenu.aspx?type=drink">Back to Drink ShowMenu Page</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="SELECT * FROM [MenuItems] WHERE ([MenuItemID] = @MenuItemID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MenuItemID" QueryStringField="menuid" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
