<%@ Page Title="" Language="C#" MasterPageFile="~/Iktato.Master" AutoEventWireup="true" CodeBehind="Main_Page.aspx.cs" Inherits="iktató.Main_Page" %>
<asp:Content ID="Head" ContentPlaceHolderID="Head" runat="server">
    Főoldal
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="Helper" DataSourceID="SqlDataSource1" DataTextField="jelenlegi_ev" DataValueField="jelenlegi_ev" runat="server" Enabled="false" Visible="false"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbc %>"
        ProviderName="<%$ ConnectionStrings:dbc.ProviderName %>"
        SelectCommand="Select jelenlegi_ev From sorszamok"
        UpdateCommand="update sorszamok
                       set levelek = 0, ajanlatok = 0, szerzodesek = 999, eljarasok = 0, jelenlegi_ev = @par_UjEv
                       where jelenlegi_ev = @par_RegiEv">
        <UpdateParameters>
            <asp:Parameter Name="par_UjEv" Type="Int32" />
            <asp:Parameter Name="par_RegiEv" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
