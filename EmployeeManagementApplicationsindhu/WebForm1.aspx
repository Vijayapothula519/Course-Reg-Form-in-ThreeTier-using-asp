<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CourseManagementApplicationsindhu.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 0px auto; padding-left: 370px; padding-right: 30px; overflow: auto;">
            <table>
                <tr>
                    <td colspan="2" style="background-color: Green; height: 30px; color: White;"
                        align="center">Student Registration 
                    </td>
                </tr>
                
                <tr>
                    <td>CourseName*</td>
                    <td>
                        <asp:TextBox Enabled="true" ID="crname" Width="150px" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="crname" ErrorMessage="Please Enter Name" EnableClientScript="false" ForeColor="Red"></asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td>CourseCode*</td>
                    <td>
                        <asp:TextBox ID="ccode" Width="150px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvcode" runat="server" ControlToValidate="ccode" ErrorMessage="Please Enter Code" EnableClientScript="false" ForeColor="Red"></asp:RequiredFieldValidator>
                        <%--<asp:TextBox ID="ccode" Width="150px" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvcode" runat="server" ControlToValidate="ccode" ErrorMessage="Please Enter Code" EnableClientScript="false" ForeColor="Red"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revcode" runat="server" ControlToValidate="ccode" ErrorMessage="Only alphabets and numerics are allowed" ValidationExpression="^[a-zA-Z0-9]+$" ForeColor="Red"></asp:RegularExpressionValidator>--%>

                    </td>
                </tr>
                <tr>
                    <td> Description</td>
                    <td>
                        <textarea id="txtArea" rows="4" cols="50" runat="server"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>CourseStartDate</td>
                    <td>
                        <asp:TextBox Enabled="true" ID="csdate" Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                
                    <tr>
                    <td align="center" >
                        <asp:Button ID="BtnSave" runat="server" Width="100px" Text="Save" OnClick="Insert_Data" />
                    </td>
                    
                    
                </tr>
                </table>
        </div>

         <h2>Student Data</h2>


        <asp:GridView ID="CourseGrid" AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
            OnRowDeleting="CourseGrid_RowDeleting" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="CourseId">
                    <ItemTemplate>
                        <asp:Label ID="lbl_cid" runat="server" Text='<%#Eval("CourseId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CourseName">
                    <ItemTemplate>
                        <asp:Label ID="lbl_csn" runat="server" Text='<%#Eval("CourseName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CourseCode">
                    <ItemTemplate>
                        <asp:Label ID="lbl_cc" runat="server" Text='<%#Eval("CourseCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="lbl_dpt" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CourseStartDate">
                    <ItemTemplate>
                        <asp:Label ID="lbl_csd" runat="server" Text='<%#Eval("CourseStartDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="DelBtn" runat="server" CausesValidation="False"
                            CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete?');"
                            Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        <br />
        <asp:Label ID="lbl_Message" runat="server"></asp:Label>
        
    </form>
</body>
</html>
