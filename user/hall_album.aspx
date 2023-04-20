<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="hall_album.aspx.cs" Inherits="user_hall_album" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <div class="h2">
Hall Album
</div><br /><br />
                    
                        <form id="Form1" runat="server">
                         <div class="form-group">
                <asp:Label ID ="Label2" runat="server" Text="Hall Type:" ></asp:Label><br />
                                       <asp:DropDownList ID="drphalltype" runat="server" 
                                 class="form-control" Width="600px" AutoPostBack="True" 
                                 onselectedindexchanged="drphalltype_SelectedIndexChanged"                                >
                                       </asp:DropDownList>
                                   </div>



                        <div class="form-group">
                        <div class="table-responsive">
                        
                            <asp:DataList ID="DataList1" runat="server"  
                                CssClass="table table-striped table-bordered table-hover" 
                                RepeatDirection="Horizontal" RepeatColumns="4">
                              <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="300px" 
                                                ImageUrl='<%# Eval("photo") %>' Width="300px" />
                                            &nbsp;<br />
                                            <br />     
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                SelectCommand="SELECT * FROM [hall_album]"></asp:SqlDataSource>
                            </div>
                            </div>
                            </form>

</asp:Content>

