<%@ Page Title="" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Proceeding_LibrarySearch.aspx.cs" Inherits="iktató.Keresesek.Proceeding_LibrarySearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
    <asp:GridView ID="grdEljarasKonyvtarak" runat="server" DataSourceID="sqlEljarasKonyvtarak"></asp:GridView>

    <asp:SqlDataSource ID="sqlEljarasok" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select idEljarasok from eljarasok where idEljarasok like @par_EljarasID">
        <SelectParameters>
            <asp:Parameter Name="par_EljarasID" Type="String" DefaultValue="%"/>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlEljarasKonyvtarak" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="select datum, megjegyzes, eleresi_ut from eljaras_konyvtara
                       where eljaras_id = @par_EljarasID">
        <SelectParameters>
            <asp:Parameter Name="par_EljarasID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
