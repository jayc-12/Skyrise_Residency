<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmstr.master" AutoEventWireup="true" CodeFile="empreg.aspx.cs" Inherits="empreg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <head>
<title>
<style type="text/css">
      .VeryPoor
       {
         background-color:red;
         }

          .Weak
        {
         background-color:orange;
         }

          .Average
         {
          background-color: #A52A2A
         }
          .Excellent
         {
         background-color:yellow;
         }
          .Strong
         {
         background-color:green;
         }
          .border
         {
          border: medium solid #800000;
          width:500px;                
         }
      </style>
</title>
</head>
    <form runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div class="col-sm-6">
    <h2 class="m-0 text-dark">Employee Registration</h2>
     <p>&nbsp;</p>
     <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=empprofilepic.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
    </div>
     <p>             
                            <div class="col-sm-6">
                        <div class="form-group">
                        <label>Employee Post</label><br />
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:DropDownList ID="drpemppost" runat="server"  
                                class="btn btn-default dropdown-toggle dropdown-hover dropdown-icon" 
                                onselectedindexchanged="drpemppost_SelectedIndexChanged" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                                                                             
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Employee Name</label><br>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtempname" runat="server" class="form-control" placeholder="Enter Employee Name" Width="500px" ></asp:TextBox>                        
                          <asp:RequiredFieldValidator ID="rqfempname" runat="server" 
                                ControlToValidate="txtempname" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="7">Enter Employee Name</asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtempname" Enabled="true" FilterType="LowercaseLetters,Custom,UppercaseLetters" ValidChars=" " />
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Email ID:</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                         <asp:TextBox ID="txtempemail" runat="server" class="form-control" 
                                placeholder="abc@gmail.com" TextMode="Email" AutoPostBack="True" 
                                ontextchanged="txtempemail_TextChanged" Width="500px"></asp:TextBox>
                            <asp:Label ID="lblexmsg" runat="server" Text=""></asp:Label>
                          <asp:RequiredFieldValidator ID="rqfempemail" runat="server" 
                                 ControlToValidate="txtempemail" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="7">Enter Employee Email</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regxemail" runat="server" 
                                ControlToValidate="txtempemail" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ForeColor ="#E2213E" Display="Dynamic" ValidationGroup="1">You Must Enter Proper E-mail Id</asp:RegularExpressionValidator>
                            <%--<asp:RangeValidator ID="rrvevamtp" runat="server" ErrorMessage="Enter valid amount" ControlToValidate="txtevamtp" MinimumValue="500" MaximumValue="10000"></asp:RangeValidator>--%>
                      </div>
                      </div>

                    

                        <div class="col-sm-6">
                        <div class="form-group">
                        <label>Gender</label><br>
                     
                            <asp:RadioButtonList ID="rblgender" runat="server" >
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="rqfempgender" runat="server" 
                                ControlToValidate="rblgender" Display="Dynamic" ValidationGroup="7">Please select your gender </asp:RequiredFieldValidator>

                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Mobile Number</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                         <asp:TextBox ID="txtempphnno" runat="server" class="form-control" 
                                AutoPostBack="True" ontextchanged="txtempphnno_TextChanged" placeholder="Enter Phone Number" Width="500px" MaxLength="10"></asp:TextBox>
                            <asp:Label ID="lblexmsg1" runat="server" Text=""></asp:Label>
                          <asp:RequiredFieldValidator ID="rqfempmob" runat="server" 
                                ControlToValidate="txtempphnno" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="7">Enter valid mobile number</asp:RequiredFieldValidator>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtempphnno" Enabled="true" FilterType="Numbers"  />
                      </div>
                      </div>
         <asp:Panel ID="pnlpass" runat="server">
           <div class="col-sm-6">
                        <div class="form-group">
                        <label>Password</label><br>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtemppass" TextMode="Password" runat="server" class="form-control"  placeholder="Enter Password ******" Width="500px" ></asp:TextBox>                        
                          <asp:RequiredFieldValidator ID="rqfemppass" runat="server" 
                                 ControlToValidate="txtemppass" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="7">Enter Employee Password</asp:RequiredFieldValidator>
                                <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server" DisplayPosition="RightSide" StrengthIndicatorType="Text"
                                 TargetControlID="txtemppass" PrefixText="Stength:" Enabled="true" RequiresUpperAndLowerCaseCharacters="true" MinimumLowerCaseCharacters="1"
                                 MinimumUpperCaseCharacters="1" MinimumSymbolCharacters="1" MinimumNumericCharacters="1" PreferredPasswordLength="8" TextStrengthDescriptions="VeryPoor; Weak; Average; Strong; Excellent"
                                 BarBorderCssClass="border" HelpStatusLabelID="Label1" CalculationWeightings="25;25;15;35"></ajaxToolkit:PasswordStrength>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                      </div>
                      </div>

                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Re-Type Password</label><br>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <asp:TextBox ID="txtemprpass" runat="server" class="form-control" placeholder="Enter same password as above" TextMode="Password" Width="500px"></asp:TextBox>                        
                          <asp:RequiredFieldValidator ID="rqfemprpass" runat="server" 
                                ControlToValidate="txtemprpass" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="7">Enter Password again</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="comemppass" runat="server" 
                            ControlToCompare="txtemppass" ControlToValidate="txtemprpass" Display="Dynamic" ValidationGroup="7">Both password and re-type password should be same</asp:CompareValidator>
                      </div>
                      </div>
         </asp:Panel>


                      <div class="col-sm-6">
                        <div class="form-group">
                        <label>Employee Picture</label>
                        <%--<input type="text" class="form-control" placeholder="Enter ...">--%>
                            <br />
                            <asp:FileUpload ID="emppicupload" runat="server" onchange="ImagePreview(this);" /><br />
                          <asp:RequiredFieldValidator ID="rqfemppic" runat="server" 
                                ControlToValidate="emppicupload" 
                                SetFocusOnError="True" Display="Dynamic" ValidationGroup="7">Profile picture is necessary</asp:RequiredFieldValidator>
                            <asp:Image ID="empprofilepic" runat="server" class="form-control" Height="200px" 
                                Width="200px" /><br />
                      </div>
                          <asp:Label ID="lblamount" runat="server" Text=""></asp:Label>
                      </div>

                       <div class="card-footer">
                <%--  <button type="submit" class="btn btn-primary">Submit</button>--%>
                        <asp:Button ID="btnempinsert" class="btn btn-primary" runat="server" Text="Submit" 
                               onclick="btnempinsert_Click" ValidationGroup="7" />
                </div><br/>
                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                <div class="grid">


                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="empid" DataSourceID="SqlDataSource2" class="table table-bordered table-striped">
                        <Columns>
                            <asp:BoundField DataField="empid" HeaderText="empid" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="empid" 
                                                Visible="False" />
                                            <asp:BoundField DataField="emptypeid" HeaderText="emptypeid" 
                                                SortExpression="emptypeid" Visible="False" />
                                            <asp:BoundField DataField="emptype" HeaderText="emptype" ReadOnly="True" 
                                                SortExpression="emptype" />
                                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                            <asp:BoundField DataField="emailid" HeaderText="emailid" 
                                                SortExpression="emailid" />
                                            <asp:BoundField DataField="password" HeaderText="password" 
                                                SortExpression="password" Visible="False" />
                                            <asp:BoundField DataField="mobileno" HeaderText="mobileno" 
                                                SortExpression="mobileno" />
                                                 <asp:BoundField DataField="gender" HeaderText="gender" ReadOnly="True" 
                                                SortExpression="gender" />
                            <asp:TemplateField HeaderText="picture" Visible=true>
                                                <ItemTemplate>
                                                    <asp:Image ImageUrl='<%# Eval("picture") %>' height="100px" Width="100px" 
                                                        ID="Image1" runat="server"> </asp:Image>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                           
                                            <asp:BoundField DataField="amount" HeaderText="amount" SortExpression="amount" ReadOnly="True"/>
                            <asp:CommandField ShowEditButton="True" />    
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
                        DeleteCommand="DELETE FROM [empmstr] WHERE [empid] = @empid" 
                        SelectCommand="SELECT em.empid, em.emptypeid, em.name, em.emailid, em.password, em.mobileno, em.gender, em.picture , em.amount, et.emptype FROM empmstr AS em INNER JOIN emp_type AS et ON em.emptypeid = et.emptypeid" 
                        UpdateCommand="UPDATE [empmstr] SET [name] = @name, [emailid] = @emailid, [mobileno] = @mobileno WHERE [empid] = @empid">
                        <DeleteParameters>
                            <asp:Parameter Name="empid" Type="Int32" />
                        </DeleteParameters>                        
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="emailid" Type="String" />
                            <asp:Parameter Name="mobileno" Type="Decimal" />
                             <asp:Parameter Name="empid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>


                </div>
    </form>
    
</asp:Content>

