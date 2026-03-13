<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="HAIR_TRAIT.Payment" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="max-width:500px; margin:auto; padding:20px; border:1px solid #D0D5CE; border-radius:10px; background:#EFECE9;">
        <h2 style="text-align:center; color:#192524;">Payment Details</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>

        <asp:Panel ID="pnlPayment" runat="server">

            <asp:Label Text="Select Payment Method:" runat="server"></asp:Label><br />
            <asp:RadioButtonList ID="rblPaymentType" runat="server">
                <asp:ListItem>Credit Card</asp:ListItem>
                <asp:ListItem>Debit Card</asp:ListItem>
                <asp:ListItem>UPI</asp:ListItem>
                <asp:ListItem>Cash on Delivery</asp:ListItem>
            </asp:RadioButtonList>
            <br />

            <asp:Label Text="Name on Card / UPI:" runat="server"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="input-box" /><br /><br />

            <asp:Label Text="Card Number (Dummy):" runat="server"></asp:Label>
            <asp:TextBox ID="txtCardNumber" runat="server" CssClass="input-box" /><br /><br />

            <asp:Label Text="Expiry (MM/YY):" runat="server"></asp:Label>
            <asp:TextBox ID="txtExpiry" runat="server" CssClass="input-box" Width="100px" />

            <asp:Label Text="CVV:" runat="server" style="margin-left:10px;"></asp:Label>
            <asp:TextBox ID="txtCVV" runat="server" CssClass="input-box" Width="50px" /><br /><br />

            <asp:Button ID="btnPay" runat="server" Text="Confirm Payment" OnClick="btnPay_Click" CssClass="btn-primary" />

        </asp:Panel>
    </div>

</asp:Content>