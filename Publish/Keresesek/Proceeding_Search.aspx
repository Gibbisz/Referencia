<%@ Page Title="Eljárások Keresése" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Proceeding_Search.aspx.cs" Inherits="iktató.Proceeding_Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    Eljárások Keresése
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="grdLevelek" runat="server" DataSourceID="sqlNemTeljesitett">

    </asp:GridView>




    <asp:SqlDataSource ID="sqlNemTeljesitett" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
            ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="select level_ID, eljaras_id, hatarido, teljesitett 
                       from levelek_eljarashoz
                       where teljesitett = 'nem'">
        
    </asp:SqlDataSource>
</asp:Content>
