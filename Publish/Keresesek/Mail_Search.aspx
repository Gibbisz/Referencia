<%@ Page Title="Levelek Keresése" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Mail_Search.aspx.cs" Inherits="iktató.Mail_Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    Levelek Keresése
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
    <tr>
        <td>
            Levél irány: 
        </td>
        <td>
            <asp:DropDownList ID="ddlLevelIrany" runat="server" AutoPostBack="true">
                <asp:ListItem Text="Bemenő/Kimenő" Value="%">
                </asp:ListItem>
                <asp:ListItem Text="Bemenő" Value="Be"></asp:ListItem>
                <asp:ListItem Text="Kimenő" Value="Ki"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
</table>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="sqlAdatbazis" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" CssClass="Gridstyle">
        <Columns>
            <asp:BoundField DataField="iktatoszam" HeaderText="Iktatószám" SortExpression="iktatoszam" HtmlEncode="false" />
            <asp:BoundField DataField="irany" HeaderText="Levél iránya" HtmlEncode="false" />
            <asp:BoundField DataField="tipus" HeaderText="Levél Típusa" HtmlEncode="false" />
            <asp:BoundField DataField="partner_ugyintezo" HeaderText ="Partner Ügyintéző" HtmlEncode="false" />
            <asp:BoundField DataField="targy" HeaderText="Levél Tárgya" HtmlEncode="false" />
            <asp:BoundField DataField="ugyintezo" HeaderText ="Ügyintéző" HtmlEncode="false" />
            <asp:BoundField DataField="elozmeny" HeaderText="Előzmény" HtmlEncode="false" NullDisplayText="Nincs" />
            <asp:BoundField DataField="beerkezes_datum" HeaderText="Beérkezés Dátuma" HtmlEncode="false" SortExpression="beerkezes_datum" DataFormatString="{0:d}" />
            <asp:BoundField DataField="hatarido" HeaderText="Határidő" HtmlEncode="false" DataFormatString="{0:d}" />
            <asp:BoundField DataField="projekt_nev" HeaderText="Projekt neve" HtmlEncode="false" />
            <asp:BoundField DataField="hiv_szam" HeaderText="Hivatkozási szám" HtmlEncode="false" />
            <asp:BoundField DataField="lefuzes_helye" HeaderText="Lefűzés helye" HtmlEncode="false" />
            <asp:BoundField DataField="nev" HeaderText="Címzett neve" HtmlEncode="false" />
            <asp:BoundField DataField="cim" HeaderText="Címzett címe" HtmlEncode="false" />
            <asp:HyperLinkField DataTextFormatString="X:\Dokument\2018 fax és levelezés\1592\{0}" DataTextField="Filenev" HeaderText="PDF" Target="_blank" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqlAdatbazis" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="SELECT iktatoszam,irany,tipus,partner_ugyintezo,targy,ugyintezo,elozmeny,
                       beerkezes_datum,projekt_nev, hiv_szam,lefuzes_helye, Filenev, nev, cim
                       FROM levelek
                       
                       left join fileok
                       on levelek.iktatoszam = fileok.azonosito
                       left join level_cimzettek
                       on level_azonosito = levelek.iktatoszam
                       left join partnerek
                       on partnerek.azonosito = level_cimzettek.cimzett_azonosito 
        where irany like @par_Irany">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlLevelIrany" Name="par_Irany" Type="String" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
