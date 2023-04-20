<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="event_album.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="col-sm-6">
    <h2 class="m-0 text-dark">Event Album</h2>
        <p>&nbsp;</p>
    </div>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgevepho.ClientID%>').prop('src', e.target.result)
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
                        <label>Event Name</label> 
                            <br />
                            <asp:DropDownList ID="drpeventname" runat="server" 
                                DataTextField="event_name" 
                                DataValueField="event_name" 
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon">
                            </asp:DropDownList><br /><br />

                            
                            <label>Event Photos</label><br />
                            <asp:FileUpload ID="evntpicupload" runat="server" onchange="ImagePreview(this);" />    
                            <asp:RequiredFieldValidator ID="rqfevntpicupload" runat="server" 
                                ErrorMessage="please select image file" ControlToValidate="evntpicupload" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:Image ID="imgevepho" runat="server" class="form-control" Height="200px" 
                                Width="200px" /><br />
                            <asp:Button ID="btn_albumn_insert" runat="server" Text="Upload" class="btn btn-primary"
                                onclick="btn_albumn_insert_Click" ValidationGroup="1" />
                            <br />
                            <asp:Label ID="lblalbum" runat="server"></asp:Label>
                            <asp:Label ID="lblpicuplod" runat="server"></asp:Label>
                            <br />
                            <br />
                      </div>
                      </div>
                      <div class="table-responsive">
                          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                              DataKeyNames="event_albumid" DataSourceID="SqlDataSource2" class="table table-bordered table-striped">
                              <Columns>
                                  <asp:BoundField DataField="event_albumid" HeaderText="event_albumid" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="event_albumid" Visible ="false" />
                                  <asp:BoundField DataField="event_name" HeaderText="event_name" 
                                                SortExpression="event_name" />
                                  <asp:TemplateField HeaderText="picture" >
                                      <ItemTemplate>
                                          <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photo") %>' />
                                      </ItemTemplate>
                                      <ControlStyle Height="200px" Width="200px" />
                                  </asp:TemplateField>
                                  
                                  <asp:CommandField ShowDeleteButton="True" />
                              </Columns>
                          </asp:GridView>
                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                              ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                              DeleteCommand="DELETE FROM [event_album] WHERE [event_albumid] = @event_albumid" 
                              SelectCommand="SELECT ea.event_albumid, em.event_name, ea.photo FROM event_album AS ea INNER JOIN event_mstr AS em ON ea.event_id = em.event_id" 
                              UpdateCommand="UPDATE [event_album] SET [event_id] = @event_id WHERE [event_albumid] = @event_albumid">
                              <DeleteParameters>
                                  <asp:Parameter Name="event_albumid" Type="Int32" />
                              </DeleteParameters>
                              <InsertParameters>
                                  <asp:Parameter Name="event_id" Type="String" />
                                  <asp:Parameter Name="photo" Type="String" />
                              </InsertParameters>
                              <UpdateParameters>
                                  <asp:Parameter Name="event_id" Type="String" />
                                  <asp:Parameter Name="photo" Type="String" />
                                  <asp:Parameter Name="event_albumid" Type="Int32" />
                              </UpdateParameters>
                          </asp:SqlDataSource>
                          <br />
                          <br />
                      </div>
                      </form>
</asp:Content>

