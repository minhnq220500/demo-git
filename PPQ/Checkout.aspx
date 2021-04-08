<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="PPQ.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
        <table style="width: 471px">
            <tr>
                <td style="width: 490px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 233px">
                                        <strong>Online Orders</strong></td>
                                    <td style="width: 257px; text-align: right">
                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/YourCart.aspx">View Your Cart</asp:HyperLink></td>
                                    <td style="width: 226px; text-align: right">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Order.aspx">Back to Order Page</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: center">
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: center">
                                        <table style="width: 355px">
                                            <tr>
                                                <td nowrap="nowrap" style="width: 177px" align="left">
                                                    Full Name
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFullName"
                                                        ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                                                <td style="width: 8px">
                                                    :</td>
                                                <td style="width: 257px">
                                                    <asp:TextBox ID="txtFullName" runat="server" Width="343px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td nowrap="nowrap" style="width: 177px" align="left">
                                                    Address
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                                                        ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                                                <td style="width: 8px">
                                                    :</td>
                                                <td style="width: 257px">
                                                    <asp:TextBox ID="txtAddress" runat="server" Width="343px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td nowrap="nowrap" style="width: 177px" align="left">
                                                    Telephone
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTel"
                                                        ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                                                <td style="width: 8px">
                                                    :</td>
                                                <td style="width: 257px">
                                                    <asp:TextBox ID="txtTel" runat="server" Width="343px"></asp:TextBox></td>
                                            </tr>
                                            <!--
                                            <tr>
                                                <td align="left" nowrap="nowrap" style="width: 177px">
                                                    Email<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                                        ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                                                <td style="width: 8px">
                                                    :</td>
                                                <td style="width: 257px">
                                                    <asp:TextBox ID="txtEmail" runat="server" Width="343px"></asp:TextBox></td>
                                            </tr>
                                            -->
                                            <tr>
                                                <td nowrap="nowrap" style="width: 177px" align="left">
                                                    Contact Person
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtContact"
                                                        ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                                                <td style="width: 8px">
                                                    :</td>
                                                <td style="width: 257px">
                                                    <asp:TextBox ID="txtContact" runat="server" Width="343px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td nowrap="nowrap" style="width: 177px" valign="top" align="left">
                                                    Payment Type</td>
                                                <td style="width: 8px">
                                                    :</td>
                                                <td style="width: 257px" align="left">
                                                    <asp:DropDownList ID="ddlPayType" runat="server" Width="129px">
                                                        <asp:ListItem>Cash</asp:ListItem>
                                                        <asp:ListItem>Bank Transfer</asp:ListItem>
                                                    </asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td align="left" nowrap="nowrap" style="width: 177px" valign="top">
                                                    Decription
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDescription"
                                                        ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                                                <td style="width: 8px">
                                                    :</td>
                                                <td style="width: 257px">
                                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="343px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td nowrap="nowrap" style="width: 177px">
                                                </td>
                                                <td style="width: 8px">
                                                </td>
                                                <td style="width: 257px">
                                                    <table style="width: 346px">
                                                        <tr>
                                                            <td align="left" style="width: 133px">
                                                                <asp:Button ID="btnOrder" runat="server" Text="Order" OnClick="btnOrder_Click" Width="61px" />
                                                                <input id="Reset1" type="reset" value="Reset" /></td>
                                                            <td>
                                                            </td>
                                                            <td style="text-align: right">
                                                                <asp:Label ID="Label1" runat="server" Text="Total Amount: "></asp:Label><asp:Literal ID="Literal2" runat="server"></asp:Literal>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table><hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: center" valign="top">
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: left" valign="top">
                                        <asp:DataList ID="DataList1" runat="server"  
                                            RepeatColumns="2" RepeatDirection="Horizontal" Width="100%">
                                            <ItemTemplate>
                                                <table style="width: 218px">
                                                    <tr>
                                                        <td style="width: 73px" valign="top">
                                                        </td>
                                                        <td style="width: 73px" valign="top">
                                                            Name
                                                        </td>
                                                        <td style="width: 9px" valign="top">
                                                            :
                                                        </td>
                                                        <td style="width: 223px" valign="top">
                                                            <asp:Label ID="lblName" runat="server" Font-Bold="True" Text='<%# Bind("Name") %>'
                                                                Width="154px">
                                                            </asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 73px" valign="top">
                                                        </td>
                                                        <td style="width: 73px" valign="top">
                                                            Quantity
                                                        </td>
                                                        <td style="width: 9px" valign="top">
                                                            :
                                                        </td>
                                                        <td style="width: 223px" valign="top">
                                                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("Quantity") %>' Width="116px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 73px" valign="top">
                                                        </td>
                                                        <td style="width: 73px" valign="top">
                                                            SalesPrice
                                                        </td>
                                                        <td style="width: 9px" valign="top">
                                                            :</td>
                                                        <td style="width: 223px" valign="top">
                                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>' Width="116px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <asp:Label ID="lblID" runat="server" Font-Bold="True" Text='<%# Bind("ID") %>' Visible="False"
                                                    Width="30px">
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <hr />
                                    </td>
                                </tr>
                            </table>
                        </div>
                </td>
            </tr>
        </table>
    </div>    
</asp:Content>
