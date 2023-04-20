<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="member.aspx.cs" Inherits="user_member" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="h2">
Member Information
</div><br /><br />
                    
                          
                            <form id="Form1" runat="server">
                            <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
                         <script type="text/javascript">
                              function ImagePreview(input) {
                                if (input.files && input.files[0]) {
                                  var reader = new FileReader();
                                     reader.onload = function (e) {
                                         $('#<%=mimg.ClientID%>').prop('src', e.target.result)
                                .width(200)
                                .height(200);
                                 };
                                 reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
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
                                     <asp:Label ID ="lblmname" runat="server" Text="Member Name:" ></asp:Label><br />
                                        <asp:TextBox ID="txtmname" runat="server" Width="600px" class="form-control" placeholder="Enter Member Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rqv" runat="server" 
                                            ErrorMessage="Enter Member Name " ControlToValidate="txtmname" 
                                            ValidationGroup="1" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="true" TargetControlID="txtmname" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" "  />
                                        </div>

                                        <div class="form-group">
                                     <asp:Label ID ="lblmdob" runat="server" Text="Date Of Birth:" ></asp:Label><br />
                                        <asp:TextBox ID="txtmdob" runat="server" Width="600px" class="form-control" placeholder="Enter Date of Birth"></asp:TextBox>        
                                        <asp:RequiredFieldValidator ID="rqvmdob" runat="server" 
                                                ErrorMessage="Enter Date of Birth " ControlToValidate="txtmdob" 
                                                ValidationGroup="1" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"  Enabled="true" TargetControlID="txtmdob" DefaultView="Months" Animated="true"/>
                                         </div>

                                          <div class="form-group">
                                     <asp:Label ID ="lblmgender" runat="server" Text="Date Of Birth:" ></asp:Label><br />
                                              <asp:RadioButtonList ID="rblmgender" runat="server" Width="600px">
                                                  <asp:ListItem>Male</asp:ListItem>
                                                  <asp:ListItem>Female</asp:ListItem>
                                              </asp:RadioButtonList>        
                                        <asp:RequiredFieldValidator ID="rqvmgender" runat="server" 
                                                  ErrorMessage="Select Gender Please " ControlToValidate="rblmgender" 
                                                  ValidationGroup="1" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                          </div>

                                          <div class="form-group">
                                     <asp:Label ID ="lblmphno" runat="server" Text="Mobile No:" ></asp:Label><br />
                                        <asp:TextBox ID="txtmphno" runat="server" Width="600px" class="form-control" placeholder="Enter Mobile No:"></asp:TextBox>        
                                        <asp:RequiredFieldValidator ID="rqvmphno" runat="server" 
                                                  ErrorMessage="Enter Mobile No " ControlToValidate="txtmphno" 
                                                  ValidationGroup="1" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                              <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="true" FilterType="Numbers" TargetControlID="txtmphno" />   
                                          </div>

                                          <div class="form-group">
                                     <asp:Label ID ="lblmemail" runat="server" Text="Email Id:" ></asp:Label><br />
                                        <asp:TextBox ID="txtmemail" runat="server" Width="600px" class="form-control" placeholder="Enter Email Id:"></asp:TextBox>        
                                        <asp:RequiredFieldValidator ID="rqvmemail" runat="server" 
                                                  ErrorMessage="Enter Email Id " ControlToValidate="txtmemail" 
                                                  ValidationGroup="1" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                              <asp:RegularExpressionValidator ID="revmemail" runat="server" 
                                                  ErrorMessage="RegularExpressionValidator" ControlToValidate="txtmemail"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                Display="Dynamic" ValidationGroup="1" SetFocusOnError="True"></asp:RegularExpressionValidator>

                                        <div class="form-group">
                                             <asp:Label ID ="lblmpic" runat="server" Text="Profile Picture:" ></asp:Label><br />
                                            <asp:FileUpload ID="mimgupload" runat="server" class="form-control" Width="600px" onchange="ImagePreview(this);"  />
                                            <asp:RequiredFieldValidator ID="rqvmimgupload" runat="server" ErrorMessage="Please select Profile Picture" ControlToValidate="mimgupload" ValidationGroup="1" Display="Dynamic"></asp:RequiredFieldValidator>
                                             </div>

                                             <div class="form-group">
                                                 <asp:Image ID="mimg" runat="server" Width="200px" Height="200px" class="form-control" />                                                                                         
                                             </div>
                                             <div class="form-group">
                                               <asp:Button ID="btnstore" runat="server" class="genric-btn primary" 
                                                Text="Submit" ValidationGroup="1" onclick="btnstore_Click" />
                                                </div>
                                                <div class="form-group">
                                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>     
                                             <asp:Label ID="lblfid" runat="server" Text="" class="form-control" Visible ="false" ></asp:Label>  
                                                </div>

                                                <div class="form-group">
                                                <div class="table-responsive">
                                                    <asp:GridView ID="GridView1" runat="server"  
                                                        CssClass="table table-striped table-bordered table-hover" 
                                                        AutoGenerateColumns="False" DataKeyNames="memberid" 
                                                        DataSourceID="SqlDataSource1" >
                                                        <Columns>
                                                            <asp:BoundField DataField="memberid" HeaderText="memberid" 
                                                                InsertVisible="False" ReadOnly="True" SortExpression="memberid" Visible="false" />
                                                            <asp:BoundField DataField="owner_name" HeaderText="owner_name" 
                                                                SortExpression="owner_name" ReadOnly="true" />
                                                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                                            <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" ReadOnly="true" />
                                                            <asp:BoundField DataField="gender" HeaderText="gender" 
                                                                SortExpression="gender" ReadOnly="true" />
                                                            <asp:BoundField DataField="emailid" HeaderText="emailid" 
                                                                SortExpression="emailid" />
                                                            <asp:BoundField DataField="mobileno" HeaderText="mobileno" 
                                                                SortExpression="mobileno" />
                                                            <asp:TemplateField HeaderText="Member Image">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="Image1" runat="server" 
                                                                        ImageUrl='<%# "~/user/member/" +Eval("photo") %>' />
                                                                </ItemTemplate>
                                                                <ControlStyle Height="200px" Width="200px" />
                                                            </asp:TemplateField>
                                                            <asp:CommandField ShowEditButton="True" />
                                                            <asp:CommandField ShowDeleteButton="True" />
                                                        </Columns>
                                                    </asp:GridView>
                                                
                                                
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                                                        
                                                        SelectCommand="SELECT member.memberid, owner_mstr.owner_name, member.name, member.dob, member.gender, member.emailid, member.mobileno, member.photo FROM member INNER JOIN owner_mstr ON member.owner_id = owner_mstr.owner_id" 
                                                        DeleteCommand="DELETE FROM member WHERE (memberid = @memberid)" 
                                                        UpdateCommand="UPDATE member SET name = @name, emailid = @emailid, mobileno = @mobileno WHERE (memberid = @memberid)">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="memberid" />
                                                        </DeleteParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="name" />
                                                            <asp:Parameter Name="emailid" />
                                                            <asp:Parameter Name="mobileno" />
                                                            <asp:Parameter Name="memberid" />
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                
                                                
                                                </div> 
                                                
                                                </div>
                             </form>
</asp:Content>

