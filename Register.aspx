<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HAIR_TRAIT.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>User Registration</h2>

<br />

Name<br />
<asp:TextBox ID="txtName" runat="server"></asp:TextBox>

<br /><br />

Email<br />
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

<br /><br />

Password<br />
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

<br /><br />

Confirm Password<br />
<asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>

<br /><br />

<asp:Button
ID="btnRegister"
runat="server"
Text="Register"
OnClick="btnRegister_Click" />

<br /><br />

<asp:Label ID="lblMessage" runat="server"></asp:Label>

</asp:Content>