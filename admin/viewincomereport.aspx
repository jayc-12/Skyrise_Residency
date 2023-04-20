<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="viewincomereport.aspx.cs" Inherits="admin_viewincomereport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="headline">
<h2>Income Reports</h2>
</div><br />
<div class="row text-center pad-top">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                      <asp:HyperLink ID="HyperLink3" runat="server" 
                              NavigateUrl ="~/admin/maintereport.aspx" ForeColor="#6600FF"><img src="report%20image/report1.png" height="150px" width="150px" />
                      <h4>Maintenance Income Report</h4></asp:HyperLink>
 
                      
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                      <asp:HyperLink ID="HyperLink4" runat="server" 
                              NavigateUrl ="~/admin/eventinreport.aspx" ForeColor="#6600FF"> <img src="report%20image/report2.png" height="150px" width="150px" />
                      <h4>Event Income Report</h4></asp:HyperLink>
                      
                      </div>
                     
                     
                  </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                      <asp:HyperLink ID="HyperLink5" runat="server" 
                              NavigateUrl ="~/admin/hallinreport.aspx" ForeColor="#6600FF" ><img src="report%20image/report3.png" height="150px" width="150px" />
                      <h4>Hall Income Report</h4></asp:HyperLink>
 
                      
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                      <asp:HyperLink ID="HyperLink6" runat="server" 
                              NavigateUrl ="~/admin/transferinreport.aspx" ForeColor="#6600FF" ><img src="report%20image/report4.png" height="150px" width="150px" />
                      <h4>Transfer Income Report</h4></asp:HyperLink>
 
                      
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                      <asp:HyperLink ID="HyperLink7" runat="server" 
                              NavigateUrl ="~/admin/miscinreport.aspx" ForeColor="#6600FF"  ><img src="report%20image/report5.png" height="150px" width="150px" />
                      <h4>Miscellaneous Income Report</h4></asp:HyperLink>
 
                      
                      </div>
                     
                     
                  </div>
              </div>    

          
</asp:Content>

