using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class user : System.Web.UI.Page
    {
        int userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Request.QueryString["user"];
            welcome.Text = "welcome " + username;

            var cs = "Data Source=GIONEE;Initial Catalog=nyau;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true";
            var connection = new SqlConnection(cs);
            connection.Open();

            var sql = "select Id from users where UserName='" + username + "'";
            var command = new SqlCommand(sql, connection);

            var reader = command.ExecuteReader();
            reader.Read();
            userId = (int)reader[0];
            users_product(userId);
            Load_Products_OnSale();
            Load_Product_OnCollections();
        }

        protected void Log_Out(object sender, EventArgs e)
        {
            Response.Redirect("nyau.aspx");
        }

        protected void Load_Products_OnSale()
        {
            var cs = "Data Source=GIONEE;Initial Catalog=nyau;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true";
            var connection = new SqlConnection(cs);
            connection.Open();

            var sql = "select * from products";
            var command = new SqlCommand(sql, connection);

            var reader = command.ExecuteReader();
            Repeater_OnSale.DataSource = reader;
            Repeater_OnSale.DataBind();
        }

        protected void Load_Product_OnCollections()
        {
            var cs = "Data Source=GIONEE;Initial Catalog=nyau;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true";
            var connection = new SqlConnection(cs);
            connection.Open();

            var sql = "select * from products";
            var command = new SqlCommand(sql, connection);

            var reader = command.ExecuteReader();
            Repeater_OnCollections.DataSource = reader;
            Repeater_OnCollections.DataBind();
        }

        protected void users_product(int userId)
        {
            var cs = "Data Source=GIONEE;Initial Catalog=nyau;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true";
            var connection = new SqlConnection(cs);
            connection.Open();

            var sql = "select count(*) from users_products where UserId=" + userId;
            var command = new SqlCommand(sql, connection);

            int reader = (int)command.ExecuteScalar();
            items_count.Text = reader.ToString();
        }

    }
}