<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HAIR_TRAIT.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

/* PAGE WRAPPER */

.register-wrapper{
    display:flex;
    justify-content:center;
    align-items:center;
    padding:60px 0;
}

/* REGISTER CARD */

.register-card{
    width:420px;
    background:white;
    padding:35px;
    border-radius:8px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

/* TITLE */

.register-card h2{
    text-align:center;
    margin-bottom:25px;
    color:#2C6E63;
}

/* LABELS */

.form-label{
    font-weight:600;
    display:block;
    margin-bottom:6px;
}

/* TEXTBOX STYLE */

.input-box{
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
}

/* REGISTER BUTTON */

.register-btn{
    width:100%;
    padding:12px;
    background-color:#2C6E63;
    color:white;
    border:none;
    border-radius:5px;
    font-size:16px;
    cursor:pointer;
}

.register-btn:hover{
    background-color:#1f5048;
}

/* MESSAGE */

.message{
    margin-top:15px;
    text-align:center;
    font-weight:600;
}

</style>


<div class="register-wrapper">

<div class="register-card">

<h2>User Registration</h2>

<br />

<span class="form-label">Name</span>

<asp:TextBox
ID="txtName"
runat="server"
CssClass="input-box">
</asp:TextBox>

<br /><br />


<span class="form-label">Email</span>

<asp:TextBox
ID="txtEmail"
runat="server"
CssClass="input-box">
</asp:TextBox>

<br /><br />


<span class="form-label">Password</span>

<asp:TextBox
ID="txtPassword"
runat="server"
TextMode="Password"
CssClass="input-box">
</asp:TextBox>

<br /><br />


<span class="form-label">Confirm Password</span>

<asp:TextBox
ID="txtConfirmPassword"
runat="server"
TextMode="Password"
CssClass="input-box">
</asp:TextBox>

<br /><br />


<asp:Button
ID="btnRegister"
runat="server"
Text="Register"
CssClass="register-btn"
OnClick="btnRegister_Click" />

<br /><br />


<asp:Label
ID="lblMessage"
runat="server"
CssClass="message">
</asp:Label>


</div>

</div>

</asp:Content>