<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="allow.aspx.cs" Inherits="admin_allow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
    <h1> Allow Users </h1>
    </div>
    <form runat="server">

    <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkallow" Text="Allow user" runat="server" />
    
    <br />
    <br />
    <table class="w-100">
        <tr>
            <td>
                Owner Id</td>
            <td>
                <asp:TextBox ID="txtname" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Owner Emailid</td>
            <td>
                <asp:TextBox ID="txtemail" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Send" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblallow" runat="server" Text="allow" Visible="false"></asp:Label>
    </form>
</asp:Content>

