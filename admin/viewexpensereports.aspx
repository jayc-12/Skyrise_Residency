<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="viewexpensereports.aspx.cs" Inherits="admin_viewexpensereports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="headline">
<h2>Expense Reports</h2>
</div><br />
<div class="row text-center pad-top">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                      <asp:HyperLink ID="HyperLink3" runat="server" 
                              NavigateUrl ="~/admin/eventexreport.aspx" ForeColor="#6600FF" ><img src="report%20image/report1.png" height="150px" width="150px" />
                      <h4>Event Expense Report</h4></asp:HyperLink>
 
                      
                      </div>
                     
                     
                  </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                      <asp:HyperLink ID="HyperLink5" runat="server" 
                              NavigateUrl ="~/admin/salaryexreport.aspx" ForeColor="#6600FF" ><img src="report%20image/report3.png" height="150px" width="150px" />
                      <h4>Salary Expense Report</h4></asp:HyperLink>
 
                      
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                      <asp:HyperLink ID="HyperLink7" runat="server" 
                              NavigateUrl ="~/admin/miscexreport.aspx" ForeColor="#6600FF" ><img src="report%20image/report5.png" height="150px" width="150px" />
                      <h4>Miscellaneous Expense Report</h4></asp:HyperLink>
 
                      
                      </div>
                     
                     
                  </div>
              </div>    
</asp:Content>

