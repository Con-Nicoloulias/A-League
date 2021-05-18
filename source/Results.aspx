<%@ Page Title="Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="ALeague.Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPhead" runat="server">    
    <title>Results</title>
    <link href="ResultsStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">
    <h2 class="text-center mb-3 mt-3">Select a Team to view their overall results</h2>

    <div class="col-2">
        <h4 class="text-left">#</h4>
    </div>        
    
    <asp:Repeater ID="RMLadder" runat="server" SelectMethod="RMLadder_GetData" 
        ItemType="ALeague.Models.Ladder">
        <ItemTemplate>                    
            <div id="TeamBorder" class="alert alert-info">
                <div id="Rank"> 
                    <%# Item.position %>                         
                    <a href="ViewResult.aspx?id=<%# Item.clubID %>" class="col-8" id="Club">
                        <%# Item.clubName %>
                    </a>
                </div>
            </div>
        </ItemTemplate>    
    </asp:Repeater>           
    
    <script src="Scripts/jquery-3.4.1.js"></script>
        
    <script>
        // JQuery
        // Want to animate all items in repeater, however I could only animate one repeater.
        $('#TeamBorder').on('mouseover', function () {
            $(this).animate({
                'background-color': 'rgb(25, 25, 112)',
                'border': '3px solid rgb(0, 0, 0)'
            }, 2000, null)            
        })
    </script>    

</asp:Content>

