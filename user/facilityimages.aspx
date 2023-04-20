<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="facilityimages.aspx.cs" Inherits="user_facilityimages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="h2">
Facility Album
</div><br /><br />
                    
                        <form runat="server">
                         <div class="form-group">
                <asp:Label ID ="Label2" runat="server" Text="Facility Type:" ></asp:Label><br />
                                       <asp:DropDownList ID="drpfacitype" runat="server" class="form-control" 
                                           Width="600px" 
                                 onselectedindexchanged="drpfacitype_SelectedIndexChanged" 
                                 AutoPostBack="True">
                                       </asp:DropDownList>
                                   </div>



                        <div class="form-group">
                        <div class="table-responsive">
                        
                            <asp:DataList ID="DataList1" runat="server"  
                                CssClass="table table-striped table-bordered table-hover" 
                                RepeatDirection="Horizontal" RepeatColumns="4">
                              <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="300px" 
                                                ImageUrl='<%# Eval("picture") %>' Width="300px" />
                                            &nbsp;<br />
                                            <br />     
                                </ItemTemplate>
                            </asp:DataList>
                        
                        
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                               SelectCommand="SELECT * FROM [facility_album]"     >                           
                            </asp:SqlDataSource>
                        
                        
                        </div>
                        </div>
                        
                        </form>
    </form>
</asp:Content>

