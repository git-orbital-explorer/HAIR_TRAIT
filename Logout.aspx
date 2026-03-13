<%@ Page Title="Logout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="HAIR_TRAIT.Logout" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:LinkButton
ID="lnkLogout"
runat="server"
OnClick="lnkLogout_Click"
OnClientClick="return confirm('Are you sure you want to logout?');">
Logout
</asp:LinkButton>
</asp:Content>