<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="YourCart.aspx.cs" Inherits="PPQ.YourCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
            <table>
                <tr>
                    <td style="width: 233px">
                        <strong>Your Shopping Cart</strong>
                    </td>
                    <td style="width: 220px">
                    </td>
                    <td style="width: 225px; text-align: right">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Order.aspx">Back to Order Page</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
                        <hr />
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: left">
                        <br />
                        <asp:DataList ID="DataList1" runat="server" OnDeleteCommand="DataList1_DeleteCommand"
                            RepeatColumns="2" RepeatDirection="Horizontal" Width="100%">
                            <ItemTemplate>
                                <table style="width: 218px">
                                    <tr>
                                        <td style="width: 73px" valign="top">
                                            <asp:CheckBox ID="chkID" runat="server" />
                                        </td>
                                        <td style="width: 73px" valign="top">
                                            ID
                                        </td>
                                        <td style="width: 9px" valign="top">
                                            :
                                        </td>
                                        <td style="width: 223px" valign="top">
                                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>' 
                                                Width="30px" ForeColor="#FF3300"></asp:Label>
                                        </td>
                                    </tr>

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
                                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'
                                                Width="154px"></asp:Label>
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
                                            <asp:TextBox ID="txtQuantity" runat="server" MaxLength="3" Text='<%# Bind("Quantity") %>' Width="58px"></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtQuantity"
                                                ErrorMessage="*" Operator="DataTypeCheck" Type="Integer">
                                            </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 73px" valign="top">
                                        </td>
                                        <td style="width: 73px" valign="top">
                                            SalesPrice
                                        </td>
                                        <td style="width: 9px" valign="top">
                                            :
                                        </td>
                                        <td style="width: 223px" valign="top">
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>' Width="116px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Button ID="btnDelete" runat="server" Text="Remove" CommandName="Delete" />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" />&nbsp;&nbsp;&nbsp;
                    </td>
                    <td> 
                        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" />
                        <asp:Button ID="btnEmpty" runat="server" OnClick="btnEmpty_Click" Text="Empty" />
                    </td>
                    <td style="width: 225px">
                        <asp:Button ID="btnCheckOut" runat="server" PostBackUrl="~/Checkout.aspx" Text="Check Out" UseSubmitBehavior="False" /><br />
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
