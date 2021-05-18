using ALeague.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ALeague
{
    public partial class Results : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<ALeague.Models.Ladder> RMLadder_GetData()
        {
            var db = new Models.LadderEntities();

            // LINQ
            var results = (from si in db.Ladders
                           orderby si.clubID ascending, 
                           si.position ascending,
                           si.clubName ascending,
                           si.matchesPlayed ascending,
                           si.win ascending, si.draw ascending,
                           si.lost ascending, si.goalsFor ascending,
                           si.goalsAgainst ascending, si.goalDifference ascending,
                           si.points ascending, si.thumbnail
                           select si).ToList();
            // Lambda
            // results = db.Ladders
            //      .OrderBy(si => si.clubID)
            //      .ThenBy(si => si.position)
            //      .ThenBy(si => si.clubName)
            //      .ThenBy(si => si.matchesPlayed)
            //      .ThenBy(si => si.win)
            //      .ThenBy(si => si.draw)
            //      .ThenBy(si => si.lost)
            //      .ThenBy(si => si.goalsFor)
            //      .ThenBy(si => si.goalsAgainst)
            //      .ThenBy(si => si.goalDifference)
            //      .ThenBy(si => si.points)
            //      .Select(si => si)
            //      .ToList();

            return results;
        }
    }
}