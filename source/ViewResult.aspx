<%@ Page Title="ViewResult" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewResult.aspx.cs" Inherits="ALeague.ViewResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
    <title>ViewResult</title>
    <link href="ViewResultStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">

    <asp:FormView ID="FVResult" runat="server" ItemType="ALeague.ViewResult+ResultDetail"
        SelectMethod="FVResult_GetItem">        
        <ItemTemplate>            
            <div class="form-group">
                <label>Club:</label>
                <%# Item.result.clubName %>                                
                <p>
                    <img id="clubIMG" alt="<%# Item.result.clubName %>" src="<%# Item.result.thumbnail %>" class="img-thumbnail" />
                </p>                
            </div>
            <div class="form-group">
                <label>Position:</label>
                <%# Item.result.position %>                
            </div>
            <div class="form-group">
                <label>Matches Played:</label>                
                <%# Item.result.matchesPlayed %>                
            </div>
            <div class="form-group">
                <label>Matches Won:</label>               
                <%# Item.result.win %>
            </div>
            <div class="form-group">
                <label>Matches Drawn:</label>
                <%# Item.result.draw %>
            </div>
            <div class="form-group">
                <label>Matches Lost:</label>
                <%# Item.result.lost %>
            </div>
            <div class="form-group">
                <label>Goals Scored:</label>
                <%# Item.result.goalsFor %>
            </div>
            <div class="form-group">
                <label>Goals Conceded:</label>
                <%# Item.result.goalsAgainst %>
            </div>
            <div class="form-group">
                <label>Goal Difference:</label>
                <%# Item.result.goalDifference %>
            </div>
            <div class="form-group">
                <label>Points:</label>
                <%# Item.result.points %>
            </div>
        </ItemTemplate>        
    </asp:FormView>

</asp:Content>