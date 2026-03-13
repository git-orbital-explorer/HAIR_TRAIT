<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HAIR_TRAIT._Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
.hero{
    text-align:center;
    padding:60px;
}

.hero h1{
    color:#2C6E63;
    font-size:40px;
}

.hero p{
    font-size:18px;
    margin-top:10px;
}

.btn-services{
    margin-top:25px;
    padding:12px 25px;
    background-color:#2C6E63;
    color:white;
    border:none;
    font-size:16px;
    cursor:pointer;
}

.btn-services:hover{
    background-color:#1f5048;
}
</style>

<div class="hero">

<h1>Welcome to Hair Trait</h1>

<p>
Professional hair care product for everyone.
</p>

<asp:Button 
ID="btnServices"
runat="server"
Text="View our Products"
CssClass="btn-services"
OnClick="btnServices_Click"/>

</div>

</asp:Content>