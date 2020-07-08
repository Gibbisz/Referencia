<%@ Page Title="" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Proceeding_Library.aspx.cs" Inherits="iktató.Feltoltesek.Proceeding_Library" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        $(document).ready(function () {
            $("[id$=MainContent_txtDatum]").datepicker({
                dateFormat: 'yy/mm/dd',
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
    <table class="Tablestyle">
        <tr>
            <td>Eljárások: 
            </td>
            <td>
                <asp:TextBox ID="txtEljarasNev" runat="server">
                </asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Keresés" OnClick="btnSearch_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddlEljarasok" runat="server" DataSourceID="sqlEljarasok" DataTextField="idEljarasok" DataValueField="idEljarasok">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="btnSelect" runat="server" Text="Kiválaszt" OnClick="btnSelect_Click" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table class="Tablestyle">
        <tr>
            <td>Eljárás: 
            </td>
            <td>
                <asp:TextBox ID="txtValasztottEljaras" runat="server" ReadOnly="true" BackColor="LightGray"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Dátum: 
            </td>
            <td>
                <asp:TextBox ID="txtDatum" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Megjegyzés: 
            </td>
            <td>
                <asp:TextBox ID="txtMegjegyzes" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Elérési út: 
            </td>
            <td>
                <asp:TextBox ID="txtEleresiUt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnFeltoltes" runat="server" Text="Feltöltés" OnClick="btnFeltoltes_Click" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="sqlEljarasok" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select idEljarasok from eljarasok where idEljarasok like @par_EljarasID">
        <SelectParameters>
            <asp:Parameter Name="par_EljarasID" Type="String" DefaultValue="%"/>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlEljarasKonyvtar" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        InsertCommand="insert into eljaras_konyvtara (eljaras_id, datum, megjegyzes, eleresi_ut)
                       values(@par_EljarasID, @par_Datum, @par_Megjegyzes, @par_EleresiUt)">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtValasztottEljaras" Name="par_EljarasID" Type="String" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtDatum" Name="par_Datum" Type="DateTime" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMegjegyzes" Name="par_Megjegyzes" Type="String" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtEleresiUt" Name="par_EleresiUt" Type="String" PropertyName="Text" />
        </InsertParameters>

    </asp:SqlDataSource>

</asp:Content>
