<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="facilityreview.aspx.cs" Inherits="user_facilityreview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="h2">
Facility Review
</div><br /><br />
                <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <div class="form-group">
                <asp:Label ID ="lblhdtname" runat="server" Text="Tower Name:" ></asp:Label><br />
                        <asp:Label ID="lbltname" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                   <div class="form-group">
                <asp:Label ID ="Label1" runat="server" Text="Flat No:" ></asp:Label><br />
                        <asp:Label ID="lblflatno" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                   <div class="form-group">
                <asp:Label ID ="Label3" runat="server" Text="Owner Name:" ></asp:Label><br />
                        <asp:Label ID="lblownname" runat="server" Text="" class="form-control" 
                        Width="600px"></asp:Label>
                                   </div>
                                   <div class="form-group">
                <asp:Label ID ="Label2" runat="server" Text="Facility Type:" ></asp:Label><br />
                                       <asp:DropDownList ID="drpfacitype" runat="server" class="form-control" 
                                           Width="600px">
                                       </asp:DropDownList>
                                   </div>
                                    <div class="form-group">
                <asp:Label ID ="Label4" runat="server" Text="Facility Review Title:" ></asp:Label><br />
                                        <asp:TextBox ID="txtfacirevtitle" runat="server" Width="600px" class="form-control"  placeholder="Facility Review Title"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="rqvfacirevtitle" runat="server" ErrorMessage="Enter Facility Review Title" ControlToValidate="txtfacirevtitle" ValidationGroup="1"></asp:RequiredFieldValidator>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="true" TargetControlID="txtfacirevtitle" FilterType="Custom,LowercaseLetters,UppercaseLetters" ValidChars=" "  />
                                   </div>             
                <div class="form-group">
                <asp:Label ID ="Label5" runat="server" Text="Facility Review Message:" ></asp:Label><br />
                                        <asp:TextBox ID="txtfacirevmessage" runat="server" Width="600px" placeholder="Facility Review Message" TextMode="MultiLine"></asp:TextBox><br />
                                   <asp:RequiredFieldValidator ID="rqvtxtfacirevmessage" runat="server" ErrorMessage="Enter Facility Review Message" ControlToValidate="txtfacirevmessage" ValidationGroup="1"></asp:RequiredFieldValidator>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="true" TargetControlID="txtfacirevmessage" FilterType="Custom,LowercaseLetters,UppercaseLetters" ValidChars=" "  />
                                  </div>
                                               
                                  <div class="form-group">
                      <asp:Button ID="Button1" runat="server" Text="SEND" class="genric-btn primary" 
                                          onclick="Button1_Click" ValidationGroup="1" />
                  </div>   
                   <asp:Label ID="lblmsg" runat="server" Text="" class="form-control"></asp:Label>
                  <asp:Label ID="lblfid" runat="server" Text="" class="form-control" Visible ="false" ></asp:Label>       
                  
                  <div class="form-group">
                        <div class="table-responsive">
                        <asp:GridView ID="grid1" runat="server" 
                                        CssClass="table table-striped table-bordered table-hover" 
                                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                                        DataKeyNames="reviewid" AllowPaging="True" AllowSorting="True" >
                                         <Columns>
                                            <asp:BoundField DataField="reviewid" HeaderText="reviewid" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="reviewid" Visible="false" />
                                                 <asp:BoundField DataField="facility_type" HeaderText="facility_type" 
                                                SortExpression="facility_type" ReadOnly="true" />
                                                <asp:BoundField DataField="reviewtitle" HeaderText="reviewtitle" 
                                                SortExpression="reviewtitle"/>
                                            <asp:BoundField DataField="reviewmsg" HeaderText="reviewmsg" 
                                                SortExpression="reviewmsg" />                                          
                                            <asp:BoundField DataField="flatno" HeaderText="flatno" 
                                                SortExpression="flatno" ReadOnly="true" />                                           
                                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" ReadOnly="true" />
                                             <asp:CommandField ShowEditButton="True" />
                                        </Columns>                          
                                        </asp:GridView>

                                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"                                    
                                         SelectCommand="SELECT facility_review.reviewid, facility_review.reviewtitle, facility_review.reviewmsg, facility_mstr.facility_type, flat.flatno, facility_review.date FROM facility_review INNER JOIN facility_mstr ON facility_review.facilityid = facility_mstr.facilityid INNER JOIN flat ON facility_review.fid = flat.fid" 
                                         
                                UpdateCommand="UPDATE facility_review SET reviewtitle = @reviewtitle, reviewmsg = @reviewmsg WHERE (reviewid = @reviewid)">
                                             <UpdateParameters>
                                                 <asp:Parameter Name="reviewtitle" />
                                                 <asp:Parameter Name="reviewmsg" />
                                                 <asp:Parameter Name="reviewid" />
                                             </UpdateParameters>
                                             
                                              <SelectParameters>
                                                 <asp:SessionParameter Name="fid" SessionField="fid" Type="Int32" />
                                             </SelectParameters>                                   
                                    </asp:SqlDataSource>
                        </div>
                  </div> 
     
              </form>
</asp:Content>


