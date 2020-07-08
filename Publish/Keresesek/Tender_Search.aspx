<%@ Page Title="Ajánlatok Keresése" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Tender_Search.aspx.cs" Inherits="iktató.Tender_Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    Ajánlatok Keresése
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="Tablestyle">
        <tr><td>Azonosító:</td><td><asp:TextBox ID="txtAzonosito" runat="server" OnTextChanged="txtAzonosito_TextChanged"></asp:TextBox></td></tr>
        <tr><td><asp:Button Text="Keresés" runat="server" /></td></tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlKereses" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" CssClass="Gridstyle">
        <Columns>
            <asp:BoundField DataField="azonosito" HeaderText="Azonosító" SortExpression="azonosito" HtmlEncode="false" />
            <asp:BoundField DataField="iktatoszam" HeaderText="Szerződés azonosító" SortExpression="iktatoszam" HtmlEncode="false" />
            <asp:BoundField DataField="ki_kert" HeaderText="Megrendelő" SortExpression="ki_kert" HtmlEncode="false" />
            <asp:BoundField DataField="mikor_kert" HeaderText="Ajanlatkeres datuma" SortExpression="mikor_kert" HtmlEncode="false" DataFormatString="{0:d}" />
            <asp:BoundField DataField="mit_kert" HeaderText="Ajánlat tárgya" HtmlEncode="false" />
            <asp:BoundField DataField="bead_hatarido" HeaderText="Beadási határidő" HtmlEncode="false" DataFormatString="{0:d}" />
            <asp:BoundField DataField="beadva" HeaderText="Beadva" HtmlEncode="false" />
            <asp:BoundField DataField="nyert" HeaderText="Nyert" SortExpression="nyert" HtmlEncode="false" />
            <asp:BoundField DataField="ugyintezo" HeaderText="Ügyintéző" HtmlEncode="false" />
            <asp:BoundField DataField="megjegyzes" HeaderText="Megjegyzés" HtmlEncode="false" />
            <asp:BoundField DataField="projekt_nev" HeaderText="Projekt név" HtmlEncode="false" />
        </Columns>
    </asp:GridView>



    <asp:SqlDataSource ID="SqlKereses" runat="server"
        ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select azonosito, iktatoszam, ki_kert, mikor_kert, mit_kert, bead_hatarido, beadva, nyert, ugyintezo, megjegyzes, projekt_nev 
                       from ajanlatok 
                       where azonosito like @par_azonosito ">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="par_azonosito" PropertyName="value" Type="String" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
</asp:Content>
