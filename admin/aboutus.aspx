<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="aboutus.aspx.cs" Inherits="admin_aboutus" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="Form1" runat="server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">About Us</h2>
        <p>&nbsp;</p>
    </div>
<div class="fckeditor">
<FCKeditorV2:FCKeditor ID="fck1" BasePath="../fckeditor/" runat="server" 
        Height="400px">

</FCKeditorV2:FCKeditor>
 </div>
 <div class="btnsave">
 <asp:Button ID="btnasave" class="btn btn-primary" runat="server" 
                            Text="Save" onclick="btnasave_Click" />
 </div>
 </form>
</asp:Content>

