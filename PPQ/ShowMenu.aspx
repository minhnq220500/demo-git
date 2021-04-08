<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="ShowMenu.aspx.cs" Inherits="PPQ.ShowMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
        DataKeyField="MenuItemID" HorizontalAlign="Center" Width="100%" 
        RepeatColumns="2" CellPadding="15">
		<FooterStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
			Font-Underline="False" HorizontalAlign="Center" />
		<ItemStyle BackColor="White" Font-Bold="False" Font-Italic="False" Font-Overline="False"
			Font-Strikeout="False" Font-Underline="False" ForeColor="#284775" />
		<SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
			Font-Underline="False" HorizontalAlign="Center" />
		
		<SeparatorTemplate>
			<br />
		</SeparatorTemplate>
		<ItemTemplate>
		    <asp:Image ID="Image4" runat="server" ImageAlign="Left" ImageUrl='<%# Eval("GraphicFileName", "images/{0}") %>' 
            AlternateText='<%# Eval("ItemName") %>' Height="100" Width="135" style="margin: 10px 5px 5px 5px" />
            <b>ItemName:</b>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("MenuItemID","ShowMenuDetails.aspx?menuid={0}") %>' 
                Text='<%# Eval("ItemName") %>' ForeColor="#FF3300">
                </asp:HyperLink><br />
            <b>Description:</b>
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' /><br />
            <b>ItemSize:</b>
            <asp:Label ID="ItemSizeLabel" runat="server" Text='<%# Eval("ItemSize") %>' /><br />
            <b>ItemPrice:</b>
            <asp:Label ID="ItemPriceLabel" runat="server" Text='<%# Eval("ItemPrice") %>' /><br />
		</ItemTemplate>
		<FooterTemplate>
			<br />
		</FooterTemplate>
	</asp:DataList>   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="SELECT * FROM [MenuItems] WHERE ([MenuItemType] = @MenuItemType)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MenuItemType" QueryStringField="type" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
