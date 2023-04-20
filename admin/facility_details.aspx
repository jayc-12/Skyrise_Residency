<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="facility_details.aspx.cs" Inherits="admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="col-sm-6">
    <h2 class="m-0 text-dark">Facility Details</h2>
        <p>&nbsp;</p>
    </div>
     <form id="Form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
     </asp:ScriptManager>
                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Facility Type</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtfacilitytype" runat="server" class="form-control" placeholder="Enter Facility Type" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqffacilitytype" runat="server" 
                                SetFocusOnError="True" 
                                ControlToValidate="txtfacilitytype" Display="Dynamic" ValidationGroup="4">Enter Facility type first</asp:RequiredFieldValidator>
                                 <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2"  runat="server" Enabled="True" TargetControlID="txtfacilitytype" FilterType="LowercaseLetters,Custom,UppercaseLetters" ValidChars=" ">
                            </asp:FilteredTextBoxExtender> 
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Description</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtfacilitydesc" runat="server" class="form-control" placeholder="Enter Facility Description" TextMode="MultiLine" Width="500px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqffacilitydesc" runat="server" 
                                SetFocusOnError="True" 
                                ControlToValidate="txtfacilitydesc" Display="Dynamic" ValidationGroup="4">Enter facility description</asp:RequiredFieldValidator>
                               <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3"  runat="server" Enabled="True" TargetControlID="txtfacilitydesc" FilterType="LowercaseLetters,Custom,UppercaseLetters" ValidChars=" ">
                            </asp:FilteredTextBoxExtender>

                      </div>
                      </div>

                      <div class="card-footer">
                  <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
                          <asp:Button ID="btnfacinsert" runat="server" Text="Submit" 
                              class="btn btn-primary" onclick="btnfacinsert_Click" ValidationGroup="4" />&nbsp

                      

                     </div>
                     <div class="table-responsive">
                        
                         <asp:GridView ID="GridView1" runat="server"  
                             class="table table-bordered table-striped" AutoGenerateColumns="False" 
                             DataKeyNames="facilityid" DataSourceID="SqlDataSource1">
                             <Columns>
                                 <asp:BoundField DataField="facilityid" HeaderText="facilityid" 
                                     InsertVisible="False" ReadOnly="True" SortExpression="facilityid" Visible="false"/>
                                 <asp:BoundField DataField="facility_type" HeaderText="facility_type" 
                                     SortExpression="facility_type" />
                                 <asp:BoundField DataField="fac_desc" HeaderText="fac_desc" 
                                     SortExpression="fac_desc" />
                                 <asp:CommandField ShowEditButton="True" />
                                 <asp:CommandField ShowDeleteButton="True" />
                             </Columns>
                         </asp:GridView>
                    
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                             SelectCommand="SELECT * FROM [facility_mstr]" 
                             DeleteCommand="DELETE FROM [facility_mstr] WHERE [facilityid] = @facilityid" 
                             InsertCommand="INSERT INTO [facility_mstr] ([facility_type], [fac_desc]) VALUES (@facility_type, @fac_desc)" 
                             UpdateCommand="UPDATE [facility_mstr] SET [facility_type] = @facility_type, [fac_desc] = @fac_desc WHERE [facilityid] = @facilityid">
                             <DeleteParameters>
                                 <asp:Parameter Name="facilityid" Type="Int32" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter Name="facility_type" Type="String" />
                                 <asp:Parameter Name="fac_desc" Type="String" />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="facility_type" Type="String" />
                                 <asp:Parameter Name="fac_desc" Type="String" />
                                 <asp:Parameter Name="facilityid" Type="Int32" />
                             </UpdateParameters>
                         </asp:SqlDataSource>
                    
                        </div>
    </form>
</asp:Content>

