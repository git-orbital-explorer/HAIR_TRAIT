<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="HAIR_TRAIT.Services" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

.gridView
{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}

.gridView th
{
    background:#2C6E63;
    color:white;
    padding:10px;
}

.gridView td
{
    padding:10px;
    border-bottom:1px solid #ddd;
}

.gridView img
{
    border-radius:6px;
    border:1px solid #ccc;
}

.inputText
{
    width:250px;
    padding:8px;
}

.btnPrimary
{
    padding:10px 20px;
    background:#2C6E63;
    color:white;
    border:none;
    border-radius:4px;
    cursor:pointer;
}

.btnPrimary:hover
{
    background:#1f5048;
}

</style>


<h2>Our Products</h2>


<!-- Admin Product Add Panel -->

<asp:Panel 
ID="pnlAddProduct" 
runat="server" 
Visible="false"
Style="margin-bottom:20px; padding:15px; border:1px solid #ccc; border-radius:6px;">

<h3>Add New Product</h3>

<asp:Label ID="lblMessage" runat="server" /><br /><br />

<asp:TextBox 
ID="txtServiceName" 
runat="server" 
placeholder="Product Name" 
CssClass="inputText" />

<br /><br />

<asp:TextBox 
ID="txtPrice" 
runat="server" 
placeholder="Price" 
CssClass="inputText" />

<br /><br />

<asp:TextBox 
ID="txtDescription" 
runat="server" 
placeholder="Description"
CssClass="inputText"
TextMode="MultiLine"
Rows="3" />

<br /><br />

<asp:TextBox 
ID="txtImageURL" 
runat="server" 
placeholder="Image URL"
CssClass="inputText" />

<br /><br />

<asp:Button 
ID="btnAddProduct"
runat="server"
Text="Add Product"
OnClick="btnAddProduct_Click"
CssClass="btnPrimary" />

</asp:Panel>


<!-- PRODUCT GRID -->

<asp:GridView 
ID="GridViewProduct"
runat="server"
AutoGenerateColumns="False"
DataKeyNames="ServiceID"
OnRowCommand="GridViewProduct_RowCommand"
CssClass="gridView">

<Columns>

<asp:TemplateField HeaderText="Image">

<ItemTemplate>

<asp:Image
ID="imgProduct"
runat="server"
ImageUrl='<%# Eval("ImageURL") %>'
Width="90px"
Height="90px" />

</ItemTemplate>

</asp:TemplateField>


<asp:BoundField
DataField="ServiceName"
HeaderText="Product" />


<asp:BoundField
DataField="Price"
HeaderText="Price"
DataFormatString="{0:C}" />


<asp:BoundField
DataField="Description"
HeaderText="Description" />


<asp:TemplateField HeaderText="Action">

<ItemTemplate>

<asp:Button
ID="btnAddToCart"
runat="server"
Text="Add to Cart"
CommandName="AddToCart"
CommandArgument='<%# Container.DataItemIndex %>' />

</ItemTemplate>

</asp:TemplateField>

</Columns>

</asp:GridView>

</asp:Content>