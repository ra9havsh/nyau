using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class nyau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_Dateofbirth();
            Load_Products_OnSale();
            Load_Product_OnCollections();

           if (!String.IsNullOrEmpty(Request.QueryString["status"]))
           {
                if(Request.QueryString["status"]=="registered")
                    Response.Write("<script>" +
                        "alert('Now please login with your username and password to proceed')" +
                        "</script>");

                if (Request.QueryString["status"] == "error_sql")
                    Response.Write("<script>" +
                        "alert('More than one user.')" +
                        "</script>");

                if (Request.QueryString["status"] == "no_user")
                    Response.Write("<script>" +
                        "alert('Invalid username.')" +
                        "</script>");

                if (Request.QueryString["status"] == "no_password")
                    Response.Write("<script>" +
                        "alert('Invalid password.')" +
                        "</script>");
            }
            
        }

        protected void Registration(object sender, EventArgs e)
        {
            if (validate())
            {
                var firstName = fname.Text;
                var lastName = lname.Text;
                var userName = uname.Text;
                var Password = formPassword.Text;
                var Gender = "";
                var DateOfBirth = yearDropDownList.Text + "/"
                              + string.Format("{0}", monthDropDownList.SelectedIndex + 1) + "/"
                              + string.Format("{0}", dayDropDownList.SelectedIndex + 1);
                var Email = email.Text;
                var Contact = contactNo.Text;

                if (maleRadioButton.Checked)
                    Gender = maleRadioButton.Text;
                if (femaleRadioButton.Checked)
                    Gender = femaleRadioButton.Text;

                var cs = "Data Source=GIONEE;Initial Catalog=nyau;Integrated Security=True;Pooling=False";
                var connection = new SqlConnection(cs);
                connection.Open();

                var search = "select count(*) from users where UserName='"+userName+"';";
                var cmd = new SqlCommand(search, connection);
                int count_user = (int)cmd.ExecuteScalar();

                if (count_user == 0)
                {
                    var sql = string.Format("Insert into users(FirstName,LastName,UserName,Password,DateOfBirth,Gender,Email,ContactNo) " +
                        "values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}');", firstName, lastName, userName, Password, DateOfBirth, Gender, Email, Contact);

                    var command = new SqlCommand(sql, connection);
                    command.ExecuteNonQuery();

                    Response.Redirect("nyau.aspx?status=registered");
                }
                else
                {
                        Response.Write("<script>" +
                            "alert('username already exists, try another.')" +
                            "</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('something went error on sql');</script>");
            }

        }

        protected Boolean validate()
        {
            var firstName = fname.Text;
            var lastName = lname.Text;
            var userName = uname.Text;
            var Password = formPassword.Text;
            var confirmPassword = rePassword.Text;
            var Gender = "";
            var DateOfBirth = "";
            var Email = email.Text;
            var Contact = contactNo.Text;

            if (firstName == "")
            {
                Response.Write("<script>alert('please enter your first name.')</script>");
                return false;
            }

            if (lastName == "")
            {
                Response.Write("<script>alert('please enter your last name.')</script>");
                return false;
            }

            if (userName == "")
            {
                Response.Write("<script>alert('please enter your user name.')</script>");
                return false;
            }

            if (Password == "")
            {
                Response.Write("<script>alert('please enter your password.')</script>");
                return false;
            }

            if (confirmPassword == "")
            {
                Response.Write("<script>alert('please enter password for confirmation.')</script>");
                return false;
            }

            if (Password != confirmPassword)
            {
                Response.Write("<script>alert('sorry! password doesn't match.')</script>");
                return false;
            }

            if (yearDropDownList.SelectedIndex == '0' ||
                monthDropDownList.SelectedIndex == '0' ||
                yearDropDownList.SelectedIndex == '0')
            {
                Response.Write("<script>alert('please select your date of birth.')</script>");
                return false;
            }
            else
            {

                DateOfBirth = yearDropDownList.Text + "/"
                              + string.Format("{0}", monthDropDownList.SelectedIndex + 1) + "/"
                              + string.Format("{0}", dayDropDownList.SelectedIndex + 1);
            }

            if (maleRadioButton.Checked)
                Gender = maleRadioButton.Text;
            else if (femaleRadioButton.Checked)
                Gender = femaleRadioButton.Text;
            else
            {
                Response.Write("<script>alert('Please select your gender.');</script>");
                return false;
            }

            if (Email == "")
            {
                Response.Write("<script>alert('please enter your email.')</script>");
                return false;
            }
            if (Contact == "")
            {
                Response.Write("<script>alert('please enter your contact number.')</script>");
                return false;
            }

            return true;
        }

        protected void Load_Dateofbirth()
        {
            List<string> months = new List<string> { "Month", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
            monthDropDownList.DataSource = months;
            monthDropDownList.DataBind();

            yearDropDownList.Items.Add("Year");
            for (int i = 2005; i >= 1880; i--)
            {
                string text = i.ToString();
                yearDropDownList.Items.Add(text);
            }

            dayDropDownList.Items.Add("Day");
            for (int i = 1; i <= 31; i++)
            {
                string text = i.ToString();
                dayDropDownList.Items.Add(text);
            }
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
    }
}