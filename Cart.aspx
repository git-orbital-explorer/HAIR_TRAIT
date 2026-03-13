<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="HAIR_TRAIT.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>Your Cart</h2>

<asp:GridView 
    ID="GridViewCart" 
    runat="server" 
    AutoGenerateColumns="false" 
    OnRowCommand="GridViewCart_RowCommand"
    CssClass="cart-grid">
    <Columns>
        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image 
                    ID="imgCart" 
                    runat="server" 
                    ImageUrl='<%# Eval("ImageURL") %>' 
                    Width="80px" Height="80px" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="ServiceName" HeaderText="Product Name" />
        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />

        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button 
                    ID="btnRemove" 
                    runat="server" 
                    CommandName="RemoveItem" 
                    CommandArgument='<%# Eval("ServiceID") %>'
                    Text="Remove" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<br />
<asp:Label ID="lblTotal" runat="server" Font-Bold="True" />

<br /><br />
<asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />

</asp:Content>