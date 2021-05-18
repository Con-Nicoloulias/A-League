<%@ Page Title="Teams" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teams.aspx.cs" Inherits="ALeague.Teams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
    <title> Teams </title>
    <!-- link to style sheet -->
    <link href="TeamsStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">
    <h2 class="text-center mb-3 mt-3">Select a Team to know more about them</h2>
       
    <asp:Repeater ID="RTeamData" runat="server" DataSourceID="SDSTeamData">
        <ItemTemplate>            
            <div id="selectTeam" class="alert alert-info">
                <a href="ViewTeam.aspx?id=<%# Eval("teamID")%>" target="_blank" 
                    style="color: white" id="myTeams">
                    <%# Eval("teamName") %>
                </a>                            
            </div>  
        </ItemTemplate>
    </asp:Repeater>
    
    <asp:SqlDataSource ID="SDSTeamData" runat="server"
        ConnectionString="<%$ ConnectionStrings:TeamsDB %>"
        SelectCommand="SELECT * FROM [Teams]">
    </asp:SqlDataSource>    
    
    <script>

        /* Tried to attempt colouring each background of <div id="selectTeam" class="alert alert-info">
         * to a specific colour depending on the team.
         *
        var teams = document.getElementById('myTeams').getElementsByTagName('a');
        var background = document.getElementsByTagName('div')[0];

        for (var i = 0; i < teams.length; i++) {
            if (teams[i] === teams[1]) {
                teams[i].style = 'background-color: orange';
            }
        }
        */

    </script>
</asp:Content>
