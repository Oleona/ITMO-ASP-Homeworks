<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryCreate.aspx.cs" Inherits="WingtipToys.CategoryCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Add new category</h1>
    <div runat="server" id="CreateCategoryForm">

        <asp:Label ID="LabelName" runat="server" AssociatedControlID="Name" Text="Name:"></asp:Label>
        <br />
        <asp:TextBox ID="Name" runat="server"> </asp:TextBox>
        <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="Name" Display="Dynamic" ErrorMessage="Category name is required"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CategoryUniqueValidator" runat="server" ControlToValidate="Name" Display="Dynamic" ErrorMessage="Category already exists" OnServerValidate="ValidateUnique"></asp:CustomValidator>
        <br />
        <asp:Label ID="DescriptionLabel" runat="server" Text="Description:" AssociatedControlID="Description"></asp:Label>
        <br />
        <textarea id="Description" name="S1" runat="server"></textarea>
        <asp:RegularExpressionValidator ID="DescriptionLengthValidator" runat="server" ControlToValidate="Description" ErrorMessage="Description should be maximum 500 symbols long" ValidationExpression="^.{0,500}$"></asp:RegularExpressionValidator>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create category" />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <br />
    </div>
   <div runat="server" ID="SuccessBlock" Visible="False">
        <h2>New category <b><asp:Literal ID="MesageCategoryName" runat="server"></asp:Literal>&nbsp;</b>was successfully added to our store. You could <a href="~/ProductList" runat="server">check catalog</a></h2>
    </div>
</asp:Content>
