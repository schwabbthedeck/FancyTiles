<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <%--<script type="text/javascript" src="../Scripts/jquery-3.4.1.min.js"></script>--%>
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />

</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Fancy Tiles App
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
		<div>
				<h1>Welcome to Fancy Tiles App!</h1>
				<br />
				<h2>Overview:</h2>
				<p>The Fancy Tiles App is used to create the Fancy Tiles Web Part on any page in the site the add-in has been installed on.</p>
				<p><img src="../Images/FancyTileExampleScreenShot.png" alt="Fancy Tile Example" width="450" /></p>
				<p>The "Fancy Tiles List" is the list used to collect all tiles that you want to display. </p>
				<p>A "Group Keyword" is used on each item to specify what group of tiles you want to show.</p>
				<p>Click the link below to configure the list. Example items are already added to the list.</p>
				<p>
						<strong><a href="../Lists/FancyTilesList">Configure Fancy Tiles List</a></strong>
				</p>
				<h2>Adding the web part:</h2>
				<p>Add the web part as you would add any other web part to the page, then select "Fancy Tiles Web Part".</p>
				<p>To specify which group the web part should show, update the "Fancy Tiles Group Keyword" property under the "Fancy Tiles Properties" heading.</p>
				<p><img src="../Images/FancyTileProperty.png" alt="Fancy Tile Property" width="300"/></p>
				
    </div>

</asp:Content>
