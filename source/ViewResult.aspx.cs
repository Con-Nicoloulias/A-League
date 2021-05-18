using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ALeague
{
    public partial class ViewResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if(string.IsNullOrEmpty(id))
            {
                Response.Redirect("Results.aspx");
            }
        }

        public class ResultDetail
        {
            public int clubID { get; set; }
            public Models.Ladder result { get; set; }
            
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public ResultDetail FVResult_GetItem([QueryString] int id)
        {
            var db = new Models.LadderEntities();
            var result = (from r in db.Ladders
                          where r.clubID == id
                          select new ResultDetail
                          {
                              clubID = r.clubID,
                              result = r
                          }).FirstOrDefault();
                              

            return result;
        }
    }
}