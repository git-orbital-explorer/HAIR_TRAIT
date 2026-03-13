<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HAIR_TRAIT.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>Login</h2>

Email<br />
<asp:TextBox
ID="txtEmail"
runat="server"
autocomplete="off">
</asp:TextBox>

<br /><br />

Password<br />
<asp:TextBox
ID="txtPassword"
runat="server"
TextMode="Password"
autocomplete="off">
</asp:TextBox>

<br /><br />

Login Type<br />

<asp:RadioButtonList
ID="rblRole"
runat="server">

<asp:ListItem Value="user" Selected="True">User</asp:ListItem>
<asp:ListItem Value="admin">Admin</asp:ListItem>

</asp:RadioButtonList>

<br />

<asp:Button
ID="btnLogin"
runat="server"
Text="Login"
OnClick="btnLogin_Click" />

<br /><br />

<asp:Label ID="lblMessage" runat="server"></asp:Label>

</asp:Content>
