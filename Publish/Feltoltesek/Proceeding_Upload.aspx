<%@ Page Title="Eljárások Feltöltése" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Proceeding_Upload.aspx.cs" Inherits="iktató.Proceeding_Upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    Eljárások Feltöltése
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <table class="Tablestyle">
        <tr>
            <td>
                Szerződésszám:
            </td>
            <td>
                <asp:DropDownList ID="ddlSzerzodesID" runat="server" DataSourceID="SqlIktatoszamok" DataTextField="azonosito" DataValueField="azonosito">

                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Ajánlat neve: 
            </td>
            <td>
                <asp:TextBox ID="txtEljarasNev" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnUpload" runat="server" Text="Feltöltés" OnClick="btnUpload_Click" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlIktatoszamok" runat="server"
        ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select azonosito, projekt_nev from szerzodesek">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlEljarasUpload" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        InsertCommand="insert into eljarasok(idEljarasok,EljarasNev)
                       values (@par_EljarasID, @par_EljarasNev)">
        <InsertParameters>
            <asp:Parameter Name="par_EljarasID" Type="String" />
            <asp:ControlParameter ControlID="txtEljarasNev" Name="par_EljarasNev" Type="String" PropertyName="Text" />
        </InsertParameters>

    </asp:SqlDataSource>

    <asp:SqlDataSource ID="Sqlsorszam" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select eljarasok from sorszamok"
        UpdateCommand="Update sorszamok Set eljarasok = @UjSorszam">
        <UpdateParameters>
            <asp:Parameter Name="UjSorszam" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
