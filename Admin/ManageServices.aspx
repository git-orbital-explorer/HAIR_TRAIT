<%@ Page Title="Manage Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageServices.aspx.cs" Inherits="HAIR_TRAIT.Admin.ManageServices" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="admin-wrapper">

    <h2 class="page-title">Admin - Manage Products</h2>

    <!-- Add Product Panel -->
    <div class="form-card">

        <h3>Add New Product</h3>

        <div class="form-group">
            <label>Product Name</label>
            <asp:TextBox ID="txtServiceName" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Price</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Description</label>
            <asp:TextBox 
                ID="txtDescription" 
                runat="server"
                CssClass="form-input"
                TextMode="MultiLine"
                Rows="3">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <label>Upload Image</label>
            <asp:FileUpload ID="fuImage" runat="server" CssClass="file-input" />
        </div>

        <asp:Button 
            ID="btnAddService"
            runat="server"
            Text="Add Product"
            CssClass="btn-primary"
            OnClick="btnAddService_Click" />

        <br /><br />

        <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

    </div>


    <!-- Product Table -->
    <div class="table-card">

        <h3>Existing Products</h3>

        <asp:GridView 
            ID="GridViewServices"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="product-table"
            OnRowCommand="GridViewServices_RowCommand">

            <Columns>

                <asp:BoundField DataField="ServiceID" HeaderText="ID" />

                <asp:BoundField DataField="ServiceName" HeaderText="Product Name" />

                <asp:BoundField DataField="Price" HeaderText="Price" />

                <asp:BoundField DataField="Description" HeaderText="Description" />

                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <img 
                            src='<%# ResolveUrl("~/" + Eval("ImageURL")) %>' 
                            class="product-image"/>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button
                            ID="btnDelete"
                            runat="server"
                            Text="Delete"
                            CssClass="btn-delete"
                            CommandName="DeleteService"
                            CommandArgument='<%# Eval("ServiceID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>

</div>


<style>

.admin-wrapper{
    max-width:1100px;
    margin:auto;
}

.page-title{
    margin-bottom:20px;
    font-size:26px;
}

.form-card{
    background:white;
    padding:25px;
    border-radius:8px;
    box-shadow:0 3px 10px rgba(0,0,0,0.08);
    margin-bottom:30px;
}

.form-group{
    margin-bottom:15px;
    display:flex;
    flex-direction:column;
}

.form-group label{
    font-weight:bold;
    margin-bottom:5px;
}

.form-input{
    padding:8px;
    border:1px solid #ccc;
    border-radius:5px;
    width:350px;
}

.file-input{
    padding:6px;
}

.btn-primary{
    background:#2b7cff;
    color:white;
    border:none;
    padding:10px 18px;
    border-radius:5px;
    cursor:pointer;
    font-weight:bold;
}

.btn-primary:hover{
    background:#1f60c7;
}

.message-label{
    font-weight:bold;
}

.table-card{
    background:white;
    padding:25px;
    border-radius:8px;
    box-shadow:0 3px 10px rgba(0,0,0,0.08);
}

.product-table{
    width:100%;
    border-collapse:collapse;
    margin-top:15px;
}

.product-table th{
    background:#333;
    color:white;
    padding:10px;
    text-align:left;
}

.product-table td{
    padding:10px;
    border-bottom:1px solid #ddd;
}

.product-table tr:hover{
    background:#f5f5f5;
}

.product-image{
    width:90px;
    height:90px;
    object-fit:cover;
    border-radius:6px;
    border:1px solid #ccc;
}

.btn-delete{
    background:#e74c3c;
    border:none;
    color:white;
    padding:6px 12px;
    border-radius:4px;
    cursor:pointer;
}

.btn-delete:hover{
    background:#c0392b;
}

</style>

</asp:Content>