<%@ Page Title="ViewTeam" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewTeam.aspx.cs" Inherits="ALeague.ViewTeam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
    <title>ViewTeam</title>
    <link href="ViewTeamStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">        

    <asp:FormView ID="FVTeam" runat="server" RenderOuterTable="False" DataKeyNames="teamID" DataSourceID="SDSTeam">
        <EditItemTemplate>
            teamID:
            <asp:Label ID="teamIDLabel1" runat="server" Text='<%# Eval("teamID") %>' />
            <br />
            teamName:
            <asp:TextBox ID="teamNameTextBox" runat="server" Text='<%# Bind("teamName") %>' />
            <br />
            place:
            <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
            <br />
            recentResults:
            <asp:TextBox ID="recentResultsTextBox" runat="server" Text='<%# Bind("recentResults") %>' />
            <br />
            players:
            <asp:TextBox ID="playersTextBox" runat="server" Text='<%# Bind("players") %>' />
            <br />
            coaches:
            <asp:TextBox ID="coachesTextBox" runat="server" Text='<%# Bind("coaches") %>' />
            <br />
            nextGame:
            <asp:TextBox ID="nextGameTextBox" runat="server" Text='<%# Bind("nextGame") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            teamName:
            <asp:TextBox ID="teamNameTextBox" runat="server" Text='<%# Bind("teamName") %>' />
            <br />
            place:
            <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
            <br />
            recentResults:
            <asp:TextBox ID="recentResultsTextBox" runat="server" Text='<%# Bind("recentResults") %>' />
            <br />
            players:
            <asp:TextBox ID="playersTextBox" runat="server" Text='<%# Bind("players") %>' />
            <br />
            coaches:
            <asp:TextBox ID="coachesTextBox" runat="server" Text='<%# Bind("coaches") %>' />
            <br />
            nextGame:
            <asp:TextBox ID="nextGameTextBox" runat="server" Text='<%# Bind("nextGame") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="form-group">
                <br />
                <button id="BClick" type="button" class="btn btn-outline-dark">Click to view Club Logo</button>
                <div id="team" class="container-fluid text-center" style="display: none">
                    <img id="teamIMG" alt="<%# Eval("teamName") %>" src="<%# Eval("thumbnail") %>" class="img-thumbnail" />
                </div>
                <br />
                Club:
                <p>
                    <asp:Label ID="teamNameLabel" runat="server" Text='<%# Bind("teamName") %>' />
                </p>
            </div>
            <div class="form-group">
                Place:
                <p>
                    <asp:Label ID="placeLabel" runat="server" Text='<%# Bind("place") %>' />
                </p>
            </div>
            <div class="form-group">
                Last 5 Results:
                <p>
                    <asp:Label ID="recentResultsLabel" runat="server" Text='<%# Bind("recentResults") %>' />
                </p>
            </div>
            <div class="form-group">
                Players:
                <p>
                    <asp:Label ID="playersLabel" runat="server" Text='<%# Bind("players") %>' />
                </p>
            </div>
            <div class="form-group">
                Coaches:
                <p>
                    <asp:Label ID="coachesLabel" runat="server" Text='<%# Bind("coaches") %>' />
                </p>
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            <h2 class="container-fluid text-center">No A League Team was selected.</h2>
            <br />
            <div class="container-fluid alert alert-info" style="background-color: black">                
                    <a href="/Teams.aspx" style="color: white">Click here to select a Team</a>                                        
            </div>
        </EmptyDataTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="SDSTeam" runat="server" ConnectionString="<%$ ConnectionStrings:TeamsDB %>" SelectCommand="SELECT * FROM [Teams] WHERE ([teamID] = @teamID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="teamID" QueryStringField="id" Type="Int32" />
        </SelectParameters>

    </asp:SqlDataSource>

    <script>       
        // Javascript EvenListener
        var team = document.getElementById("team");
        var teamIMG = document.getElementById("teamIMG");

        if (teamIMG !== null) {

            document.getElementById("BClick").addEventListener('click', callFunction);
            function callFunction(e) {

                if (team.style.display == "none") {
                    team.style.display = "block";
                }

                else {
                    team.style.display = "none";
                }
                e.preventDefault();
            }
        }     
    </script>

</asp:Content>

