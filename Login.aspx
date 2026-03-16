<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HAIR_TRAIT.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

/* PAGE BACKGROUND */

.login-wrapper{
    display:flex;
    justify-content:center;
    align-items:center;
    padding:60px 0;
}

/* LOGIN CARD */

.login-card{
    width:400px;
    background:white;
    padding:35px;
    border-radius:8px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

/* TITLE */

.login-card h2{
    text-align:center;
    margin-bottom:25px;
    color:#2C6E63;
}

/* INPUT LABELS */

.form-label{
    font-weight:600;
    display:block;
    margin-bottom:5px;
}

/* TEXTBOX */

.input-box{
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
}

/* RADIO LIST */

.role-select{
    margin-top:5px;
}

/* BUTTON */

.login-btn{
    width:100%;
    padding:12px;
    background-color:#2C6E63;
    color:white;
    border:none;
    border-radius:5px;
    font-size:16px;
    cursor:pointer;
}

.login-btn:hover{
    background-color:#1f5048;
}

/* MESSAGE */

.message{
    margin-top:15px;
    text-align:center;
    font-weight:600;
    color:red;
}

</style>


<div class="login-wrapper">

<div class="login-card">

<h2>Login</h2>


<span class="form-label">Email</span>

<asp:TextBox
ID="txtEmail"
runat="server"
CssClass="input-box"
autocomplete="off">
</asp:TextBox>

<br /><br />


<span class="form-label">Password</span>

<asp:TextBox
ID="txtPassword"
runat="server"
CssClass="input-box"
TextMode="Password"
autocomplete="off">
</asp:TextBox>

<br /><br />


<span class="form-label">Login Type</span>

<asp:RadioButtonList
ID="rblRole"
runat="server"
CssClass="role-select"
RepeatDirection="Horizontal">

<asp:ListItem Value="user" Selected="True">User</asp:ListItem>
<asp:ListItem Value="admin">Admin</asp:ListItem>

</asp:RadioButtonList>

<br /><br />


<asp:Button
ID="btnLogin"
runat="server"
Text="Login"
CssClass="login-btn"
OnClick="btnLogin_Click" />

<br /><br />


<asp:Label
ID="lblMessage"
runat="server"
CssClass="message">
</asp:Label>


</div>

</div>

</asp:Content>