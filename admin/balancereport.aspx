<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="balancereport.aspx.cs" Inherits="admin_balancereport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Balance Report</h2>
        <p>&nbsp;</p>
    </div><br />
<form runat="server">
<div class="col-lg-4 col-md-4">
                        <div class="form-group"> 
                        <table width ="700" align="center">
                        
                        <tr>
                        
                         <td colspan="2"><label> <font size="5"><b>TOTAL INCOME</b></font></label></td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <td colspan ="2"><label> <font size="5"><b>TOTAL EXPENSE</b></font></label></td>
                         </tr><tr><td colspan ="5">&nbsp;</td></tr>
                         <tr>
                         <td><label> 1. MAINTENANCE:</label></td>
                         <td> <asp:TextBox ID="txtmaininc" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <td><label>1. EVENTS:</label></td>
                         <td><asp:TextBox ID="txteveexp" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         </tr>
                           <tr>
                         <td><label> 2. EVENTS:</label></td>
                         <td> <asp:TextBox ID="txteveinc" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <td><label>2. SALARY:</label></td>
                         <td><asp:TextBox ID="txtsalexp" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         </tr>
                       <tr>
                         <td><label>3. HALL:</label></td>
                         <td> <asp:TextBox ID="txthallinc" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <td><label>3.MISCELANEOUS:</label></td>
                         <td><asp:TextBox ID="txtmisexp" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         </tr>
                         <tr>
                         <td><label>4. TRANSFER:</label></td>
                         <td> <asp:TextBox ID="txttrainc" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         </tr>
                       
                       <tr>
                         <td><label>5.MISCELLANEOUS:</label></td>
                         <td> <asp:TextBox ID="txtmiscinc" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         </tr>
                         <tr><td colspan ="5">&nbsp;</td></tr>
                       <tr>
                         <td><label>GRAND TOTAL:</label></td>
                         <td> <asp:TextBox ID="txtgtinc" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <td><label>GRAND TOTAL:</label></td>
                         <td><asp:TextBox ID="txtgtexp" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         </tr>
                        <tr><td colspan ="5">&nbsp;</td></tr>
                        <tr>
                         <td><label>BALANCE:</label></td>
                         <td> <asp:TextBox ID="txtbal" runat="server" class="form-control" ReadOnly="true" ></asp:TextBox></td>
                         </tr>
                       
                         </table>
           </div> 
          </div> 
</div> 
</form>
</asp:Content>

