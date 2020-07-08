<%@ Page Title="Szerződések Feltöltése" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Contract_Upload.aspx.cs" Inherits="iktató.Contract_Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script>
        $(document).ready(function() {
            $("[id$=MainContent_txtAlairas]").datepicker({
                dateFormat: 'yy/mm/dd',
                changeMonth: true,
                changeYear: true
            });
            $("[id$=MainContent_txtHatalybalep]").datepicker({
                dateFormat: 'yy/mm/dd',
                changeMonth: true,
                changeYear: true
            });
            $("[id$=MainContent_txtVeghatarido]").datepicker({
                dateFormat: 'yy/mm/dd',
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
    Szerződések Feltöltése
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <table class="Tablestyle">
        <tr>
            <td>Azonosító: </td>
            <td>
                <%--<asp:Button Text="Generál" runat="server" OnClick="Btn_General_Click" ID="btn_General" />--%>
                <asp:Label ID="Azonosito" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Megbízók: 
            </td>
            <td>
                <asp:CheckBoxList ID="lstbxMegbizok" runat="server"></asp:CheckBoxList>
                <asp:Button ID="btnTorles" Text="Törlés" runat="server" Visible="false" Enabled="false" OnClick="TorlesListabol" />
                <asp:Label ID="lblNincsMegbizo" runat="server" Text="Nincs Megbízó" BackColor="Red"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlPartner" runat="server" DataSourceID="sqlPartner" DataTextField="nev" DataValueField="cim" AutoPostBack="True" OnSelectedIndexChanged="ddlPartner_SelectedIndexChanged"></asp:DropDownList>
                <asp:Label ID="labelCim" Text="" runat="server"></asp:Label>
                <asp:Button ID="btn_HozzaadMeglevo" Text="Hozzáad" runat="server" OnClick="btnHozzaad_Click" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>Új megbízó:</td>
            <td>
                <asp:CheckBox ID="chbxUjPartner" runat="server" AutoPostBack="true" OnCheckedChanged="Feltoltes_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td>Megbízó neve:</td>
            <td>
                <asp:TextBox ID="txtPartnerNev" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Megbízó Címe: Irányítószám</td>
            <td>
                <asp:TextBox ID="txtIranyitoszam" runat="server" Enabled="false" MaxLength="4"></asp:TextBox></td>

        </tr>
        <tr>
            <td>Város</td>
            <td>
                <asp:TextBox ID="txtVaros" runat="server" Enabled="false" Height="22px"></asp:TextBox></td>
            <td>
                <asp:Button Text="Hozzáad" ID="btnHozzaad" runat="server" OnClick="btnHozzaad_Click" Enabled="false" Visible="false" /></td>
        </tr>
        <tr>
            <td>Utca: </td>
            <td>
                <asp:TextBox ID="txtUtca" runat="server" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Házszám
            </td>
            <td>
                <asp:TextBox ID="txtHazszam" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                Szerződés tárgya: 
            </td>
            <td>
                <asp:TextBox ID="txtTargy" runat="server" Width="190px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblNincsTargy" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Aláírás Dátuma: </td>
            <td>
                <asp:TextBox ID="txtAlairas" runat="server"></asp:TextBox>
                <asp:Label ID="lblNincsAlairasDatum" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Hatálybalépés dátuma: </td>
            <td>
                <asp:TextBox ID="txtHatalybalep" runat="server"></asp:TextBox>
                <asp:Label ID="lblNincsHatalybalepDatum" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label>

            </td>
        </tr>
        <tr>
            <td>Részhatáridő(k): </td>
            <td>
                <asp:CheckBoxList ID="lstbxReszhataridok" runat="server"></asp:CheckBoxList>
                <asp:Button ID="btnHataridoTorles" Text="Törlés" runat="server" Visible="false" Enabled="false" OnClick="TorlesListabol" />
            </td>
            <td>
                <asp:TextBox ID="txtReszhatarido" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="btnReszhataridoHozzaad" Text="Hozzáad" runat="server" OnClick="btnReszhataridoHozzaad_Click" /></td>
        </tr>
        <tr>
            <td>Véghatáridő: </td>
            <td>
                <asp:TextBox ID="txtVeghatarido" runat="server"></asp:TextBox>
                <asp:Label ID="lblNincsVeghatarido" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label>

            </td>
        </tr>
        <tr>
            <td style="height: 32px">Konzorcium társ: </td>
            <td style="height: 32px">
                <asp:DropDownList ID="ddlTars" runat="server" Enabled="False"></asp:DropDownList>
                <asp:CheckBox ID="chboxTars" runat="server" OnCheckedChanged="chboxTars_CheckedChanged" AutoPostBack="true" />
            </td>
        </tr>
        <tr>
            <td>Szerződéshez tartozó ajánlat: </td>
            <td><asp:DropDownList ID="ddlAjanlat" runat="server" DataSourceID="sqlAjanlatok" DataTextField="azonosito" DataValueField="azonosito" ></asp:DropDownList></td>
        </tr>
    </table>
    <asp:Button ID="btnFeltoltes" Text="Feltöltés" runat="server" OnClick="btnFeltoltes_Click" />
    <asp:DropDownList ID="ddlSeged" runat="server" Visible="False" Enabled="False" DataSourceID="Sqlsorszam" DataTextField="szerzodesek" DataValueField="szerzodesek" OnDataBound="ddlSeged_DataBound"></asp:DropDownList>
    <asp:SqlDataSource ID="sqlSzerzodesFeltoltes" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        InsertCommand="Insert into szerzodesek(azonosito, alairas_datum, hatalybalepes_datum,
                                               konzorcium_tars,  veghatarido, projekt_nev)
                       values(@par_azonosito, @par_alairasdatum, @par_hatalybalepesdatum, 
                             (select azonosito from partnerek where nev = @par_nev and cim = @par_cim),@par_veghatarido,@par_ProjektNev)">
        <InsertParameters>
            <asp:ControlParameter ControlID="Azonosito" Name="par_azonosito" PropertyName="text" Type="String" />
            <asp:ControlParameter ControlID="txtAlairas" Name="par_alairasdatum" PropertyName="text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtHatalybalep" Name="par_hatalybalepesdatum" PropertyName="text" Type="DateTime" />
            <asp:Parameter Name="par_nev" Type="String" DefaultValue="null"/>
            <asp:Parameter Name="par_cim" Type="String" />
            <asp:ControlParameter ControlID="txtVeghatarido" Name="par_veghatarido" PropertyName="text" Type="String" />
            <asp:ControlParameter ControlID="txtTargy" Name="par_ProjektNev" PropertyName="text" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlMegbizofeltoltes" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        InsertCommand="Insert into szerzodes_megbizok (szerzodes_azonosito, megbizo_azonosito, id)
                       values(@par_szerzodesID,
                             (select azonosito from partnerek where nev = @par_megbizonev and cim = @par_megbizocim),
                              @par_ID)">
        <InsertParameters>
            <asp:ControlParameter ControlID="Azonosito" Name="par_szerzodesID" PropertyName="text" Type="String" />
            <asp:Parameter Name="par_megbizonev" Type="String" />
            <asp:Parameter Name="par_megbizocim" Type="String" />
            <asp:Parameter Name="par_ID" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Sqlsorszam" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select szerzodesek from sorszamok"
        UpdateCommand="Update sorszamok Set szerzodesek = @UjSorszam">
        <UpdateParameters>
            <asp:Parameter Name="UjSorszam" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlPartner" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select nev, cim from partnerek"
        InsertCommand="insert into partnerek(nev, cim, azonosito) values (@par_nev, @par_cim, @par_azonosito)">
        <InsertParameters>
            <asp:Parameter Name="par_nev" Type="String" />
            <asp:Parameter Name="par_cim" Type="String" />
            <asp:Parameter Name="par_azonosito" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlAjanlatok" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="select azonosito from ajanlatok"
        UpdateCommand="Update ajanlatok set nyert = 'Y', iktatoszam = @par_szerzodesszam where azonosito = @par_ajanlatazonosito">
        <UpdateParameters>
            <asp:ControlParameter ControlID="Azonosito" Name="par_szerzodesszam" PropertyName="text" Type="String" />
            <asp:Parameter Name="par_ajanlatazonosito" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlReszhataridok" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        InsertCommand="insert into reszhataridok(ID, szerzodes_azonosito, reszhatarido)
                       values (@par_ID, @par_szerz_azonosito, @par_reszhatarido)">
        <InsertParameters>
            <asp:Parameter Name="par_ID" Type="String" />
            <asp:ControlParameter ControlID="Azonosito" PropertyName="text" Name="par_szerz_azonosito" Type="String" />
            <asp:Parameter Name="par_reszhatarido" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenSorszam" runat="server" />
    <asp:HiddenField ID="HiddenSeged" runat="server" />
</asp:Content>
