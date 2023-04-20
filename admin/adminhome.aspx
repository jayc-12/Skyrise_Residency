<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="adminhome.aspx.cs" Inherits="admin_admin_login_admin_home_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <div class="col-sm-6">
    <h2 class="m-0 text-dark">Dashboard</h2>        
    </div> <br /> 
    <div>
    
        <table  class="table table-bordered table-striped" align="center">
            <tr>
                    <td style="width: 382px">
                    <img alt="" src="images/icons8-building-64.png" 
                        style="width: 64px; height: 64px" height="60" width="60" />&nbsp; Towers</td>
                <td>
                     <asp:Label ID="lbltow" runat="server" Text=""></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 382px">
                    <img alt="" src="images/icons8-home-64.png" style="width: 64px; height: 64px" 
                        height="60" width="60" />&nbsp; Flats</td>
                <td>
                <asp:Label ID="lblfla" runat="server" Text=""></asp:Label>                &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 382px">
                    <img alt="" src="images/icons8-landlord-80.png" 
                        style="width: 63px; height: 64px" />&nbsp; Owners</td>
                <td>
                    <asp:Label ID="lblown" runat="server" Text=""></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 382px">
                    <img alt="" src="images/icons8-playground-50.png" 
                        style="width: 58px; height: 60px" />&nbsp;&nbsp; Facilities</td>
                <td>
                    <asp:Label ID="lblfac" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 382px">
                    <img alt="" src="images/icons8-event-accepted-64.png" 
                        style="width: 64px; height: 64px" />&nbsp; Events</td>
                <td>
                    <asp:Label ID="lbleve" runat="server" Text=""></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 382px">
                    <img alt="" src="images/icons8-city-hall-50.png" 
                        style="width: 58px; height: 56px" />&nbsp;&nbsp; Hall Bookings</td>
                <td>
                    <asp:Label ID="lblhall" runat="server" Text=""></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 382px">
                    <img alt="" src="images/icons8-receive-euro-50.png" 
                        style="width: 62px; height: 63px" />&nbsp; Grand Income</td>
                <td>
                    <asp:Label ID="lbltoin" runat="server" Text=""></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 382px">
                    <img alt="" src="images/icons8-transaction-list-64.png" 
                        style="width: 64px; height: 64px" /> Grand Expense</td>
                <td>
                    <asp:Label ID="lbltoex" runat="server" Text=""></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 382px">
                    <img alt="" src="images/icons8-reserve-50.png" 
                        style="width: 62px; height: 64px" />&nbsp; Balance</td>
                <td>
                   <asp:Label ID="lblbal" runat="server" Text=""></asp:Label> &nbsp;</td>
            </tr>
        </table>
    
    </div>

    </div>

    </div>

</asp:Content>

