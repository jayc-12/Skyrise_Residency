<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="facility_review.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
 <div class="col-sm-6">
    <h2 class="m-0 text-dark">Facility Review details</h2>
        <p>&nbsp;</p>
    </div>
                         <div class="table-responsive">
                             <asp:GridView ID="GridView1" runat="server" 
                                 class="table table-bordered table-striped" AutoGenerateColumns="False" 
                                 DataKeyNames="reviewid" DataSourceID="SqlDataSource1">
                                 <Columns>
                                     <asp:BoundField DataField="reviewid" HeaderText="reviewid" 
                                         InsertVisible="False" ReadOnly="True" SortExpression="reviewid" Visible="false" />
                                         <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" />
                                           <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                         SortExpression="flatno" />
                                           <asp:BoundField DataField="facility_type" HeaderText="facility_type" 
                                         SortExpression="facility_type" />
                                   
                                     <asp:BoundField DataField="reviewtitle" HeaderText="reviewtitle" 
                                         SortExpression="reviewtitle" />
                                     <asp:BoundField DataField="reviewmsg" HeaderText="reviewmsg" 
                                         SortExpression="reviewmsg" />
                                   
                                   
                                     <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                                     
                                     <asp:CommandField ShowDeleteButton="True" />
                                 </Columns>
                             </asp:GridView> 
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                 DeleteCommand="DELETE FROM facility_review WHERE (reviewid = @reviewid)" 
                                 SelectCommand="SELECT facility_review.reviewid, facility_review.reviewtitle, facility_review.reviewmsg, facility_mstr.facility_type, flat.flatno, facility_review.date, tower.tname FROM facility_review INNER JOIN facility_mstr ON facility_review.facilityid = facility_mstr.facilityid INNER JOIN flat ON facility_review.fid = flat.fid INNER JOIN tower ON flat.tid = tower.tid">
                                 <DeleteParameters>
                                     <asp:Parameter Name="reviewid" />
                                 </DeleteParameters>
                             </asp:SqlDataSource>
                         </div>
    </form>
</asp:Content>

