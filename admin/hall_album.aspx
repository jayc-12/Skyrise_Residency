<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="hall_album.aspx.cs" Inherits="admin_hall_album" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Hall Album</h2>
     <p>&nbsp;</p>
     </div>
     <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imghallpho.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

                 <form id="Form1" runat="server">
                 <div class="col-sm-6">
                        <div class="form-group">
                        <label>Hall Name</label> 
                            <br />
                            <asp:DropDownList ID="drphalltype" runat="server"                             
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon">
                            </asp:DropDownList><br /><br />

                            
                            <label>Hall Photos</label><br />
                            <asp:FileUpload ID="hallpicupload" runat="server" onchange="ImagePreview(this);" />    
                            <asp:RequiredFieldValidator ID="rqfhallpicupload" runat="server" 
                                ErrorMessage="please select image file" ControlToValidate="hallpicupload" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:Image ID="imghallpho" runat="server" class="form-control" Height="200px" 
                                Width="200px" /><br />
                            <asp:Button ID="btn_albumn_insert" runat="server" Text="Upload" class="btn btn-primary"
                                ValidationGroup="1" onclick="btn_albumn_insert_Click" />
                            <br />
                            <asp:Label ID="lblalbum" runat="server"></asp:Label>
                            <asp:Label ID="lblpicuplod" runat="server"></asp:Label>
                            <br />
                            <br />
                      </div>
                      </div>

                       <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                               class="table table-bordered table-striped" DataKeyNames="hall_albumid" 
                               DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="hall_albumid" HeaderText="hall_albumid" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="hall_albumid" Visible="false" />
                                <asp:BoundField DataField="halltype" HeaderText="halltype" 
                                    SortExpression="halltype" />
                                  <asp:TemplateField HeaderText="picture" >
                                      <ItemTemplate>
                                          <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photo") %>' />
                                      </ItemTemplate>
                                      <ControlStyle Height="200px" Width="200px" />
                                  </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                        
                        </asp:GridView>
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                               DeleteCommand="DELETE FROM hall_album WHERE (hall_id = @hall_id)" 
                               SelectCommand="SELECT hall_album.hall_albumid, hall_mstr.halltype, hall_album.photo FROM hall_album INNER JOIN hall_mstr ON hall_album.hall_id = hall_mstr.hall_id">
                               <DeleteParameters>
                                   <asp:Parameter Name="hall_id" />
                               </DeleteParameters>
                           </asp:SqlDataSource>
                       </div>

    </form>
</asp:Content>

