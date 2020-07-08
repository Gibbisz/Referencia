<%@ Page Title="Szerződések Keresése" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Contract_Search.aspx.cs" Inherits="iktató.Contract_Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    Szerződések Keresése
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <table class="Tablestyle">
     <tr>
         <td>
             Keresés azonosítóra:
         </td>
         <td>
             <asp:TextBox ID="txtAzonosito" runat="server"></asp:TextBox>
         </td>
         <td>
             <asp:Button ID="btnKereses" runat="server" Text="Keresés" OnClick="btnKereses_Click" />
         </td>
     </tr>
 </table>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="sqlSzerzodesKereses" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" CssClass="Gridstyle" PageSize="20">
        <Columns>
            <asp:BoundField DataField="azonosito" HeaderText="Azonosító" HtmlEncode="false" SortExpression="azonosito" />
            <asp:BoundField DataField="alairas_datum" HeaderText="Aláírás Dátuma" HtmlEncode="false" SortExpression="alairas_datum" DataFormatString="{0:d}" />
            <asp:BoundField DataField="hatalybalepes_datum" HeaderText="Hatálybalépés dátuma" HtmlEncode="false" SortExpression="hatalybalepes_datum" DataFormatString="{0:d}" />
            <asp:BoundField DataField="konzorcium" HeaderText="konzorciumi társ" HtmlEncode="false" NullDisplayText="" />
            <asp:BoundField DataField="reszhatarido" HeaderText="Részhatáridők" HtmlEncode="false" />
            <asp:BoundField DataField="veghatarido" HeaderText="Véghatáridő" HtmlEncode="false" DataFormatString="{0:d}" />
            <asp:BoundField DataField="projekt_nev" HeaderText="Projekt Név" HtmlEncode="false" />
            <asp:BoundField DataField="nev" HeaderText="Megbízók nevei" HtmlEncode="false" />
            <asp:BoundField DataField="cim" HeaderText="Megbízók címei" HtmlEncode="false" />
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="sqlSzerzodesKereses" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select szerzodesek.azonosito, alairas_datum, hatalybalepes_datum, A1.nev AS konzorcium, reszhatarido, veghatarido, projekt_nev, A2.nev, A2.cim
                       From szerzodesek
                       left join partnerek A1
                       on A1.azonosito = konzorcium_tars
                       left join szerzodes_megbizok
                       on szerzodes_azonosito = szerzodesek.azonosito
                       left join partnerek A2
                       on A2.azonosito = szerzodes_megbizok.megbizo_azonosito
                       left join reszhataridok
                       on reszhataridok.szerzodes_azonosito = szerzodesek.azonosito
                       where szerzodesek.azonosito like @par_azonosito">
        <SelectParameters>
            <asp:Parameter Name="par_azonosito" Type="String" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
