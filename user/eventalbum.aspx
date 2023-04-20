<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="eventalbum.aspx.cs" Inherits="user_eventalbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="h2">
Event Album
</div><br /><br />
                    
                        <form id="Form1" runat="server">
                         <div class="form-group">
                <asp:Label ID ="Label2" runat="server" Text="Event Type:" ></asp:Label><br />
                                       <asp:DropDownList ID="drpeventtype" runat="server" class="form-control" 
                                           Width="600px" AutoPostBack="True" 
                                 onselectedindexchanged="drpeventtype_SelectedIndexChanged">
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
                                SelectCommand="SELECT * FROM [event_album]"></asp:SqlDataSource>
                            </div>
                            </div>
                            </form>
</asp:Content>

