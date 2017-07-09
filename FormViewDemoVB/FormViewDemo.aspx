<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FormViewDemo.aspx.vb" Inherits="FormViewDemoVB.FormViewDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
           <asp:FormView ID="FormViewBookDetails" runat="server" AllowPaging="True" DataKeyNames="BookSerialNo" GridLines="Both" ClientIDMode="Static"
                  OnItemCommand="FormViewBookDetails_ItemCommand" OnPageIndexChanging="FormViewBookDetails_PageIndexChanging" 
                  OnModeChanging="FormViewBookDetails_ModeChanging" OnItemInserting="FormViewBookDetails_ItemInserting" 
                  OnItemDeleting="FormViewBookDetails_ItemDeleting" PagerSettings-Mode="NumericFirstLast" OnItemUpdating="FormViewBookDetails_ItemUpdating">
                  <headertemplate>
                      <table class="" id="tblHeader">
                        <tr>
                          <td colspan="2">
                              <div id="Header">
                                  <asp:label id="lbl" Text="GHK Bookshop FormView Create-Update-Delete Demo" runat="server"/> 
                              </div>                                            
                          </td>
                        </tr>
                      </table>
                </headertemplate>
                <EditItemTemplate>
                    <table id="tblEdit">
                        <tr>
                            <td >Serial # : </td>
                            <td>
                                <asp:Label ID="lblBookSerialNo" runat="server" Text='<%# Eval("BookSerialNo") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td >ISBN : </td>
                            <td>
                                <asp:TextBox ID="txtBookISBN" runat="server" required="required"  Text='<%# Bind("BookISBN") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >Title : </td>
                            <td>
                                <asp:TextBox ID="txtBookTitle" runat="server"  required="required" Text='<%# Bind("BookTitle") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >Author : </td>
                            <td>
                                <asp:TextBox ID="txtBookAuthor" runat="server" required="required"  Text='<%# Bind("BookAuthor") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                           <td >Publisher : </td>
                            <td>
                                <asp:TextBox ID="txtBookPublisher" runat="server" required="required"  Text='<%# Bind("BookPublisher") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                           <td >Category : </td>
                            <td>
                                <asp:TextBox ID="txtBookCategory" runat="server" required="required"  Text='<%# Bind("BookCategory") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" UseSubmitBehavior="false" CausesValidation="false"/>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table id="tblItem">
                        <tr>
                            <td>Serial # : </td>
                            <td>
                                <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("BookSerialNo") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td >ISBN : </td>
                            <td>
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("BookISBN") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td >Title : </td>
                            <td>
                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("BookTitle") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td >Author : </td>
                            <td>
                                <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("BookAuthor") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>Publisher :</td>
                            <td>
                                <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("BookPublisher") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>Category :</td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("BookCategory") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnInsert" runat="server" Text="Add" CommandName="New" />
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" UseSubmitBehavior="false"/>                        
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <InsertItemTemplate>
                      <table id="tblInsert">
                        <tr>
                            <td >ISBN : </td>
                            <td>
                                <asp:TextBox ID="txtInsertBookISBN"  required="required" runat="server" Text='<%# Bind("BookISBN") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >Title : </td>
                            <td>
                                <asp:TextBox ID="txtInsertBookTitle" required="required"  runat="server" Text='<%# Bind("BookTitle") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >Author : </td>
                            <td>
                                <asp:TextBox ID="txtInsertBookAuthor" required="required"  runat="server" Text='<%# Bind("BookAuthor") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                           <td >Publisher : </td>
                            <td>
                                <asp:TextBox ID="txtInsertBookPublisher" required="required"  runat="server" Text='<%# Bind("BookPublisher") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                           <td >Category : </td>
                            <td>
                                <asp:TextBox ID="txtInsertBookCategory" required="required"  runat="server" Text='<%# Bind("BookCategory") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnSave" runat="server" CommandName="Insert" Text="Save"/>
                                <asp:Button ID="btnCancelInsert" runat="server" CommandName="Cancel" Text="Cancel"   UseSubmitBehavior="false" CausesValidation="false" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>  
    </div>
    </form>
</body>
</html>
