<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="PPQ.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/YourCart.aspx" Width="222px">View Your Shopping Cart</asp:HyperLink>
    <%--<asp:Literal ID="Literal1" runat="server"></asp:Literal>--%>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <div align="center">
        <table>
            <tr>
                <td valign="top" align="center">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="MenuItemID" 
                    DataSourceID="SqlDataSource2" OnItemCommand="DataList1_ItemCommand"
                    RepeatColumns="4" RepeatDirection="Horizontal" 
                        OnItemDataBound="DataList1_ItemDataBound" HorizontalAlign="Center" 
                        CellPadding="15" CellSpacing="0" Width="100%">
                    <ItemTemplate>
                        <!--<table style="width: 238px" align="center">-->
                        <table align="center" width="100%">
                            <tr>
                                <asp:Image ID="Image1" runat="server" ImageAlign="Middle" style="margin: 5px 5px 8px 5px"
                                ImageUrl='<%# Eval("GraphicFileName", "images/{0}") %>' AlternateText='<%# Eval("ItemName") %>' Height="100px" Width="100px"/>
                                <td style="width: 73px" valign="top" align="left">
                                    <b>ItemName</b>
                                </td>
                                <td style="width: 9px" valign="top">
                                    :
                                </td>
                                <td style="width: 257px" valign="top" align="left">
                                    <asp:Label ID="lblID" runat="server" Font-Bold="True" Text='<%# Bind("MenuItemID") %>'
                                    Width="30px" Visible="False"></asp:Label>
                                    <asp:HyperLink ID="hyperLinkName" runat="server" Width="129px" Text='<%# Bind("ItemName") %>' Font-Bold="True"></asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 73px" valign="top" align="left">
                                    ItemSize
                                </td>
                                <td style="width: 9px" valign="top">
                                    :
                                </td>
                                <td style="width: 257px" valign="top" align="left">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemSize") %>' Width="130px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 73px" valign="top" align="left">
                                    SalesPrice
                                </td>
                                <td style="width: 9px" valign="top">
                                    :
                                </td>
                                <td style="width: 257px" valign="top" align="left">
                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("ItemPrice") %>' Width="116px" ForeColor="#FF3300"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/cartIcon.gif" ImageAlign="Baseline" />
                        <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" Width="90" />
                        <br />
                    </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="SELECT * FROM [MenuItems] WHERE ([MenuItemType] = @MenuItemType)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MenuItemType" QueryStringField="type" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="sp_Select_MenuItems" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Direction="InputOutput" Name="MenuItemType" 
                QueryStringField="type" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
