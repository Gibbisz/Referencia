<%@ Page Title="Levelek Feltöltése" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Mail_Upload.aspx.cs" Inherits="iktató.Mail_Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    Levelek Feltöltése
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        $(document).ready(function () {
            $("[id$=MainContent_txtBeerkezes]").datepicker({
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
        <tr>
            <td>Iktatószám:</td>
            <td>
                <asp:DropDownList ID="ddlIktatoszam" runat="server" AutoPostBack="true" DataSourceID="SqlIktatoszamok" DataTextField="azonosito" DataValueField="projekt_nev" OnSelectedIndexChanged="ddlIktatoszam_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Label ID="Azonosito" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Levél iránya:</td>
            <td>
                <asp:DropDownList ID="ddlLevelIrany" runat="server">
                    <asp:ListItem Value="Be">Be</asp:ListItem>
                    <asp:ListItem Value="Ki">Ki</asp:ListItem>
                </asp:DropDownList>
                &nbsp;Levél Típusa:&nbsp;
           
                <asp:DropDownList ID="ddlLevelTipus" runat="server">
                    <asp:ListItem Value="Levél">Levél</asp:ListItem>
                    <asp:ListItem Value="E-mail">E-mail</asp:ListItem>
                    <asp:ListItem Value="Fax">Fax</asp:ListItem>
                </asp:DropDownList>
            </td>
   
        </tr>
        <tr>
            <td>
                Eljárás: 
            </td>
            <td>
                <asp:DropDownList ID="ddlEljarasok" runat="server" DataSourceID="sqlEljarasok" DataTextField="idEljarasok" DataValueField="idEljarasok"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Címzett: </td>
            <td><asp:CheckBoxList ID="chkbxlstCimzettek" runat="server" ></asp:CheckBoxList>
                <asp:Button ID="btnTorles" Text="Törlés" runat="server" Visible="false" Enabled="false" OnClick="btnTorles_Click" />
                <asp:Label ID="lblNincsCimzett" runat="server" Text="Nincs Címzett" BackColor="Red"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlPartner" runat="server" DataSourceID="sqlPartner" DataTextField="nev" DataValueField="cim" AutoPostBack="True" OnSelectedIndexChanged="ddlPartner_SelectedIndexChanged"></asp:DropDownList>
                <asp:Label ID="labelCim" Text="" runat="server"></asp:Label>
                <asp:Button ID="btnMeglevo_Feltoltese" Text="Hozzáadás" runat="server" OnClick="Hozzaadas" />
            </td>
        </tr>
        <tr>
            <td>Új Címzett feltöltése:</td>
            <td>
                <asp:CheckBox ID="chbxUjPartner" runat="server" AutoPostBack="true" OnCheckedChanged="Feltoltes_CheckedChanged" /></td>
        </tr>
        <tr>
            <td>Címzett neve:</td>
            <td>
                <asp:TextBox ID="txtPartnerNev" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Címzett Címe: Irányítószám</td>
            <td>
                <asp:TextBox ID="txtIranyitoszam" runat="server" Enabled="false" MaxLength="4"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Város</td>
            <td>
                <asp:TextBox ID="txtVaros" runat="server" Enabled="false"></asp:TextBox></td>
            <td>
                <asp:Button ID="btn_Feltoltes" Text="Hozzáadás" runat="server" Enabled="false" Visible="false" OnClick="Hozzaadas"/>
            </td>
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
            <td>Címzett Ügyintéző neve:</td>
            <td>
                <asp:TextBox ID="txtPartnerUgyint" runat="server" >
                </asp:TextBox>
                <asp:Label ID="lblNincsUgyintezo" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Szerződés tárgya: </td>
            <td>
                <asp:Label ID="lblProjectNev" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Tárgy:</td>
            <td>
                <asp:TextBox ID="txtTargy" runat="server"></asp:TextBox>
                <asp:Label ID="lblNincsTargy" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Ügyintéző:</td>
            <td>
                <asp:DropDownList ID="ddlUgyintezo" runat="server" DataSourceID="sqlUgyintezok" DataTextField="nevek" DataValueField="nevek"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Hiv. Szám: </td>
            <td>
                <asp:TextBox ID="txtHivSzam" runat="server"></asp:TextBox>
                <asp:Label ID="lblNincsHivSzam" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Lefűzés Helye: </td>
            <td>
                <asp:TextBox ID="txtLefuzesHelye" runat="server"></asp:TextBox>
                <asp:Label ID="lblNincsLefHely" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Előzmény:</td>
            <td>
                <asp:CheckBox ID="ElozmenyEngedely" runat="server" AutoPostBack="True" OnCheckedChanged="ElozmenyEngedely_CheckedChanged" /><asp:DropDownList ID="ddlElozmeny" runat="server" DataSourceID="sqlInsertLevelek" DataTextField="iktatoszam" DataValueField="iktatoszam" Enabled="False" Visible="False"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Beérkezés ideje:</td>
            <td>
                <asp:TextBox ID="txtBeerkezes" runat="server"></asp:TextBox>
                <asp:Label ID="lblNincsBeerkezes" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label>

            </td>
        </tr>
        <tr>
            <td>Határidő: </td>
            <td>
                <asp:TextBox ID="txtHatarido" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>File kiválasztása:</td>
            <td>
                <br />
                <asp:FileUpload ID="fileTarolasHelye" runat="server" />
                <asp:Label ID="lblNincsFile" runat="server" Text="Hiányzó adat" BackColor="Red" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Button ID="uploadbutton" runat="server" Text="Feltöltés" OnClick="uploadbutton_Click" Height="34px" Width="100px" />
    <asp:DropDownList ID="ddlSeged" runat="server" Visible="False" Enabled="False" DataSourceID="Sqlsorszam" DataTextField="levelek" DataValueField="levelek" OnDataBound="ddlSeged_DataBound"></asp:DropDownList>
    <asp:SqlDataSource ID="Sqlsorszam" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select levelek from sorszamok"
        UpdateCommand="Update sorszamok Set levelek = @UjSorszam">
        <UpdateParameters>
            <asp:Parameter Name="UjSorszam" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlIktatoszamok" runat="server"
        ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select azonosito, projekt_nev from szerzodesek">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlInsertLevelek" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select iktatoszam from levelek"
        InsertCommand="insert into levelek(iktatoszam,irany,tipus,partner_ugyintezo,targy,ugyintezo,elozmeny,
                       beerkezes_datum,projekt_nev, hiv_szam, lefuzes_helye)
                       values(@par_iktatoszam, @par_irany, @par_tipus, @par_PartUgyint, @par_targy, @par_ugyintezo, @par_elozmeny, @par_bedatum, @par_projektnev, @par_hivszam, @par_lefuzeshelye)">
        <InsertParameters>
            <asp:ControlParameter ControlID ="Azonosito" Name="par_iktatoszam" PropertyName="text" Type="String" />
            <asp:ControlParameter ControlID ="ddlLevelIrany" Name="par_irany" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID ="ddlLevelTipus" Name="par_tipus" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtPartnerUgyint" Name="par_PartUgyint" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtTargy" Name="par_targy" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlUgyintezo" Name="par_ugyintezo" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlElozmeny" Name="par_elozmeny" PropertyName="SelectedValue" Type="String" DefaultValue=" " />
            <asp:ControlParameter ControlID="txtBeerkezes" Name="par_bedatum" PropertyName="text" Type="DateTime" />
            <asp:ControlParameter ControlID="lblProjectNev" Name="par_projektnev" PropertyName="text" Type="String" DefaultValue="null" />
            <asp:ControlParameter ControlID="txtHivSzam" Name="par_hivszam" PropertyName="text" Type="String" />
            <asp:ControlParameter ControlID="txtLefuzesHelye" Name="par_lefuzeshelye" PropertyName="text" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlInsertLevelekEsEljarasok" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>" 
        InsertCommand="Insert into levelek_eljarashoz (Level_ID, eljaras_id, hatarido, teljesitett)
                       values(@par_LevelID, @par_EljarasID, @par_Hatarido, 'nem')">
        <InsertParameters>
            <asp:ControlParameter ControlID ="Azonosito" Name="par_LevelID" PropertyName="text" Type="String" />
            <asp:ControlParameter ControlID="ddlEljarasok" Name="par_EljarasID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtHatarido" Name="par_Hatarido" PropertyName="text" Type="DateTime" />
        </InsertParameters>

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
    <asp:SqlDataSource ID="sqlFilefeltoltes" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        InsertCommand="Insert into fileok(azonosito, Filenev) values (@par_azonosito,@par_filenev)">
        <InsertParameters>
            <asp:ControlParameter ControlID="Azonosito" Name="par_azonosito" PropertyName="text" Type="String" />
            <asp:Parameter Name="par_filenev" Type="String" />
        </InsertParameters>

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlUgyintezok" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select nevek from ugyintezok">

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCimzettfeltoltes" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        InsertCommand="Insert into level_cimzettek (ID, level_azonosito, cimzett_azonosito)
                       values(@par_ID,@par_levelID,
                             (select azonosito from partnerek where nev = @par_cimzettnev and cim = @par_cimzettcim))">
        <InsertParameters>
            <asp:Parameter Name="par_ID" Type="String" />
            <asp:ControlParameter ControlID="Azonosito" Name="par_levelID" PropertyName="text" Type="String" />
            <asp:Parameter Name="par_cimzettnev" Type="String" />
            <asp:Parameter Name="par_cimzettcim" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlEljarasok" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select idEljarasok from eljarasok">

    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenSorszam" runat="server" />
    <asp:HiddenField ID="HiddenSeged" runat="server" />
</asp:Content>
