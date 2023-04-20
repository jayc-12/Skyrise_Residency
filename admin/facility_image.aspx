<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="facility_image.aspx.cs" Inherits="admin_facility_image" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="col-sm-6">
    <h2 class="m-0 text-dark">Facility Album</h2>
        <p>&nbsp;</p>
    </div>

    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=facphoto.ClientID%>').prop('src', e.target.result)
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
                        <label>Facility Name</label> 
                            <br />
                            <asp:DropDownList ID="drpfactype" runat="server" class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon">
                            </asp:DropDownList><br /><br />
                            </div>
                            </div>

                             <div class="col-sm-6">
                        <div class="form-group">
                            <label>Facility Photos</label><br />
                            <asp:FileUpload ID="facpicupload" runat="server" class="accent-navy" onchange="ImagePreview(this);"/>   <br /> 
                            <asp:RequiredFieldValidator ID="rqffacimage" runat="server" 
                                ErrorMessage="you must select an image" ControlToValidate="facpicupload" 
                                Display="Dynamic" ValidationGroup="2"></asp:RequiredFieldValidator>
                            <asp:Image ID="facphoto" runat="server" class="form-control" Height="200px" 
                                Width="200px" /> <br />
                            <asp:Button ID="btn_facimg_insert" runat="server" Text="Upload" 
                                class="btn btn-primary" onclick="btn_facimg_insert_Click" ValidationGroup="2"/>
                            <br /><br />
                            </div>
                            </div>

                             <asp:Label ID="lblmsg" runat="server"></asp:Label>
                            <br />
                            <br />

                            
                            <div class="table-responsive">
                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="facimageid" DataSourceID="gridfac" 
                                class="table table-bordered table-striped" Width="1287px"> 
                                <Columns>
                                    <asp:BoundField DataField="facimageid" HeaderText="facimageid" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="facimageid" Visible ="false" />
                                            <asp:BoundField DataField="facility_type" HeaderText="facility_type" 
                                                SortExpression="facility_type" />
                                    <asp:TemplateField HeaderText="photo">
                                        <ItemTemplate>
                                            <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("picture") %>' />
                                        </ItemTemplate>
                                        <ControlStyle Height="200px" Width="200px" />
                                    </asp:TemplateField>
                                  <asp:CommandField ShowDeleteButton="True" />
                                </Columns>
                            </asp:GridView>
                            </div>
                            <asp:SqlDataSource ID="gridfac" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                DeleteCommand="DELETE FROM [facility_album] WHERE [facimageid] = @facimageid" 
                                SelectCommand="SELECT f.facimageid, fm.facility_type, f.picture FROM facility_album AS f INNER JOIN facility_mstr AS fm ON f.facilityid = fm.facilityid"                                 
                                UpdateCommand="UPDATE [facility_album] SET [facilityid] = @facilityid WHERE [facimageid] = @facimageid">
                                <DeleteParameters>
                                    <asp:Parameter Name="facimageid" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="facilityid" Type="String" />
                                     <asp:Parameter Name="facimageid" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                          

                            
                     </form>
</asp:Content>

