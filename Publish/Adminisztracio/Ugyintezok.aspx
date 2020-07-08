<%@ Page Title="" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Ugyintezok.aspx.cs" Inherits="iktató.Adminisztracio.Ugyintezok" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    Ügyintézők kezelése
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="Tablestyle">
        <tr>
            <td>Név keresés: </td>
            <td><asp:TextBox ID="txtNevKereses" runat="server" OnTextChanged="txtNevKereses_TextChanged"></asp:TextBox></td>
            <td><asp:Button ID="btnKereses" Text="Keresés" runat="server" /></td>
        </tr>
        <tr>
            <td>
            Feltöltés: 
            </td>
        </tr>
        <tr>
            <td>Név: </td>
            <td><asp:TextBox ID="txtNevFeltoltes" runat="server"></asp:TextBox></td>
            <td>Azonosító: </td>
            <td><asp:TextBox ID="txtAzonositoFeltoltes" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnFeltoltes" Text="Feltöltés" runat="server" OnClick="btnFeltoltes_Click" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlUgyintezok" AllowPaging="True" AutoGenerateColumns="false" DataKeyNames="ID" CssClass="Gridstyle">
        <Columns>
            <asp:CommandField ShowDeleteButton ="true" />
            <asp:BoundField HeaderText ="Ügyintézők nevei" DataField="Nevek" SortExpression="Nevek" />
            <asp:BoundField HeaderText ="Azonosítók" DataField="ID" SortExpression="ID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlUgyintezok" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select Nevek, ID from ugyintezok where Nevek like @par_nev "
        InsertCommand="insert into ugyintezok(Nevek, ID) values (@par_nev, @par_ID)"
        DeleteCommand="delete from ugyintezok where ID = @ID">
        <SelectParameters>
            <asp:Parameter  Name="par_nev" Type="String" DefaultValue="%" />
        </SelectParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtNevFeltoltes" Name="par_nev" PropertyName="text" Type="String" />
            <asp:ControlParameter ControlID="txtAzonositoFeltoltes" Name="par_ID" PropertyName="text" Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
