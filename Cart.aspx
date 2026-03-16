<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="HAIR_TRAIT.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

/* CART PAGE WRAPPER */

.cart-wrapper{
    padding:20px;
}

/* TITLE */

.cart-title{
    font-size:28px;
    color:#2C6E63;
    margin-bottom:20px;
}

/* GRID STYLE */

.cart-grid{
    width:100%;
    border-collapse:collapse;
    background:white;
    border-radius:6px;
    overflow:hidden;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);
}

/* HEADER */

.cart-grid th{
    background:#2C6E63;
    color:white;
    padding:12px;
    text-align:left;
}

/* ROWS */

.cart-grid td{
    padding:12px;
    border-bottom:1px solid #eee;
}

/* IMAGE */

.cart-grid img{
    border-radius:6px;
    border:1px solid #ddd;
}

/* REMOVE BUTTON */

.remove-btn{
    background:#d9534f;
    color:white;
    border:none;
    padding:6px 12px;
    border-radius:4px;
    cursor:pointer;
}

.remove-btn:hover{
    background:#c9302c;
}

/* TOTAL */

.total-box{
    font-size:18px;
    font-weight:bold;
    margin-top:15px;
}

/* CHECKOUT BUTTON */

.checkout-btn{
    background:#2C6E63;
    color:white;
    border:none;
    padding:12px 25px;
    font-size:16px;
    border-radius:5px;
    cursor:pointer;
}

.checkout-btn:hover{
    background:#1f5048;
}

</style>



<div class="cart-wrapper">

<h2 class="cart-title">Your Cart</h2>

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
                    Width="80px" 
                    Height="80px" />

            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField 
            DataField="ServiceName" 
            HeaderText="Product Name" />

        <asp:BoundField 
            DataField="Price" 
            HeaderText="Price" 
            DataFormatString="{0:C}" />

        <asp:BoundField 
            DataField="Quantity" 
            HeaderText="Quantity" />

        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>

                <asp:Button 
                    ID="btnRemove" 
                    runat="server" 
                    CommandName="RemoveItem" 
                    CommandArgument='<%# Eval("ServiceID") %>'
                    Text="Remove"
                    CssClass="remove-btn" />

            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

</asp:GridView>


<br />

<div class="total-box">

<asp:Label 
ID="lblTotal" 
runat="server" 
Font-Bold="True" />

</div>


<br /><br />

<asp:Button 
ID="btnCheckout" 
runat="server" 
Text="Checkout" 
CssClass="checkout-btn"
OnClick="btnCheckout_Click" />

</div>

</asp:Content>