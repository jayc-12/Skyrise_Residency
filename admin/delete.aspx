<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="delete.aspx.cs" Inherits="admin_delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
    <h1> Delete Users </h1>
    </div>
    <form id="Form1" runat="server">

    <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkallow" Text="Delete user" runat="server" />
    
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
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Delete" />
            </td>
        </tr>
    </table>
    <%--<asp:Label ID="lblallow" runat="server" Text="allow" Visible="false"></asp:Label>--%>
    </form>

</asp:Content>

