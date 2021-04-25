<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductCreate.aspx.cs" Inherits="WingtipToys.ProductCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Add new product</h1>
    <div runat="server" ID="CreateProductForm">
        
        <asp:Label ID="LabelName" runat="server" AssociatedControlID="Name" Text="Name:"></asp:Label><br />
        <asp:TextBox ID="Name" runat="server"></asp:TextBox>       
        <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="Name" Display="Dynamic" ErrorMessage="Product name is required"></asp:RequiredFieldValidator>
       <br />
        <br />
        <asp:Label ID="PriceLabel" runat="server" AssociatedControlID="Price" Text="Price:"></asp:Label><br />
        <asp:TextBox ID="Price" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="PriceValidator" runat="server" ControlToValidate="Price" Display="Dynamic" ErrorMessage="Price is required  "></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="PriceRangeValidator" runat="server" ControlToValidate="Price" Display="Dynamic" ErrorMessage="Price should be grater then zero. Maximum price is 600$" MaximumValue="600,00" MinimumValue="0,10" Type="Currency"></asp:RangeValidator>
       <br />
        <br />
        <asp:Label ID="CategoryLabel" runat="server" AssociatedControlID="CategoryList" Text="Category:"></asp:Label><br />
        <asp:DropDownList ID="CategoryList" runat="server" DataTextField="CategoryName" DataValueField="CategoryID" ItemType="WingtipToys.Data.Category" SelectMethod="GetCategories">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="CategoryValidator" runat="server" ControlToValidate="CategoryList" Display="Dynamic" ErrorMessage="Category is required"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="DescriptionLabel" runat="server" AssociatedControlID="Description" Text="Description:"></asp:Label>
        <textarea ID="Description" name="S1" runat="server"></textarea>
        
        <asp:RegularExpressionValidator ID="DescriptionLengthValidator" runat="server" ControlToValidate="Description" ErrorMessage="Description should be maximum 500 symbols long   " ValidationExpression="^.{0,500}$"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="WordsCountValidator" runat="server" ControlToValidate="Description" ErrorMessage="Description should be minimum 3 wordls long" ValidationExpression="^(\S+\s){2,150}\s*$"></asp:RegularExpressionValidator>
        <br />
        <br /> <br />
        <asp:Label ID="ImageUrlLabel" runat="server" AssociatedControlID="ImageUrlInput" Text="Product Image Url:"></asp:Label><br />
        <asp:TextBox ID="ImageUrlInput" runat="server"></asp:TextBox>
        
        <asp:RegularExpressionValidator ID="UrlInputValidator" runat="server" ControlToValidate="ImageUrlInput" Display="Dynamic" ErrorMessage="Image must have a valid URL   " ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
        <asp:CustomValidator ID="ImageUrlValidator" runat="server" ControlToValidate="ImageUrlInput" Display="Dynamic" ErrorMessage="URL value must belong to the existing image" OnServerValidate="ValidationImageUrl"></asp:CustomValidator>
        
       <br />
        <asp:Button ID="Button1" runat="server" Height="16px" OnClick="Button1_Click" Text="Create product" />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        
    </div>
    <div runat="server" ID="SuccessBlock" Visible="False">
        <h2>New product <b><asp:Literal ID="MesageProductyName" runat="server"></asp:Literal>&nbsp;</b>was successfully added to our store. You could <a href="~/ProductList" runat="server">check catalog</a></h2>
    </div>

</asp:Content>
