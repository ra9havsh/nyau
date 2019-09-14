using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NameValueCollection nvc = Request.Form;

            var username = nvc["uname"];
            var password = nvc["pwd"];

            var cs = "Data Source=GIONEE;Initial Catalog=nyau;Integrated Security=True;Pooling=False;";
            var connection = new SqlConnection(cs);
            connection.Open();

            var sql = "select count(*) from users where userName='"+username+"' and Password='"+password+"';";
            var command = new SqlCommand(sql, connection);

            int count = (int)command.ExecuteScalar();

            sql = "select count(*) from users where userName='" + username +"';";
            command = new SqlCommand(sql, connection);
            int count_user = (int)command.ExecuteScalar();

            if (count>1)
            {
                Response.Redirect("nyau.aspx?status=error_sql");
            }
            else if (count_user==0)
            {
                Response.Redirect("nyau.aspx?status=no_user");
            }
            else if (count == 1)
            {
                Response.Redirect("~/user.aspx?user=" + username);
            }
            else
            {
                Response.Redirect("nyau.aspx?status=no_password");
            }
        }
    }
}