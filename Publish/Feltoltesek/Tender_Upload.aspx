<%@ Page Title="Ajánlatok Feltöltése" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Tender_Upload.aspx.cs" Inherits="iktató.Tender_Upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    Ajánlatok Feltöltése
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        $(document).ready(function () {
            $("[id$=MainContent_txtKerveny_ido]").datepicker({
                dateFormat: 'yy/mm/dd',
                changeMonth: true,
                changeYear: true
            });
            $("[id$=MainContent_txtHatarido]").datepicker({
                dateFormat: 'yy/mm/dd',
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
    <table class="Tablestyle">
        <tr><td>Azonosító: </td><td><%--<asp:Button Text="Generál" runat="server" OnClick="btn_General_Click" ID="btn_General" />--%><asp:Label ID ="txtAzonosito" runat="server"></asp:Label></td></tr>
        <tr><td>Megrendelő: </td><td><asp:DropDownList ID="ddlKervenyezo_Szemely" runat="server" DataSourceID="sqlMegrendelo" DataTextField="nev" DataValueField="cim" AutoPostBack="True" OnSelectedIndexChanged="ddlKervenyezo_Szemely_SelectedIndexChanged" ></asp:DropDownList>
            <asp:Label ID="labelCim" Text="" runat="server"></asp:Label>
                                 </td></tr>
        <tr>
            <td>Új Megrendelő feltöltése:</td><td><asp:CheckBox ID="chbxUjPartner" runat="server" AutoPostBack="true" OnCheckedChanged="Feltoltes_CheckedChanged" /></td>
        </tr>
        <tr>
            <td>Megrendelő neve:</td>
            <td>
                <asp:TextBox ID="txtPartnerNev" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Megrendelő Címe: Irányítószám</td>
            <td>
                <asp:TextBox ID="txtIranyitoszam" runat="server" Enabled="false" MaxLength="4"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Város</td>
            <td>
                <asp:TextBox ID="txtVaros" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Utca: </td>
            <td>
                <asp:TextBox ID="txtUtca" runat="server" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Házszám</td>
            <td>
                <asp:TextBox ID="txtHazszam" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Ügyintéző:</td>
            <td>
                <asp:DropDownList ID="ddlUgyintezo" runat="server" DataSourceID="sqlUgyintezok" DataTextField="nevek" DataValueField="nevek"></asp:DropDownList></td>
        </tr>
        <tr><td>Kiírás dátuma: </td><td><asp:TextBox ID="txtKerveny_ido" runat="server"></asp:TextBox><asp:Label ID="lblNincsKiiras" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label></td></tr>
        <tr><td>Tárgy: </td><td><asp:TextBox ID="txtKerveny_Targy" runat="server" TextMode="MultiLine"></asp:TextBox><asp:Label ID="lblNincsTargy" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label></td></tr>
        <tr><td>Megjegyzés: </td><td><asp:TextBox ID="txt_Megjegyzes" runat="server" TextMode="MultiLine"></asp:TextBox></td></tr>
        <tr><td>Beadási Határidő: </td><td><asp:TextBox ID="txtHatarido" runat="server"></asp:TextBox></td></tr>
        <tr><td>Benyújtva: </td><td><asp:DropDownList ID="ddlBeadva" runat="server">
            <asp:ListItem Value="Y">Igen</asp:ListItem>
            <asp:ListItem Value="N">Nem</asp:ListItem>
            </asp:DropDownList></td></tr>
        <tr><td>Nyertes: </td><td><asp:DropDownList ID="ddlNyert" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlNyert_SelectedIndexChanged">
            <asp:ListItem Selected="True" Value="N">Nem</asp:ListItem>
            <asp:ListItem Value="Y">Igen</asp:ListItem>
            </asp:DropDownList></td></tr>
        <tr><td>Tervszám: </td><td><asp:DropDownList ID="ddlTervszam" runat="server" Enabled="false" DataSourceID="sqlSzerzodesek" DataTextField="azonosito" DataValueField="azonosito" ></asp:DropDownList></td></tr>
    <tr><td>Projekt név: </td><td><asp:TextBox ID="txtProjektNev" runat="server" Enabled="false"></asp:TextBox></td></tr>
    </table>
    <asp:Button ID="Feltoltes_Gomb" runat="server" Text="Feltöltés" OnClick="Feltoltes_Gomb_Click" />
    <asp:SqlDataSource ID="sql_Feltoltes" runat="server"  ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        InsertCommand="Insert Into ajanlatok (azonosito, iktatoszam, ki_kert, mikor_kert, mit_kert, bead_hatarido,beadva,nyert,ugyintezo,megjegyzes,projekt_nev)
                       values(@par_Azonosito, @par_Iktatoszam, (select azonosito from partnerek where nev = @par_nev and cim = @par_cim), @par_MikorKert,@par_MitKert, @par_Hatarido,@par_Beadva, @par_Nyert, @par_ugyintezo, @par_megjegyzes,@par_projekt_nev)">
        <InsertParameters>
            <asp:ControlParameter ControlID ="txtAzonosito" Name="par_Azonosito" PropertyName="text" Type="String" />
            <asp:ControlParameter ControlID ="ddlTervszam" Name="par_Iktatoszam" PropertyName="SelectedValue" Type="String" DefaultValue="null" />
            <asp:Parameter  Name="par_nev"  Type="String" />
            <asp:Parameter Name ="par_cim" Type="String" />
            <asp:ControlParameter ControlID ="txtKerveny_ido" Name="par_MikorKert" PropertyName="text" Type="string" />
            <asp:ControlParameter ControlID="txtKerveny_Targy" Name="par_MitKert" PropertyName="text" Type="String" />
            <asp:ControlParameter ControlID ="txtHatarido" Name="par_Hatarido" PropertyName="text" Type="string" />
            <asp:ControlParameter ControlID="ddlBeadva" Name="par_Beadva" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlNyert" Name="par_Nyert" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlUgyintezo" Name="par_ugyintezo" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txt_Megjegyzes" Name="par_megjegyzes" PropertyName="text" Type="String" />
            <asp:ControlParameter ControlID="txtProjektNev" Name="par_projekt_nev" PropertyName="text" Type="String" DefaultValue="null" />
        </InsertParameters>

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlSorszam" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select ajanlatok From sorszamok"
        UpdateCommand="Update sorszamok Set ajanlatok = @UjSorszam">
        <UpdateParameters>
            <asp:Parameter Name="UjSorszam" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlMegrendelo" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select nev, cim from partnerek"
        InsertCommand="insert into partnerek(nev, cim, azonosito) values (@par_nev, @par_cim, @par_azonosito)">
        <InsertParameters>
            <asp:Parameter  Name="par_nev" Type="String" />
            <asp:Parameter  Name="par_cim" Type="String" />
            <asp:Parameter Name="par_azonosito" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlUgyintezok" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select nevek from ugyintezok">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlSzerzodesek" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="select azonosito from szerzodesek">
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" Visible="false" Enabled="False" DataSourceID="sqlSorszam" DataValueField="ajanlatok" DataTextField="ajanlatok" OnDataBound="DropDownList1_DataBound">
    </asp:DropDownList>
    </asp:Content>
